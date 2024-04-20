#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <float.h>
/* #include "mat.h" */
#include "mex.h"


struct NAME_LIST
  {
  unsigned char name[256];
  struct NAME_LIST *next;
};
typedef struct NAME_LIST NAME_LIST;

struct HEADER_FRAME
  {
  unsigned char buf[8192];
  int length;
  struct HEADER_FRAME *next;
};
typedef struct HEADER_FRAME HEADER_FRAME;

struct DATA_FRAME
  {
  float *fbuf;
  double *dbuf;
  int length, data_type;
  struct DATA_FRAME *next;
};
typedef struct DATA_FRAME DATA_FRAME;


int load_data_from_file(char *filename,HEADER_FRAME *first_header_frame,
                        DATA_FRAME *first_data_frame,int *num_signals,
                        int *num_samples);
int fread_int_values(FILE *fp, unsigned int *ibuf, int num_of_bytes);
int fread_char_values(FILE *fp, unsigned char *cbuf, int num_of_bytes);
int fread_float_values(FILE *fp, float *fbuf, int num_of_floats);
int fread_double_values(FILE *fp, double *dbuf, int num_of_doubles);
void print_header_frames(HEADER_FRAME *first_header_frame);
HEADER_FRAME *init_header_frame();
DATA_FRAME *init_data_frame();
int create_data_frame_buf(DATA_FRAME *data_frame);
NAME_LIST *init_name_list();
void print_name_list(NAME_LIST *first_sig_name);
int extract_signal_names(HEADER_FRAME *first_header_frame,int num_sigs,
                         NAME_LIST *first_sig_name);
void free_header_frames(HEADER_FRAME *first_header_frame);
void free_data_frames(DATA_FRAME *first_data_frame);
void free_name_list(NAME_LIST *first_name_list);



void mexFunction(int nlhs, mxArray *plhs[],
                 int nrhs, const mxArray *prhs[])
{
char filename[256];
mxArray *pa1;
mxArray **mat_elem;
double *matData;
const char *field_name[20] = {"name","data"};
int i,j,count;
HEADER_FRAME *first_header_frame;
DATA_FRAME *first_data_frame, *cur_data_frame;
NAME_LIST *first_sig_name, *cur_sig_name;
int num_sigs,num_samples;

first_data_frame = init_data_frame();
first_header_frame = init_header_frame();
first_sig_name = init_name_list();


if (nrhs != 1)
  mexErrMsgTxt("Error: missing filename. Usage:  x = loadsig_cppsim('filename')");
if (!mxIsChar(prhs[0]))
  mexErrMsgTxt("Error: filename must be a string");
if (nlhs != 1)
  mexErrMsgTxt("Error: missing output variable.  Usage:  x = loadsig_cppsim('filename')");

mxGetString(prhs[0],filename,255);


if (load_data_from_file(filename,first_header_frame,first_data_frame,
                        &num_sigs, &num_samples) == -1)
    mexErrMsgTxt("File not read");

extract_signal_names(first_header_frame,num_sigs,first_sig_name);


/* write into MATLAB structure */
plhs[0] = mxCreateStructMatrix(num_sigs,1,2,field_name);


/* copy signal name */
cur_sig_name = first_sig_name;
for (i = 0; i < num_sigs; i++)
    {
     pa1 = mxCreateString(cur_sig_name->name);
     mxSetField(plhs[0],i,field_name[0],pa1);
     cur_sig_name = cur_sig_name->next;  
    }

/* copy data */
if ((mat_elem = (mxArray **) mxCalloc(num_sigs,sizeof(mxArray *))) == NULL)   
    {   
     mexPrintf("error in loadsig_cppsim:  calloc call failed - \n");   
     mexPrintf("  not enough memory!!\n");   
     return;   
    }   
for (i = 0; i < num_sigs; i++)   
     mat_elem[i] = mxCreateDoubleMatrix(num_samples,1,mxREAL);

cur_data_frame = first_data_frame;

count = 0;
for (j = 0; j < num_samples; j++)
  {
   for (i = 0; i < num_sigs; i++)
      {
	if (count == cur_data_frame->length)
	  {
	    cur_data_frame = cur_data_frame->next;
	    if (cur_data_frame == NULL)
	      {
		mexPrintf("error: data frame too short!\n");
		return;
	      }
            count = 0;
	  }
        matData = mxGetPr(mat_elem[i]);
	if (cur_data_frame->data_type == 32)
           matData[j] = cur_data_frame->fbuf[count];
        else
           matData[j] = cur_data_frame->dbuf[count];
        count++;
      }
  }

for (i = 0; i < num_sigs; i++)
    mxSetField(plhs[0],i,field_name[1],mat_elem[i]);

free_header_frames(first_header_frame);
free_data_frames(first_data_frame);
free_name_list(first_sig_name);


return;
}



int load_data_from_file(char *filename,HEADER_FRAME *first_header_frame,
                        DATA_FRAME *first_data_frame,int *num_signals,
                        int *num_samples)
{
int i,j, num_sigs;
char num_sigs_text[5],output_version[5];
int status, data_type, buf_length, buf_length_confirm, buf_length_actual;
unsigned int ibuf[20];
HEADER_FRAME *cur_header_frame;
DATA_FRAME *cur_data_frame;
FILE *fid;
int data_frame_count, buf_length_float, buf_length_double;
int num_sample_points, remainder, last_buf_length;
unsigned char temp_buf[1000];
int found_header_flag, found_data_flag, data_64_flag;

cur_data_frame = NULL;
cur_header_frame = NULL;
data_64_flag = 0;

if ((fid = fopen(filename,"rb")) == NULL)   
  {
    mexErrMsgTxt("Error:  file can't be opened");
  }

/*****************  read in header ******************/

data_frame_count = 0;
found_header_flag = 0;
found_data_flag = 0;

while(1)
   {
   /*   read in whether header or data (header:  112, data: 128)   */
   /*   and buffer length of next data segment   */

   if (fread_int_values(fid, ibuf, 16) != 16) 
       {
       status = -1;
       break;
       }
   data_type = ibuf[1]; 
   buf_length = ibuf[3]; 

   /* mexPrintf("data_type = %d, buf_length = %d\n",data_type,buf_length); */
   if (data_type == 112)
     {
      /*    read current header segment   */
      if (cur_header_frame == NULL)
	  {
          cur_header_frame = first_header_frame;
	  }
      else
          {
	  cur_header_frame->next = init_header_frame();
	  cur_header_frame = cur_header_frame->next;
          }

      buf_length_actual = fread_char_values(fid, cur_header_frame->buf, 
	      buf_length);

      cur_header_frame->length = buf_length_actual;
      if (buf_length_actual != buf_length) 
          {
	  status = -1;
  	  break;
          }

      if (found_header_flag == 0)
	{
         for (i = 16; i < 20; i++)
            output_version[i-16] = first_header_frame->buf[i];
         output_version[4] = '\0';

         /* mexPrintf("num_sigs = %d, output_version = %s\n",num_sigs,output_version); */

         if (strcmp(output_version,"9601") != 0)
            {
             if (strcmp(output_version,"9602") == 0)
                data_64_flag = 1;
             else
               {
                mexPrintf("Error: output file must be Hspice version 9601\n");
                mexPrintf("       (or 9602 for CppSim 64-bit data)\n");
                return(-1);
               }
            }
         found_header_flag = 1;
	}
     }
   else if (data_type == 128)
     {
       if (found_header_flag == 0)
	 {
          mexPrintf("Error: did not find header in CppSim output file\n");
          return(-1);
	 }
      found_data_flag = 1;

      data_frame_count++;
      /*    read current data segment   */
      if (cur_data_frame == NULL)
          cur_data_frame = first_data_frame;
      else
          {
	  cur_data_frame->next = init_data_frame();
	  cur_data_frame = cur_data_frame->next;
          }

      if (data_64_flag == 0) /* 32-bit data */
	{
	 cur_data_frame->data_type = 32;
         if (create_data_frame_buf(cur_data_frame) == 0)
	    return(-1);
         buf_length_float = buf_length/4;
         /*  mexPrintf("buf_length_float = %d\n",buf_length_float);  */
         buf_length_actual = fread_float_values(fid, cur_data_frame->fbuf, 
                                                buf_length_float);
         cur_data_frame->length = buf_length_actual;
         /*      mexPrintf("buf_length_actual = %d\n",buf_length_actual);   */
         if (buf_length_actual != buf_length_float) 
           {
	    /*	    mexPrintf("data_frame_count = %d, buf_length = %d\n",
		    data_frame_count, buf_length_actual); */
	    status = -1;
  	    break;
           }
	}
      else /* 64-bit data */
	{
	 cur_data_frame->data_type = 64;
         if (create_data_frame_buf(cur_data_frame) == 0)
	    return(-1);
         buf_length_double = buf_length/8;
         /*  mexPrintf("buf_length_double = %d\n",buf_length_double);  */
         buf_length_actual = fread_double_values(fid, cur_data_frame->dbuf, 
                                                buf_length_double);
         cur_data_frame->length = buf_length_actual;
         /*      mexPrintf("buf_length_actual = %d\n",buf_length_actual);   */
         if (buf_length_actual != buf_length_double) 
           {
	    /*	    mexPrintf("data_frame_count = %d, buf_length = %d\n",
		    data_frame_count, buf_length_actual); */
	    status = -1;
  	    break;
           }
	}
     }
   else
     {
       mexPrintf("Error:  unrecognized data type segment\n");
       return(-1);
     }
/* grab end of current buffer segment and check that data is OK */

   if (fread_int_values(fid,ibuf, 4) != 4) 
       {
	status = -1;
	break;
       } 
   buf_length_confirm = ibuf[0]; 
   /*   mexPrintf("buf_length_confirm = %d\n",buf_length_confirm); */

   if (buf_length != buf_length_confirm)
     {
      mexPrintf("error in read_in_data:  buf_length not equal to buf_length_confirm\n");
      return(-1);
     } 
   }
if (found_header_flag == 0 || found_data_flag == 0)
   {
     mexPrintf("Error:  attempt to read file was unsuccessful\n");
     return(-1);
   }

last_buf_length = buf_length_actual;

for (i = 0; i < 4; i++)
    num_sigs_text[i] = first_header_frame->buf[i];
num_sigs_text[4] = '\0';

num_sigs = atoi(num_sigs_text);




num_sample_points = (data_frame_count-1)*2048 + last_buf_length;
remainder = num_sample_points % num_sigs;
num_sample_points = (num_sample_points - remainder)/num_sigs;

/* mexPrintf("num_sample_points = %d\n",num_sample_points);  */

/* print_header_frames(first_header_frame); */

*num_samples = num_sample_points;
*num_signals = num_sigs;
fclose(fid);
return(0);
}

int extract_signal_names(HEADER_FRAME *first_header_frame,int num_sigs,
                         NAME_LIST *first_sig_name)
{
int i, j, k, count;
HEADER_FRAME *cur_header_frame;
NAME_LIST *cur_sig_name;

cur_sig_name = NULL;

cur_header_frame = first_header_frame;
count = 0;
while(cur_header_frame != NULL)
  {
   if (cur_header_frame == first_header_frame)
      i = 264;
   else
      i = 0;

   for (   ; i < cur_header_frame->length; i++)
      {
      if (count == num_sigs)
          break;
      if (cur_header_frame->buf[i] == '1')
          count++;
      }
   if (count == num_sigs)
     {
       i++;
       break;
     }
   cur_header_frame = cur_header_frame->next;
  }
if (count != num_sigs)
   {
    mexPrintf("error:  not enough 1 entries!\n");
    return;
   }

for (j = 0; j < num_sigs; j++)
  {
   k = i;
   while(1)
     {
      if (k == cur_header_frame->length)
	{
	  if (cur_header_frame->next != NULL)
	     {
	      cur_header_frame = cur_header_frame->next;
              k = 0;
	     }
          else
	      break;
	}
      if (cur_header_frame->buf[k] != ' ')
           break;
      k++;
     }  

   i = k;
   if (cur_sig_name == NULL)
       cur_sig_name = first_sig_name;
   else
     {
       cur_sig_name->next = init_name_list();
       cur_sig_name = cur_sig_name->next;
     }
   k = i;
   while(1)
     {
      if (k == cur_header_frame->length)
	{
	 if (cur_header_frame->next != NULL)
	   {
	     cur_header_frame = cur_header_frame->next;
             i = i-k;
             k = 0;
	   }
         else
	     break;
	}

      if (cur_header_frame->buf[k] == ' ')
         break;
      if (cur_header_frame->buf[k] != '.')
         cur_sig_name->name[k-i] = cur_header_frame->buf[k];
      else
         cur_sig_name->name[k-i] = '_';
      k++;
     }
   cur_sig_name->name[k-i] = '\0';
   i = k;
  }
return(0);
}

void print_header_frames(HEADER_FRAME *first_header_frame)
{
HEADER_FRAME *cur_header_frame;
int i;

cur_header_frame = first_header_frame;

while (cur_header_frame != NULL)
   {
     for (i = 0; i < cur_header_frame->length; i++)
        mexPrintf("%c",(char) cur_header_frame->buf[i]);
     mexPrintf("\n");
     cur_header_frame = cur_header_frame->next;
   }   
}

void print_name_list(NAME_LIST *first_sig_name)
{
NAME_LIST *cur_sig_name;

cur_sig_name = first_sig_name;

while (cur_sig_name != NULL)
   {
     mexPrintf("%s\n",cur_sig_name->name);
     cur_sig_name = cur_sig_name->next;
   }   
}


int fread_int_values(FILE *fp, unsigned int *ibuf, int num_of_bytes)
  {
   unsigned char *charbuf;
   int i, num_int_values;
   size_t bytes_read;

   num_int_values = num_of_bytes/4;

   if ((charbuf = (unsigned char *) mxCalloc(num_of_bytes,sizeof(unsigned char))) == NULL)   
         {   
          mexPrintf("error in 'fread_int_values':  mxCalloc call failed - \n");   
          mexPrintf("  not enough memory!!\n");   
          return(-1);   
        }   

   bytes_read = fread(charbuf, sizeof(unsigned char),num_of_bytes, fp);

   for (i = 0; i < num_int_values; i++)
      {
         ibuf[i] = charbuf[i*4]*(1<<24) + charbuf[i*4+1]*(1<<16) 
                     + charbuf[i*4+2]*(1<<8) + charbuf[i*4+3];
      }
   mxFree(charbuf);
   return((int) bytes_read);
  }

int fread_char_values(FILE *fp, unsigned char *cbuf, int num_of_bytes)
  {
   size_t bytes_read;

   bytes_read = fread(cbuf, sizeof(unsigned char),num_of_bytes, fp);

   return((int) bytes_read);
  }

int fread_float_values(FILE *fp, float *fbuf, int num_of_floats)
  {
   size_t floats_read;

   floats_read = fread(fbuf, sizeof(float),num_of_floats, fp);

   return((int) floats_read);
  }

int fread_double_values(FILE *fp, double *dbuf, int num_of_doubles)
  {
   size_t double_read;

   double_read = fread(dbuf, sizeof(double), num_of_doubles, fp);

   return((int) double_read);
  }


HEADER_FRAME *init_header_frame()
{
HEADER_FRAME *A; 
   
if ((A = (HEADER_FRAME *) mxCalloc(1,sizeof(HEADER_FRAME))) == NULL)   
   {   
   mexPrintf("error in 'init_header_frame':  mxCalloc call failed\n");   
   mexPrintf("out of memory!\n");   
   return(NULL);   
  }   
A->length = 8192;
A->next = NULL;
return(A);
}

DATA_FRAME *init_data_frame()
{
DATA_FRAME *A; 
   
if ((A = (DATA_FRAME *) mxCalloc(1,sizeof(DATA_FRAME))) == NULL)   
   {   
   mexPrintf("error in 'init_data_frame':  mxCalloc call failed\n");   
   mexPrintf("out of memory!\n");   
   return(NULL);   
  }
A->data_type = 32;
A->fbuf = NULL;
A->dbuf = NULL;   
A->length = 2048;
A->next = NULL;
return(A);
}

int create_data_frame_buf(DATA_FRAME *data_frame)
{
if (data_frame->data_type == 32)   
  {
   if ((data_frame->fbuf = (float *) mxCalloc(2048,sizeof(float))) == NULL)   
      {   
      mexPrintf("error in 'create_data_frame_buf':  mxCalloc call failed\n");   
      mexPrintf("out of memory!\n");   
      return(0);   
      }
  }   
else
  {
   if ((data_frame->dbuf = (double *) mxCalloc(2048,sizeof(double))) == NULL)   
      {   
      mexPrintf("error in 'create_data_frame_buf':  mxCalloc call failed\n");   
      mexPrintf("out of memory!\n");   
      return(0);   
      }
  }   
return(2048);
}

NAME_LIST *init_name_list()
{
NAME_LIST *A; 
   
if ((A = (NAME_LIST *) mxCalloc(1,sizeof(NAME_LIST))) == NULL)   
   {   
   mexPrintf("error in 'init_name_list':  mxCalloc call failed\n");   
   mexPrintf("out of memory!\n");   
   return(NULL);   
  }   
A->next = NULL;
return(A);
}

void free_header_frames(HEADER_FRAME *first_header_frame)
{
HEADER_FRAME *cur_header_frame, *prev_header_frame;

cur_header_frame = first_header_frame;

while(cur_header_frame != NULL)
   {
    prev_header_frame = cur_header_frame;
    cur_header_frame = cur_header_frame->next;
    mxFree(prev_header_frame);
   }
}

void free_data_frames(DATA_FRAME *first_data_frame)
{
DATA_FRAME *cur_data_frame, *prev_data_frame;

cur_data_frame = first_data_frame;

while(cur_data_frame != NULL)
   {
    prev_data_frame = cur_data_frame;
    cur_data_frame = cur_data_frame->next;
    mxFree(prev_data_frame);
   }
}

void free_name_list(NAME_LIST *first_name_list)
{
NAME_LIST *cur_name_list, *prev_name_list;

cur_name_list = first_name_list;

while(cur_name_list != NULL)
   {
    prev_name_list = cur_name_list;
    cur_name_list = cur_name_list->next;
    mxFree(prev_name_list);
   }
}
