/*
 * loadsig.c: retrieval of HSPICE data into MATLAB
 *   written by Michael Perrott while at Silicon
 *   Laboratories.  This code leveraged the work of
 *   Stephen G. Tell (i.e., his Gwave viewer) to
 *   develop the Hspice loading functions.  At this
 *   point, the code here has little similarity to the
 *   routines he provided, but many thanks to Stephen
 *   for providing enough info to get started.
 *   For those wishing to modify this code - good luck!
 *   Unfortunatley, it is quite "hacked" due 
 *   to the fact that the actual binary format of Hspice output
 *   was never provided (i.e., I simply updated the
 *   code each time a new issue was found), and due to the
 *   fact that I had little time to develop it.  However,
 *   after years of use, it's pretty solid now.  
 *
 *   To compile this code into a mex file for Matlab, simply
 *   run Matlab in the directory that loadsig.c is contained
 *   and then type:
 *   mex loadsig.c
 *   You'll then have a loadsig mex function for whatever 
 *   computer (i.e., Sun, Linux, Windows) that you're running 
 *   on at the time.
 *
 *   I do ask for one thing for those that use this code - please
 *   keep my name and Silicon Labs attached to it when the user
 *   first executes it (as currently done).  I am not particularly
 *   interested in getting anything for this package other then 
 *   recognition, but I do want that since this was a nontrivial 
 *   amount of work.  Of course, if you want to throw money at me,
 *   I'm happy to accomodate you. :)  - Michael Perrott 6/3/03
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the MxFree
 * Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 */


#define MAX_NAME_LENGTH 1000
#define MAX_HEADER_BLOCKS 100
#define TIME 1
#define FREQUENCY 4
#define VOLTAGE 2
#define CURRENT 3
#define UNKNOWN 0
#define TR_ANALYSIS 0
#define AC_ANALYSIS 1
#define DC_ANALYSIS 2
#define OP_ANALYSIS 3
#define NOISE_ANALYSIS 4

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <float.h>
/* #include "mat.h" */
#include "mex.h"
 
typedef struct  
  {  
   char **signal_name, **sweep_name;
   int  *signal_type;  /* i.e. FREQ, TIME, VOLTAGE ... */
   int analysis_type;  /* i.e., AC, DC, TR, OP - only used for ngspice */
   int operating_point_flag; /* only used for ngspice */
   int num_signals, num_data_rows, num_data_cols, nauto;
   int current_column, cur_sweep, num_sweeps, num_sweep_vars, num_sweep_names;
   int *signal_first_row,*signal_num_rows;
   double **signal_data, **sweep_data;
   int block_size;
} SpiceData;  


int fread_float_values(char *simsource,float *fval, FILE *fp);
size_t fread_int_values(char *simsource, unsigned int *ibuf, 
                        int size_of_block, FILE *fp);
int hs_determine_variables(FILE *fp, SpiceData *sf, char *simsource);
void hs_process_header(char *line, SpiceData *sf);
int hs_read_column(FILE *fp, SpiceData *sf, char *simsource);
SpiceData *init_SpiceData(int num_signals, int nauto, int num_data_rows, int num_data_cols, int num_sweeps, int num_sweep_vars, int num_sweep_names, int block_size, int operating_point_flag);
int hs_determine_num_data_rows(char *line, int num_signals, int nauto, 
    int *ind_sig_type, int num_sweep_names, int *num_sweep_vars);
SpiceData *hs_allocate_sf(FILE *fp, char *simsource);
int hs_validate_column(FILE *fp, int num_data_rows, int current_column, int num_sweep_vars, int block_size, char *simsource, int col_count);
void free_SpiceData(SpiceData *A);

/******************************************************/
#define BSIZE_SP 512
SpiceData *ngsp_allocate_sf(FILE *fp, char *simsource);
int ngsp_determine_variables(FILE *fp, SpiceData *sf, char *simsource);
int ngsp_read_column(FILE *fp, SpiceData *sf, char *simsource);
int fread_double_values(char *simsource,double *fval, FILE *fp);
/******************************************************/



void mexFunction(int nlhs, mxArray *plhs[],
                 int nrhs, const mxArray *prhs[])
{
SpiceData *sf;
FILE *fp;
int i,j,k,m,sweep_name_num, ngspice_flag,ival;
int ng_sweep_count, ng_sweep_sign_flag;
double ng_cur_val, ng_prev_val;
float val;
/* char name[MAX_NAME_LENGTH],filename[MAX_NAME_LENGTH]; */
char filename[MAX_NAME_LENGTH], simsource[MAX_NAME_LENGTH];
mxArray *pa1;
double *matData;
const char *field_name[20] = {"name","data"};
static int first_run=0;



/* mexPrintf("field_name = %s, %s\n",field_name[0],field_name[1]); */

if (nrhs != 1)
  mexErrMsgTxt("Error: missing filename. Usage:  x = loadsig('filename')");
if (!mxIsChar(prhs[0]))
  mexErrMsgTxt("Error: filename must be a string");
if (nlhs != 1)
  mexErrMsgTxt("Error: missing output variable.  Usage:  x = loadsig('filename')");

mxGetString(prhs[0],filename,MAX_NAME_LENGTH);

if (first_run == 0)
  {
   first_run = 1;
   mexPrintf("\n*********************************************************\n");
   mexPrintf("               Hspice Toolbox for Matlab\n");
   mexPrintf(" written by Michael Perrott (http://www-mtl.mit.edu/~perrott)\n");
   mexPrintf("   while at Silicon Laboratories (http://www.silabs.com)\n");
   mexPrintf("     Copyright (C) 1999 by Silicon Laboratories, Inc.\n");
   mexPrintf("     This software is distributed under the terms of\n");
   mexPrintf("       the GNU Public License (see the COPYING file\n");
   mexPrintf("  for more details), and comes with no warranty or support\n");
   mexPrintf("*********************************************************\n\n");
  }

if ((fp = fopen(filename,"rb")) == NULL)   
   mexErrMsgTxt("Error:  file can't be opened");


sf = ngsp_allocate_sf(fp,simsource);
if (sf == NULL)
   {
   sf = hs_allocate_sf(fp,simsource);
   ngspice_flag = 0;
   }
else
   {
   ngspice_flag = 1;
   }
/*
mexPrintf("num_data_cols = %d, num_data_rows = %d, num_signals = %d\n",
   sf->num_data_cols, sf->num_data_rows, sf->num_signals);
mexPrintf("current_col = %d\n",sf->current_column);
*/

if (sf == NULL)
   return;

if (ngspice_flag == 0)
   {
   if (hs_determine_variables(fp,sf,simsource) == 0)
      return;
   }
else
   {
   if (ngsp_determine_variables(fp,sf,simsource) == 0)
      return;
   }


/*
mexPrintf("num_data_cols = %d, num_data_rows = %d, num_signals = %d\n",
   sf->num_data_cols, sf->num_data_rows, sf->num_signals);
mexPrintf("current_col = %d\n",sf->current_column);
*/

for (k = 0; k < sf->num_signals; k++)
  {
   for (i = 0; sf->signal_name[k][i] != '\0'; i++)
      if (sf->signal_name[k][i] == '.' || sf->signal_name[k][i] == '(' ||
          sf->signal_name[k][i] == ')' || sf->signal_name[k][i] == '+' ||
          sf->signal_name[k][i] == '[' || sf->signal_name[k][i] == ']' ||
          sf->signal_name[k][i] == '-' || sf->signal_name[k][i] == '*' ||
          sf->signal_name[k][i] == '#' ||
          sf->signal_name[k][i] == '/' || sf->signal_name[k][i] == ',')
         sf->signal_name[k][i] = '_';
   /*
   if (k == 0)
      sprintf(name,"i");
   else
      sprintf(name,"d");
   switch(sf->signal_type[k]) 
      {
      case TIME:
		strcat(name,"t_");
		break;
      case FREQUENCY:
                strcat(name,"f_");
		break;
      case VOLTAGE:
		strcat(name,"v_");
		break;
      case CURRENT:
		strcat(name,"i_");
		break;
      default:
		strcat(name,"u_");
		break;
      }
   strncat(name,sf->signal_name[k],MAX_NAME_LENGTH-3);
   sprintf(sf->signal_name[k],"%s",name);
   */
  }

/***
for (i = 0; i < sf->num_signals; i++)
   mexPrintf("%s, type = %d, first_row = %d, num_rows = %d\n",
       sf->signal_name[i], sf->signal_type[i],
       sf->signal_first_row[i], sf->signal_num_rows[i]);
mexPrintf("num_signals = %d, nauto = %d\n",
        sf->num_signals, sf->nauto);
mexPrintf("num_data_rows = %d, num_data_cols = %d, current_column = %d\n",
        sf->num_data_rows, sf->num_data_cols, sf->current_column);
***/



if (ngspice_flag == 0) /* read in hspice or cppsim data */
   {
   for (k = 0; k < sf->num_sweeps; k++)
     {
      sf->cur_sweep = k;
      sf->current_column = 0;
      if (k > 0)
        {
        while(1)
          {
          if (fread_float_values(simsource,&val, fp) != 1)
	    {
             mexPrintf("error: premature file end\n");
             return;
	    }
          if (strncmp(simsource,"hspice",6) == 0)
	    {
             if (val >= (1e30 - DBL_EPSILON))
	       {
                fseek(fp,16,SEEK_CUR);
	        if(fread_int_values(simsource,&ival, 1, fp) == 1) 
		  sf->block_size = (ival/sizeof(float)) - 1;
                break;
	       }
	    } 
          }
        }
      for (i = 0; i < sf->num_data_cols; i++)
        {
         if(hs_read_column(fp,sf,simsource) == 1)
	   {
            mexPrintf("error:  premature break\n");
            break;
	   }
        }
     }
   }
else /* read in ngspice data */
   {
   for (k = 0; k < sf->num_sweeps; k++)
     {
      sf->cur_sweep = k;
      sf->current_column = 0;
      for (i = 0; i < sf->num_data_cols; i++)
        {
         if(ngsp_read_column(fp,sf,simsource) == 1)
	   {
            mexPrintf("error:  premature break\n");
            break;
	   }
        }
     }
   }
fclose(fp);

if (ngspice_flag == 1)
   {
   if (sf->num_sweeps != 1)
       {
	mexPrintf("Error in 'main': num_sweeps != 1 for ngspice\n");
        mexErrMsgTxt("error trying to read in ngspice raw file");
       }
   if (sf->num_sweep_vars != 0)
       {
	mexPrintf("Error in 'main': num_sweep_vars != 0 for ngspice\n");
        mexErrMsgTxt("error trying to read in ngspice raw file");
       }
   j = 0;
   k = 0; /* only look at first signal (i.e., TIME, FREQUENCY, or DC sweep value) */
   m = 0; /* only one sweep initially for ngspice */
   ng_prev_val = 0.0;
   ng_sweep_count = 1;
   ng_sweep_sign_flag = 1;
   for (i = 0; i < sf->num_data_cols; i++)   
       {
        ng_cur_val = sf->signal_data[sf->signal_first_row[k]+j+m*sf->num_data_rows][i];
	if (i == 1)
	  {
	    ng_sweep_sign_flag = (ng_cur_val > ng_prev_val) ? 1 : -1;
	  }
	if (ng_sweep_sign_flag == 1)
	  {
	   if (i > 0 && ng_cur_val < ng_prev_val)
	      ng_sweep_count++;
	  }
	else
	  {
	   if (i > 0 && ng_cur_val > ng_prev_val)
	      ng_sweep_count++;
	  }
	ng_prev_val = ng_cur_val;
       }
   /* mexPrintf("ng_sweep_count = %d, num_data_cols = %d\n",ng_sweep_count,sf->num_data_cols); */
   if (ng_sweep_count > 1)
     {
      sf->num_sweeps = ng_sweep_count;
      sf->num_data_cols = (sf->num_data_cols)/ng_sweep_count;
     }
   /* mexPrintf("---> num_data_cols = %d\n",sf->num_data_cols); */
   }

/* write into MATLAB structure */
plhs[0] = mxCreateStructMatrix(sf->num_signals+sf->num_sweep_vars,1,2,field_name);

/*
mexPrintf("num fields = %d\n",mxGetNumberOfFields(plhs[0]));
mexPrintf("size = %d\n",mxGetN(plhs[0])*mxGetM(plhs[0]));
for (i = 0; i < 2; i++)
  mexPrintf("field name = %s\n",mxGetFieldNameByNumber(plhs[0],i));
*/

j = 0;
for (k = 0; k < sf->num_signals; k++)
    {
     /* copy over the signal name to the structure */
     pa1 = mxCreateString(sf->signal_name[k]);  
     mxSetField(plhs[0],k,field_name[0],pa1);

     if (sf->signal_num_rows[k] == 1)
        pa1 = mxCreateDoubleMatrix(sf->num_data_cols,sf->num_sweeps,mxREAL);
     else
        pa1 = mxCreateDoubleMatrix(sf->num_data_cols,sf->num_sweeps,mxCOMPLEX);

     /* copy over the spice data to the matlab matrix */
     matData = mxGetPr(pa1);
     if (ngspice_flag != 1)
        j = 0;
     for (i = 0; i < sf->num_data_cols; i++)   
       {
        for (m = 0; m < sf->num_sweeps; m++)
          {
	   if (ngspice_flag == 1)
	       {
	        matData[i + m*sf->num_data_cols] = 
                   sf->signal_data[sf->signal_first_row[k]+j][i+ m*sf->num_data_cols];
	       }
	   else
	       {
	        matData[i + m*sf->num_data_cols] = 
                   sf->signal_data[sf->signal_first_row[k]+j+m*sf->num_data_rows][i];
	       }
          }   
       }
     if (sf->signal_num_rows[k] == 2)
       {
       /* mexPrintf("complex for k = %d\n",k); */
        matData = mxGetPi(pa1);
	if (ngspice_flag == 1)
           j++; /* second data row */
        else
	   j = 1;
        for (i = 0; i < sf->num_data_cols; i++)   
          {
          for (m = 0; m < sf->num_sweeps; m++)
            {
	      if (ngspice_flag == 1)
		{
	         matData[i + m*sf->num_data_cols] = 
                    sf->signal_data[sf->signal_first_row[k]+j][i + m*sf->num_data_cols];
		}
	      else
		{
	         matData[i + m*sf->num_data_cols] = 
                    sf->signal_data[sf->signal_first_row[k]+j+m*sf->num_data_rows][i];
		}
            }   
          }
       }
        mxSetField(plhs[0],k,field_name[1],pa1);
    }

if (ngspice_flag == 1 && sf->num_sweeps > 1)
   {
     sf->num_data_cols = (sf->num_data_cols)*(sf->num_sweeps);
     sf->num_sweeps = 1;
   }

/* copy sweep parameters */

for (sweep_name_num = 0; k < sf->num_signals+sf->num_sweep_vars; k++, sweep_name_num++)
    {
     /* copy over the sweep parameter name to the structure */
     pa1 = mxCreateString(sf->sweep_name[sweep_name_num]); 
     mxSetField(plhs[0],k,field_name[0],pa1);

     pa1 = mxCreateDoubleMatrix(1,sf->num_sweeps,mxREAL);

     /* copy over the spice data to the matlab matrix */
     matData = mxGetPr(pa1);
     for (i = 0; i < sf->num_sweeps; i++)   
       {
	matData[i] = sf->sweep_data[sweep_name_num][i];
       }
     mxSetField(plhs[0],k,field_name[1],pa1);
    }

free_SpiceData(sf);
return;
}

int ngsp_determine_variables(FILE *fp, SpiceData *sf, char *simsource)
{
int data_valid_flag, record_variables_flag, count, i;
int complex_data_flag;
char buf[BSIZE_SP], signal_name[BSIZE_SP], temp_name[BSIZE_SP];
char *pch;

rewind(fp);

data_valid_flag = 0;
record_variables_flag = 0;
complex_data_flag = 0;

while (fgets(buf, BSIZE_SP, fp)) 
   {
     if (strncmp(buf,"Plotname: ",10) == 0)
       {
	 if (data_valid_flag == 1)
 	   break;

	 if (strncmp(&buf[10],"DC transfer characteristic",26) == 0)
	   {
	   sf->analysis_type = DC_ANALYSIS;
	   data_valid_flag = 1;
	   /*  mexPrintf("found DC transfer (init)\n"); */
	   }
	 else if (strncmp(&buf[10],"AC Analysis",11) == 0)
	   {
	   sf->analysis_type = AC_ANALYSIS;
	   data_valid_flag = 1;
	   /* mexPrintf("found AC transfer (init)\n"); */
	   }
	 else if (strncmp(&buf[10],"Noise Spectral Density",22) == 0)
	   {
	   sf->analysis_type = NOISE_ANALYSIS;
	   data_valid_flag = 1;
	   /* mexPrintf("found NOISE (init)\n"); */
	   }
	 else if (strncmp(&buf[10],"Transient Analysis",18) == 0)
	   {
	   sf->analysis_type = TR_ANALYSIS;
	   data_valid_flag = 1;
	   /* mexPrintf("found TR transfer (init)\n"); */
	   }
	 else if (strncmp(&buf[10],"Operating Point",15) == 0)
	   {
	   sf->analysis_type = OP_ANALYSIS;
	   if (sf->operating_point_flag == 1)
	      data_valid_flag = 1;
	   else
	      data_valid_flag = 0;
	   /* mexPrintf("found Operating Point (init)\n"); */
	   }
       }
     else if (data_valid_flag == 1)
       {
        if (strncmp(buf,"Variables:",10) == 0)
          {
           record_variables_flag = 1;
	   count = 0;
          }
        else if (strncmp(buf,"Binary:",7) == 0)
          {
	    break;
          }
        else if (strncmp(buf,"Flags: ",7) == 0)
          {
	    if (strncmp(&buf[7],"complex",7) == 0)
	      {
		if (sf->analysis_type != AC_ANALYSIS)
		  {
		    mexPrintf("Error:  complex data encountered but not AC analysis\n");
                    mexErrMsgTxt("error trying to read in ngspice raw file");
		  }
		complex_data_flag = 1;
		/* mexPrintf("found complex data!! (init)\n"); */
	      }

          }
	else if (record_variables_flag == 1)
	  {
	    if (count < sf->num_signals)
	      {
		pch = strtok(buf," \t");
		if (count != atoi(pch))
		  {
		    mexPrintf("Error:  variable list in ngspice rawfile is not numbered correctly\n");
                    mexErrMsgTxt("error trying to read in ngspice raw file");
		  }
		pch = strtok(NULL," \t");
		strcpy(signal_name,pch);
		pch = strtok(NULL," \t\n");
		if (strcmp(pch,"voltage") == 0)
		  {
		    /* mexPrintf("complex_data_flag == %d\n",complex_data_flag); */
		    if (strcmp(signal_name,"v(i-sweep)") == 0)
		       sf->signal_type[count] = CURRENT;
		    else
		       sf->signal_type[count] = VOLTAGE;
		    if (complex_data_flag == 1)
                       sf->signal_num_rows[count] = 2;
                    else
                       sf->signal_num_rows[count] = 1;

		    strcpy(temp_name,signal_name);
		    if (strncmp(temp_name,"v(",2) == 0)
		      {
		      strcpy(signal_name,&temp_name[2]);
		      for (i = 0; signal_name[i] != '\0'; i++);
		      i--;
		      if (signal_name[i] != ')')
			{
		          mexPrintf("Error:  voltage_signal '%s' is not labeled correctly\n", temp_name);
                          mexErrMsgTxt("error trying to read in ngspice raw file");
			}
		      signal_name[i] = '\0';
		      }
		    else
		      strcpy(signal_name,&temp_name[2]);
		  }
		else if (strcmp(pch,"current") == 0)
		  {
		    sf->signal_type[count] = CURRENT;
		    if (complex_data_flag == 1)
                       sf->signal_num_rows[count] = 2;
                    else
                       sf->signal_num_rows[count] = 1;

		    if (strncmp(signal_name,"i(",2) == 0)
		      {
		      signal_name[1] = '_';
		      for (i = 0; signal_name[i] != '\0'; i++);
		      i--;
		      if (signal_name[i] != ')')
			{
		          mexPrintf("Error:  current_signal '%s' is not labeled correctly\n", temp_name);
                          mexErrMsgTxt("error trying to read in ngspice raw file");
			}
		      signal_name[i] = '\0';
		      }
		    else
		      strcpy(signal_name,&temp_name[2]);
		  }
		else if (strcmp(pch,"frequency") == 0)
		  {
		    if (strcmp(signal_name,"frequency") != 0)
		      {
			mexPrintf("Error:  frequency signal name must be 'frequency'\n");
			mexPrintf("        instead of '%s'\n",signal_name);
                        mexErrMsgTxt("error trying to read in ngspice raw file");
		      }
		    strcpy(signal_name,"FREQUENCY");
		    sf->signal_type[count] = FREQUENCY;
                    sf->signal_num_rows[count] = 1;
		  }
		else if (strcmp(pch,"time") == 0)
		  {
		    if (strcmp(signal_name,"time") != 0)
		      {
			mexPrintf("Error:  time signal name must be 'time'\n");
			mexPrintf("        instead of '%s'\n",signal_name);
                        mexErrMsgTxt("error trying to read in ngspice raw file");
		      }
		    strcpy(signal_name,"TIME");
		    sf->signal_type[count] = TIME;
                    sf->signal_num_rows[count] = 1;
		  }
		else
		  {
		    sf->signal_type[count] = UNKNOWN;
		    if (complex_data_flag == 1)
                       sf->signal_num_rows[count] = 2;
                    else
                       sf->signal_num_rows[count] = 1;
		  }
		if (signal_name[0] == '@')
		  {
		  strcpy(temp_name,&signal_name[1]);
		  for(i = 0; temp_name[i] != '\0'; i++)
		    {
		      if (temp_name[i] == '[')
			temp_name[i] = '_';
		      else if (temp_name[i] == ']')
			temp_name[i] = ' ';
		    }
		  for (i--; temp_name[i] == ' '; i--);
		  temp_name[i+1] = '\0';
		  strcpy(signal_name,temp_name);
		  }
		if (count == 0)
		  {
		    if (sf->signal_type[count] == VOLTAGE)
		      strcpy(signal_name,"VOLTAGE");
		    else if (sf->signal_type[count] == CURRENT)
		      strcpy(signal_name,"CURRENT");
		  }
		strcpy(sf->signal_name[count],signal_name);
	        sf->signal_first_row[count] = count;
	      }
	    count++;
	    if (count == sf->num_signals)
	       record_variables_flag = 0;
	  }
       }
   }

return(1);
}


SpiceData *ngsp_allocate_sf(FILE *fp, char *simsource)
{
int num_signals,nauto,data_rows,data_cols;
int sweep_count,nsweep_var,nsweep_names,block_size;
int data_valid_flag, complex_data_flag, operating_point_flag;
char buf[BSIZE_SP];

/* probably not necessary to rewind, but just to make sure ... */
rewind(fp);
fgets(buf, BSIZE_SP, fp);
if (strncmp(buf,"Title: ",7) != 0)
   return(NULL);

rewind(fp);

 nauto = 0;
 num_signals = -1;
 data_rows = -1;
 data_cols = -1;
 sweep_count = 1;
 nsweep_var = 0;
 nsweep_names = 0;
 block_size = -1;

 data_valid_flag = 0;
 complex_data_flag = 0;
 operating_point_flag = 0;

while (fgets(buf, BSIZE_SP, fp)) 
   {
     if (strncmp(buf,"Plotname: ",10) == 0)
       {
	 if (data_valid_flag == 1)
	    break;

	 if (strncmp(&buf[10],"DC transfer characteristic",26) == 0)
	   {
	   data_valid_flag = 1;
	   /* mexPrintf("found DC transfer\n"); */
	   }
	 else if (strncmp(&buf[10],"AC Analysis",11) == 0)
	   {
	   data_valid_flag = 1;
	   /* mexPrintf("found AC transfer\n"); */
	   }
	 else if (strncmp(&buf[10],"Noise Spectral Density",22) == 0)
	   {
	   data_valid_flag = 1;
	   /* mexPrintf("found NOISE (init)\n"); */
	   }
	 else if (strncmp(&buf[10],"Transient Analysis",18) == 0)
	   {
	   data_valid_flag = 1;
	   /* mexPrintf("found TR transfer\n"); */
	   }
	 else if (strncmp(&buf[10],"Operating Point",15) == 0)
	   {
	   data_valid_flag = 0;
	   /* mexPrintf("found Operating Point\n"); */
	   }
       }
     else if (data_valid_flag == 1)
       {
        if (strncmp(buf,"No. Variables: ",15) == 0)
          {
           num_signals = atoi(&buf[15]);
	   /* mexPrintf("num_signals = %d\n",num_signals); */
          }
        else if (strncmp(buf,"No. Points: ",12) == 0)
          {
           data_cols = atoi(&buf[12]);
	   /* mexPrintf("data_cols = %d\n",data_cols); */
          }
        else if (strncmp(buf,"Flags: ",7) == 0)
          {
	    if (strncmp(&buf[7],"complex",7) == 0)
	      {
		complex_data_flag = 1;
		/* mexPrintf("found complex data!!\n"); */
	      }

          }
       }
   }
 if (num_signals == -1) 
   {
    /* first check if operating point info is there */
    rewind(fp);
    data_valid_flag = 0;
    complex_data_flag = 0;
    while (fgets(buf, BSIZE_SP, fp)) 
      {
       if (strncmp(buf,"Plotname: ",10) == 0)
         {
	 if (strncmp(&buf[10],"Operating Point",15) == 0)
	   {
	   data_valid_flag = 1;
	   /* mexPrintf("found Operating Point\n"); */
	   operating_point_flag = 1;
	   }
         }
       else if (data_valid_flag == 1)
         {
          if (strncmp(buf,"No. Variables: ",15) == 0)
            {
             num_signals = atoi(&buf[15]);
	     /* mexPrintf("num_signals = %d\n",num_signals); */
            }
          else if (strncmp(buf,"No. Points: ",12) == 0)
            {
             data_cols = atoi(&buf[12]);
	     /* mexPrintf("data_cols = %d\n",data_cols); */
            }
          else if (strncmp(buf,"Flags: ",7) == 0)
            {
	     if (strncmp(&buf[7],"complex",7) == 0)
	        {
		complex_data_flag = 1;
		/* mexPrintf("found complex data!!\n"); */
	        }
            }
         }
      }
     if (num_signals == -1) 
        {
	 /* not even operating point information is available */
         mexPrintf("Error:  num_signals is undefined!\n");
         mexErrMsgTxt("error trying to read in ngspice raw file");
	}
   }

if (complex_data_flag == 1)
   data_rows = 2*num_signals-1;
else
   data_rows = num_signals;

if (data_cols == -1)
   {
     mexPrintf("Error:  data_cols is undefined!\n");
     mexErrMsgTxt("error trying to read in ngspice raw file");
   }


return(init_SpiceData(num_signals,nauto,data_rows,data_cols,sweep_count,nsweep_var,nsweep_names,block_size,operating_point_flag));
}

SpiceData *hs_allocate_sf(FILE *fp, char *simsource)
{
	char *ahdr;
	unsigned int ahdrsize, term_seq;
	int nprobe,num_signals,nauto,block_size,ival;
	char nbuf[16], version[16], full_version[50];
        int data_rows,i,data_cols,nsweep_var,nsweep_names;
        int sig_type,val_flag,sweep_count;
        int char_position,j;
        unsigned int header_seg_length[MAX_HEADER_BLOCKS],k;	
	unsigned int ibuf[4];
        int col_count;
	int operating_point_flag; /* only used for ngspice */
        operating_point_flag = 0;

	/* probably not necessary to rewind, but just to make sure ... */
        rewind(fp);

	/* assume hspice is simulation source by default */
	sprintf(simsource,"hspice");
	if(fread_int_values(simsource,ibuf, 4, fp) != 4) 
           {
	    mexPrintf("error in hs_allocate_sf: EOF reading block1 header\n");
            return(NULL);
	   } 
	if(ibuf[0] != 4 || ibuf[2] != 4) 
           {
	    /*  check if Windows Hspice */
	    /*
	    printf("ibuf[0] = %x, ibuf[1] = %x, ibuf[2] = %x, ibuf[3] = %x\n",
		    ibuf[0],ibuf[1],ibuf[2],ibuf[3]);
	    */
	    if (ibuf[0] == 0x4000000 && ibuf[2] == 0x4000000)
	       {
	       sprintf(simsource,"hspice_win");
	       /*  printf("sim = %s\n",simsource); */
	       rewind(fp);
   	       if (fread_int_values(simsource,ibuf, 4, fp) != 4) 
                   {
	           mexPrintf("error in hs_allocate_sf: EOF reading block1 header\n");
                   return(NULL);
	           } 
	       /* printf("ibuf[0] = %x, ibuf[1] = %x, ibuf[2] = %x, ibuf[3] = %x\n",
		  ibuf[0],ibuf[1],ibuf[2],ibuf[3]); */

               if (ibuf[0] != 4 || ibuf[2] != 4)
		 {
  	          mexPrintf("error in hs_allocate_sf: unexpected values in block1 header\n");
                  return(NULL);
		 }
	       }
            else
	       {
  	       mexPrintf("error in hs_allocate_sf: unexpected values in block1 header\n");
               return(NULL);
	       }
 	   }

        ahdrsize = 0;
        for (i = 0; i < MAX_HEADER_BLOCKS; i++)
	  {
          header_seg_length[i] =ibuf[3];
          ahdrsize += header_seg_length[i];
          fseek(fp,header_seg_length[i]-8,SEEK_CUR);
 	  if(fread_int_values(simsource,&term_seq,1, fp) != 1) 
             {
	     mexPrintf("error in hs_allocate_sf: EOF reading block trailer\n");
             return(NULL);
	     }
	  /* mexPrintf("term_seq = %x\n",term_seq); */
          fseek(fp,4,SEEK_CUR);
 	  if(fread_int_values(simsource,ibuf,1, fp) != 1) 
             {
	     mexPrintf("error in hs_allocate_sf: EOF reading block trailer\n");
             return(NULL);
	     }
	  /*
           mexPrintf("ibuf[0] = %x, ibuf[1] = %x, ibuf[2] = %x, ibuf[3] = %x, head_length = %x\n",
           ibuf[0],ibuf[1],ibuf[2],ibuf[3],header_seg_length[i]);
	  */
          if (ibuf[0] != header_seg_length[i])
	    {
	     mexPrintf("error in hs_allocate_sf:  block trailer mismatch\n");
             return(NULL);
	    }
    	  if(fread_int_values(simsource,ibuf, 4, fp) != 4) 
            {
	    mexPrintf("error in hs_allocate_sf:  EOF reading block header\n");
	    return(NULL);
	    }
	  if(ibuf[0] != 4 || ibuf[2] != 4) 
            {
	    mexPrintf("error in hs_allocate_sf:  unexepected values in block header\n");
	    return(NULL);
	    }

          /* test to see if more ascii header remains */
          if (strcmp(simsource,"hspice_win") == 0)
	    {
             if (term_seq == 0x23252624)
                break;
	    }
          else
	    {
             if (term_seq == 0x24262523)
                break;
	    }
	  /* old method:
          if (ibuf[1] == 2048) 
	     break;
          */
	  }
        ahdrsize += 20*i;

        if (i == MAX_HEADER_BLOCKS)
	  {
           mexPrintf("error in hs_allocate_sf:  too many header blocks!\n");
           mexPrintf("  must increase MAX_HEADER_BLOCKS value in source code\n");
           return(NULL);
	  }
        rewind(fp);
        fseek(fp,16,SEEK_CUR);


        if ((ahdr = (char *) mxCalloc(ahdrsize+1,sizeof(char))) == NULL)   
           {   
           mexPrintf("error in hs_allocate_sf:  mxCalloc call failed - \n");   
           mexPrintf("  not enough memory!!\n");   
           return(NULL);   
           }    
	if(fread(ahdr, sizeof(char), ahdrsize, fp) != ahdrsize) {
	     mexPrintf("error in hs_allocate_sf:  EOF reading block1\n");
             return(NULL);
	}
	ahdr[ahdrsize] = '\0';
	/* remove false '\0' characters */
        for (k = 0; k < ahdrsize; k++)
           if (ahdr[k] == '\0')
              ahdr[k] = ' ';

	/* remove block information from header */
        char_position = 0;
        for (j = 0; j < i; j++)
	  {
          char_position += header_seg_length[j];
          for (k = 0; k < 20; k++)
            ahdr[char_position+k] = ' ';
          char_position += 20;
	  }


	if(fread_int_values(simsource,ibuf,1, fp) != 1) {
	     mexPrintf("error in hs_allocate_sf: EOF reading block1 trailer\n");
             return(NULL);
	}
	if(ibuf[0] != header_seg_length[i]) {
	     mexPrintf("error in hs_allocate_sf:  block1 trailer mismatch\n");
             return(NULL);
	}


	if(fread_int_values(simsource,ibuf, 4, fp) != 4) 
            {
	    mexPrintf("error in rdhdr_hsbin:  EOF reading block2 header\n");
	    return(NULL);
	    }
	if(ibuf[0] != 4 || ibuf[2] != 4) 
            {
	    mexPrintf("error in rdhdr_hsbin:  unexepected values in block2 header\n");
	    return(NULL);
	    }
        block_size = ibuf[3]/sizeof(float);





	/* mexPrintf("block size = %d\n",block_size); */

	/* ahdr is an ascii header that describes the variables in
	 * much the same way that the first lines of the ascii format do,
	 * except that there are no newlines
	 */

        strncpy(version, &ahdr[16], 4);
        version[4] = '\0';
        strncpy(full_version, &ahdr[16], 43);
        full_version[43] = '\0';

	if (strncmp(full_version,"9601    Output Signals from C++ Simulation.",43) == 0)
          sprintf(simsource,"cppsim");
        else if (strncmp(full_version, "9601",4) == 0)
	  ;  /* no action necessary */
	else 	/* wrong version of post format */
	  {
           mexPrintf("error in hs_allocate_sf:  wrong binary format\n");
           mexPrintf("   only hspice post format '9601' or cppsim output is supported\n");
           mexPrintf("   in this case, the input file is version '%s'\n",version);
           return(NULL);
	  }

	strncpy(nbuf, &ahdr[0], 4);
	nbuf[4] = 0;
	nauto = atoi(nbuf);	/* number of automaticly-included variables,
				   first one is independent variable */
	strncpy(nbuf, &ahdr[4], 4);
	nbuf[4] = 0;
	nprobe = atoi(nbuf);	/* number of user-requested columns */
	/* mexPrintf("nprobe = %d, nauto = %d\n",nprobe,nauto);
	   return(NULL); */
        num_signals = nprobe + nauto;

	/* 
        mexPrintf("num_signals = %d, nprobe = %d, nauto = %d\n",num_signals,
            nprobe,nauto); 
        */
        /* mexPrintf("%s",ahdr); */
        strncpy(nbuf, &ahdr[8], 4);
        nbuf[4] = 0;
        nsweep_names = atoi(nbuf);
        data_rows = hs_determine_num_data_rows(&ahdr[256],num_signals,nauto,
             &sig_type,nsweep_names,&nsweep_var);
        mxFree(ahdr);


	/* count data lines */
        i = 0;
        sweep_count = 0;
        col_count = 0;
        while(1)
          {
          val_flag = hs_validate_column(fp,data_rows,i,nsweep_var,block_size,
                          simsource,col_count++);
          if (val_flag == 1)
             break;
          else if (val_flag == 2)
	    {
	      /* mexPrintf("i = %d\n",i); */
             if (sweep_count == 0)
                data_cols = i;  
             else
	       {
                if (data_cols > i)
                   data_cols = i;
	       }
             i = -1;
             fseek(fp,16,SEEK_CUR);
	     if(fread_int_values(simsource,&ival,1, fp) == 1) {
	       block_size = (ival/sizeof(float)) - 1;
	     }
             sweep_count += 1;
	    }
          i++;
          } 
        if (sweep_count < 1)
	  {
          data_cols = i;
          sweep_count=1;
	  }
        return(init_SpiceData(num_signals,nauto,data_rows,data_cols,sweep_count,nsweep_var,nsweep_names,block_size,operating_point_flag));
}


int hs_determine_num_data_rows(char *line, int num_signals, int nauto, 
    int *ind_sig_type, int num_sweep_names, int *num_sweep_vars)
{
	char *cp;
	char *signam;
	int i;
	int hstype;
        int signal_type;
        int current_row;

        current_row = 0;

	/*	 mexPrintf("%s\n",line);  */
/* type of independent variable */
	cp = strtok(line, " \t\n");

	if(!cp) 
           {
	    mexPrintf("error in hs_determine_num_data_rows:  initial vartype not found on header line\n");
	    return(-1);
	   }

	hstype = atoi(cp);
	switch(hstype) {
	case 1:
		signal_type = TIME;
		break;
	case 2:
		signal_type = FREQUENCY;
		break;
	case 3:
		signal_type = VOLTAGE;
		break;
	default:
		signal_type = UNKNOWN;
		break;
	}
        *ind_sig_type = signal_type;
        current_row++;

/* dependent variable types */
	for(i = 1; i < num_signals; i++) 
           {
		cp = strtok(NULL, " \t\n");
		if(!cp) {
		    mexPrintf("error in hs_determine_num_data_rows: not enough vartypes on header line\n");
		    return(-1);
		}
		if(!isdigit(cp[0])) {
		    mexPrintf("error in hs_determine_num_data_rows:  bad vartype %d [%s] on header line\n", i, cp);
		    return(-1);
		}
		/* how many columns comprise this variable? */
		current_row++;
		if(i < nauto && signal_type == FREQUENCY) 
                    current_row++;
	  }

/* independent variable name */
	signam = strtok(NULL, " \t\n"); 
	if(!signam) {
		mexPrintf("error in hs_determine_num_data_rows: no IV name found on header line");
		return(-1);
	}

 /* dependent variable names */
	for(i = 1; i < num_signals; i++) 
           {
	    if((signam = strtok(NULL, " \t\n")) == NULL) 
                {
		mexPrintf("error in hs_determine_num_data_rows:  not enough DV names found on header line\n");
                mexPrintf(" num_signals = %d, got to %d\n",num_signals-1,i);
		return(-1);
		}
	    /*    mexPrintf("(%d) dv = %s\n",i,signam);   */
	   }
        if (num_sweep_names > 0)
	  {
	   if((signam = strtok(NULL, " \t\n")) == NULL) 
               {
	       mexPrintf("error in hs_determine_num_data_rows:  not enough sweep parameter names found on header line\n");
	       return(-1);
	       }
           if (strcmp(signam,"MONTE_CARLO") == 0)
               *num_sweep_vars = num_sweep_names;
           else if (num_sweep_names > 1)
               *num_sweep_vars = num_sweep_names-1;
           else
               *num_sweep_vars = num_sweep_names;
	  }
        else
           *num_sweep_vars = 0;

return(current_row);
}



/* Read spice-type file header - hspice binary */
int hs_determine_variables(FILE *fp, SpiceData *sf, char *simsource)
{

	char *ahdr;
	int ahdrsize;
	int nprobe,nsweep_var;
	char nbuf[16];
        int char_position, header_seg_length[MAX_HEADER_BLOCKS],i,j,k;  	
	unsigned int ibuf[4],term_seq;

        rewind(fp);

	if(fread_int_values(simsource,ibuf, 4, fp) != 4) 
           {
	    mexPrintf("error in hs_determine_variables: EOF reading block1 header\n");
            return(0);
	   } 

        ahdrsize = 0;
        for (i = 0; i < MAX_HEADER_BLOCKS; i++)
	  {
          header_seg_length[i] =ibuf[3];
          ahdrsize += header_seg_length[i];
          fseek(fp,header_seg_length[i]-8,SEEK_CUR);
 	  if(fread_int_values(simsource,&term_seq,1, fp) != 1) 
             {
	     mexPrintf("error in hs_determine_variables: EOF reading block trailer\n");
             return(0);
	     }
          fseek(fp,4,SEEK_CUR);

 	  if(fread_int_values(simsource,ibuf,1, fp) != 1) 
             {
	     mexPrintf("error in hs_determine_variables: EOF reading block trailer\n");
             return(0);
	     }
          if (ibuf[0] != header_seg_length[i])
	    {
	     mexPrintf("error in hs_determine_variables:  block trailer mismatch\n");
             return(0);
	    }
    	  if(fread_int_values(simsource,ibuf, 4, fp) != 4) 
            {
	    mexPrintf("error in hs_determine_variables:  EOF reading block header\n");
	    return(0);
	    }
	  if(ibuf[0] != 4 || ibuf[2] != 4) 
            {
	    mexPrintf("error in hs_determine_variables:  unexepected values in block header\n");
	    return(0);
	    }
          /* test to see if more ascii header remains */
          if (strcmp(simsource,"hspice_win") == 0)
	    {
             if (term_seq == 0x23252624)
                break;
	    }
          else
	    {
             if (term_seq == 0x24262523)
                break;
	    }
	  /* old method:
          if (ibuf[1] == 2048) 
	     break;
          */
	  }
        ahdrsize += 20*i;

        if (i == MAX_HEADER_BLOCKS)
	  {
           mexPrintf("error in hs_determine_variables:  too many header blocks!\n");
           mexPrintf("  must increase MAX_HEADER_BLOCKS value in source code\n");
           return(0);
	  }
        rewind(fp);
        fseek(fp,16,SEEK_CUR);



        if ((ahdr = (char *) mxCalloc(ahdrsize+1,sizeof(char))) == NULL)   
           {   
           mexPrintf("error in hs_determine_variables:  mxCalloc call failed - \n");   
           mexPrintf("  not enough memory!!\n");   
           return(0);   
           }    
	if(fread(ahdr, sizeof(char), ahdrsize, fp) != ahdrsize) {
	     mexPrintf("error in hs_determine_variables:  EOF reading block1\n");
             return(0);
	}
	ahdr[ahdrsize] = '\0';
	/* remove false '\0' characters */
        for (k = 0; k < ahdrsize; k++)
           if (ahdr[k] == '\0')
              ahdr[k] = ' ';

	/* remove block information from header */
        char_position = 0;
        for (j = 0; j < i; j++)
	  {
          char_position += header_seg_length[j];
          for (k = 0; k < 20; k++)
            ahdr[char_position+k] = ' ';
          char_position += 20;
	  }


	if(fread_int_values(simsource,ibuf,1, fp) != 1) {
	     mexPrintf("error in hs_determine_variables: EOF reading block1 trailer\n");
             return(0);
	}
	if(ibuf[0] != header_seg_length[i]) {
	     mexPrintf("error in hs_determine_variables:  block1 trailer mismatch\n");
             return(0);
	}

	hs_process_header(&ahdr[256], sf);
	
	if(fread_int_values(simsource,ibuf, 4, fp) != 4) {
	    mexPrintf("error in hs_determine_variables:  EOF reading block2 header\n");
            return(0);
	}

	sf->current_column = 0;
        mxFree(ahdr);
        return(1);
}


void hs_process_header(char *line, SpiceData *sf)
{
	char *cp;
	char *signam;
	int i,j;
	int hstype;
        int current_row;
        char tmp_string[MAX_NAME_LENGTH];

        current_row = 0;

/* type of independent variable */
	cp = strtok(line, " \t\n");
	if(!cp) 
           {
	    mexPrintf("error in hs_process_header:  initial vartype not found on header line\n");
	    return;
	   }

	hstype = atoi(cp);
	switch(hstype) {
	case 1:
		sf->signal_type[0] = TIME;
		break;
	case 2:
		sf->signal_type[0] = FREQUENCY;
		break;
	case 3:
		sf->signal_type[0] = VOLTAGE;
		break;
	default:
		sf->signal_type[0] = UNKNOWN;
		break;
	}

	sf->signal_first_row[0] = current_row++;
	sf->signal_num_rows[0] = 1;

/* dependent variable types */
	for(i = 1; i < sf->num_signals; i++) 
           {
		cp = strtok(NULL, " \t\n");
		if(!cp) {
		    mexPrintf("error in hs_process_header: not enough vartypes on header line\n");
		    return;
		}
		if(!isdigit(cp[0])) {
		    mexPrintf("error in hs_process_header:  bad vartype %d [%s] on header line\n", i, cp);
		    return;
		}
		hstype = atoi(cp);
		switch(hstype) {
		case 1:
		case 2:
			sf->signal_type[i] = VOLTAGE;
			break;
		case 8:
		case 15:
			sf->signal_type[i] = CURRENT;
			break;
		default:
			sf->signal_type[i] = UNKNOWN;
			break;
		}

		/* how many columns comprise this variable? */
                if (current_row >= sf->num_data_rows)
		  {
                  mexPrintf("error in hs_process_header:  data rows exceeded\n");
                  return;
		  }
		sf->signal_first_row[i] = current_row++;
		if(i < (sf->nauto) && sf->signal_type[0] == FREQUENCY) 
                   {
                   if (current_row >= sf->num_data_rows)
	  	     {
                     mexPrintf("error in hs_process_header:  data rows exceeded\n");
                     return;
		     }

		    sf->signal_num_rows[i] = 2;
                    current_row++;
		   } 
                else 
                   {
		    sf->signal_num_rows[i] = 1;
		   }
	   }


/* independent variable name */
	signam = strtok(NULL, " \t\n"); 
	if(!signam) {
		mexPrintf("error in hs_process_header: no IV name found on header line");
		return;
	}
	strncpy(sf->signal_name[0],signam,MAX_NAME_LENGTH-1);

 /* dependent variable names */
	for(i = 1; i < sf->num_signals; i++) 
           {
	    if((signam = strtok(NULL, " \t\n")) == NULL) 
                {
		mexPrintf("error in hs_process_header:  not enough DV names found on header line\n");
		return;
		}
	    strncpy(sf->signal_name[i],signam,MAX_NAME_LENGTH-1);
	}
 /* sweep parameter names */
        j = 0;
	for(i = 0; i < sf->num_sweep_names; i++) 
           {
	    if((signam = strtok(NULL, " \t\n")) == NULL) 
                {
	        mexPrintf("error in hs_process_header:  not enough sweep parameter names found on header line\n");
	        return;
	        }
            if (i < (sf->num_sweep_names-sf->num_sweep_vars))
	        continue;
            sprintf(tmp_string,"sw_%s",signam);
	    strncpy(sf->sweep_name[j++],tmp_string,MAX_NAME_LENGTH-1);

	   }

}

int ngsp_read_column(FILE *fp, SpiceData *sf, char *simsource)
{
	int i,current_row,step_val,num_data_rows;
	double val, scratch_val;

	if (sf->current_column == 0)
	  {
           for (i = 0; i < sf->num_sweep_vars; i++)
	     {
 	     if(fread_double_values(simsource, &val, fp) != 1) 
               {
	       mexPrintf("error in ngsp_read_column for sweep vars: unexpected EOF at field %d\n", i);
	       return(1);
	       }
             sf->sweep_data[i][sf->cur_sweep] = val;
	     }
	  }
       
        if (sf->current_column >= sf->num_data_cols)
           return(1);

	num_data_rows = 0;
	for (i = 0; i < sf->num_signals; i++)
           num_data_rows += sf->signal_num_rows[i];

	for(i = 0; i < num_data_rows; i++) 
           {
	    if(fread_double_values(simsource, &val, fp) != 1) 
               {
	       mexPrintf("error in ngsp_read_column for data vars: unexpected EOF at field %d\n", i);
	       return(1);
	       }
	    if (i == 0 && sf->analysis_type == AC_ANALYSIS) /* only applies to ngspice */
	      {
	       if(fread_double_values(simsource, &scratch_val, fp) != 1) 
                  {
	           mexPrintf("error in ngsp_read_column for data vars: unexpected EOF at field %d\n", i);
	           return(1);
	          }
	      }
            current_row = sf->cur_sweep*sf->num_data_rows+i;

            if (current_row >= sf->num_data_rows*sf->num_sweeps)
	      {
               mexPrintf("error in 'ngsp_read_column': data overflow\n");
               return(1);
	      }
            sf->signal_data[current_row][sf->current_column] = val;
	   }

	sf->current_column++;
        return(0);
}
	
int hs_read_column(FILE *fp, SpiceData *sf, char *simsource)
{
	int i,current_row,k,ival;
	float val;
	static int count_for_null_event;
        static int next_block_size;

	if (sf->current_column == 0)
	  {
	   count_for_null_event = 0;
	   next_block_size = sf->block_size;
           for (i = 0; i < sf->num_sweep_vars; i++)
	     {
 	     if(fread_float_values(simsource, &val, fp) != 1) 
               {
	       mexPrintf("error in hs_read_column: unexpected EOF at field %d\n", i);
	       return(1);
	       }
             sf->sweep_data[i][sf->cur_sweep] = (double) val;
	     }
	  }
        k = sf->num_sweep_vars;
       
        if (sf->current_column >= sf->num_data_cols)
           return(1);

	for(i = 0; i < sf->num_data_rows; i++) 
           {
	    if (count_for_null_event == next_block_size)
	      {
	       count_for_null_event = 0;
	       if (strncmp(simsource,"hspice",6) == 0)
		  {
                  fseek(fp,16,SEEK_CUR);
   	          if(fread_int_values(simsource,&ival, 1, fp) != 1) 
                     {
	             mexPrintf("error in hs_read_column: EOF reading block1 header\n");
                     return(1);
	             } 
		  next_block_size = ival/sizeof(float);
		  }
	       else
                  fseek(fp,20,SEEK_CUR);
	      }
	    count_for_null_event++;

	    if(fread_float_values(simsource, &val, fp) != 1) 
               {
	       mexPrintf("error in hs_read_column: unexpected EOF at field %d\n", i);
	       return(1);
	       }
	    /**
	    if (count_for_null_event < 10 || count_for_null_event > (next_block_size-10))
	      printf("val = %5.3e\n",val);
	    **/
            current_row = sf->cur_sweep*sf->num_data_rows+i;

            if (current_row >= sf->num_data_rows*sf->num_sweeps)
	      {
               mexPrintf("error in 'hs_read_column': data overflow\n");
               return(1);
	      }
            sf->signal_data[current_row][sf->current_column] = (double) val;
	   }

	sf->current_column++;
        return(0);
}

int hs_validate_column(FILE *fp, int num_data_rows, int current_column, int num_sweep_vars, int block_size, char *simsource, int col_count)
{
	int i,k,ival;
	float val;
	static int count_for_null_event;
        static int next_block_size;

        if (current_column == 0)
	  {
	   count_for_null_event = 0;
	   next_block_size = block_size;
           if (num_sweep_vars > 0)
              fseek(fp,4*num_sweep_vars,SEEK_CUR);
	  }
        k = num_sweep_vars;
	for(i = 0; i < num_data_rows; i++) 
            {
	    if (count_for_null_event == next_block_size)
	      {
	       count_for_null_event = 0;
	       if (strncmp(simsource,"hspice",6) == 0)
		  {
                  fseek(fp,16,SEEK_CUR);
   	          if(fread_int_values(simsource,&ival, 1, fp) != 1) 
                     {
	             mexPrintf("error in hs_validate_column: EOF reading block1 header\n");
                     return(1);
	             }
		  next_block_size = ival/sizeof(float);
		  }
	       else
                  fseek(fp,20,SEEK_CUR);
	      }
	    count_for_null_event++;

	    if(fread_float_values(simsource, &val, fp) != 1) 
	       return(1);
   	    if(val >= (1e30 - DBL_EPSILON))
	       {
		 /** removed this since Sun architecture is now obsolete **/
		 /**
		 if (col_count < 10) // assume at least 10 time steps in sim
		   {
		    if (strncmp(simsource,"hspice",6) == 0)
                      sprintf(simsource,"hspice_sun");
                    else
                      sprintf(simsource,"cppsim_sun");
		   }
		 else if (strcmp(simsource,"cppsim_sun") == 0)
		    sprintf(simsource,"cppsim");
                 else if (strncmp(simsource,"hspice",6) == 0)
                    return(2);
		 ***/
		 /*** changed to: ***/
                 if (strncmp(simsource,"hspice",6) == 0)
                    return(2);
	       }
	    }
        return(0);
}




SpiceData *init_SpiceData(int num_signals, int nauto, int num_data_rows, int num_data_cols, int num_sweeps, int num_sweep_vars, int num_sweep_names, int block_size, int operating_point_flag)
{
int i,length_signal_data;  
SpiceData *A; 
   
if ((A = (SpiceData *) mxCalloc(1,sizeof(SpiceData))) == NULL)   
   {   
   mexPrintf("error in 'init_SpiceData':  mxCalloc call failed\n");   
   mexPrintf("out of memory!\n");   
   return(NULL);   
  }   

A->analysis_type = -1; /* this is only used for ngspice */
A->operating_point_flag = operating_point_flag; /* only used for ngspice */
A->num_data_rows = num_data_rows;
A->num_data_cols = num_data_cols;
A->num_signals = num_signals;
A->nauto = nauto;
A->num_sweeps = num_sweeps;
A->num_sweep_vars = num_sweep_vars;
A->num_sweep_names = num_sweep_names;
A->block_size = block_size;


/*
mexPrintf("num_signals = %d, nauto = %d, num_data_rows = %d, num_data_cols = %d\n", num_signals, nauto, num_data_rows, num_data_cols);
mexPrintf("num_sweeps = %d, num_sweep_vars = %d, block size = %d\n",num_sweeps, num_sweep_vars, block_size);
*/

if ((A->signal_name = (char **) mxCalloc(num_signals,sizeof(char *))) == NULL)   
       {   
        mexPrintf("error in 'init_SpiceData':  mxCalloc call failed - \n");   
        mexPrintf("  not enough memory!!\n");   
        return(NULL);   
       }   
for (i = 0; i < num_signals; i++)   
    if (((A->signal_name)[i] = (char *) mxCalloc(MAX_NAME_LENGTH,sizeof(char))) == NULL)   
       {   
        mexPrintf("error in 'init_SpiceData':  mxCalloc call failed - \n");   
        mexPrintf("  not enough memory!!\n");   
        return(NULL);   
       }   

if (num_sweep_vars > 0)
  {
  if ((A->sweep_name = (char **) mxCalloc(num_sweep_vars,sizeof(char *))) == NULL)   
       {   
        mexPrintf("error in 'init_SpiceData':  mxCalloc call failed - \n");   
        mexPrintf("  not enough memory!!\n");   
        return(NULL);   
       }   
  for (i = 0; i < num_sweep_vars; i++)   
      if (((A->sweep_name)[i] = (char *) mxCalloc(MAX_NAME_LENGTH,sizeof(char))) == NULL)   
       {   
        mexPrintf("error in 'init_SpiceData':  mxCalloc call failed - \n");   
        mexPrintf("  not enough memory!!\n");   
        return(NULL);   
       }   
  if ((A->sweep_data = (double **) mxCalloc(num_sweep_vars,sizeof(double *))) == NULL)   
       {   
        mexPrintf("error in 'init_SpiceData':  mxCalloc call failed - \n");   
        mexPrintf("  not enough memory!!\n");   
        return(NULL);   
       }   
  for (i = 0; i < num_sweep_vars; i++)   
      if (((A->sweep_data)[i] = (double *) mxCalloc(num_sweeps,sizeof(double))) == NULL)   
       {   
        mexPrintf("error in 'init_SpiceData':  mxCalloc call failed - \n");   
        mexPrintf("  not enough memory!!\n");   
        return(NULL);   
       }   
  }
length_signal_data = num_sweeps*num_data_rows;

/* mexPrintf("length_signal_data = %d,num_data_cols=%d\n",length_signal_data,num_data_cols);  */
if ((A->signal_data = (double **) mxCalloc(length_signal_data,sizeof(double *))) == NULL)   
       {   
        mexPrintf("error in 'init_SpiceData':  mxCalloc call failed - \n");   
        mexPrintf("  not enough memory!!\n");   
        return(NULL);   
       }   
for (i = 0; i < length_signal_data; i++)   
    if (((A->signal_data)[i] = (double *) mxCalloc(num_data_cols,sizeof(double))) == NULL)   
       {   
        mexPrintf("error in 'init_SpiceData':  mxCalloc call failed - \n");   
        mexPrintf("  not enough memory!!\n");   
        return(NULL);   
       }   

if (((A->signal_first_row) = (int *) mxCalloc(num_signals,sizeof(int))) == NULL)   
       {   
        mexPrintf("error in 'init_SpiceData':  mxCalloc call failed - \n");   
        mexPrintf("  not enough memory!!\n");   
        return(NULL);   
       }   
if (((A->signal_num_rows) = (int *) mxCalloc(num_signals,sizeof(int))) == NULL)   
       {   
        mexPrintf("error in 'init_SpiceData':  mxCalloc call failed - \n");   
        mexPrintf("  not enough memory!!\n");   
        return(NULL);   
       }   
if (((A->signal_type) = (int *) mxCalloc(num_signals,sizeof(int))) == NULL)   
       {   
        mexPrintf("error in 'init_SpiceData':  mxCalloc call failed - \n");   
        mexPrintf("  not enough memory!!\n");   
        return(NULL);   
       } 
return(A);
}   


void free_SpiceData(SpiceData *A)
{
int i;  


for (i = 0; i < A->num_data_rows*A->num_sweeps; i++)
   mxFree((A->signal_data)[i]);
mxFree(A->signal_data);

if (A->num_sweep_vars > 0)
  {
   for (i = 0; i < A->num_sweep_vars; i++)
     mxFree((A->sweep_data)[i]);
   mxFree(A->sweep_data);
   for (i = 0; i < A->num_sweep_vars; i++)
     mxFree((A->sweep_name)[i]);
   mxFree(A->sweep_name);
  }
for (i = 0; i < A->num_signals; i++)
   mxFree((A->signal_name)[i]);
mxFree(A->signal_name);


mxFree(A->signal_first_row);
mxFree(A->signal_num_rows);   
mxFree(A->signal_type);
mxFree(A);
}   


/* fix problem with big endian, little endian issue */
size_t fread_int_values(char *simsource,unsigned int *ibuf, 
                        int size_of_block, FILE *fp)
  {
   unsigned char *charbuf;
   int i;
   size_t blocks_read;

   if ((charbuf = (unsigned char *) mxCalloc(4*size_of_block,sizeof(unsigned char))) == NULL)   
         {   
          mexPrintf("error in 'fread_int_values':  mxCalloc call failed - \n");   
          mexPrintf("  not enough memory!!\n");   
          return((size_t) -1);   
        }   
   blocks_read = fread(charbuf, sizeof(unsigned char),4*size_of_block, fp);
   if (strcmp(simsource,"hspice_win") == 0)
     {
      for (i = 0; i < size_of_block; i++)
         {
         ibuf[i] = charbuf[i*4+3]*(1<<24) + charbuf[i*4+2]*(1<<16) 
                     + charbuf[i*4+1]*(1<<8) + charbuf[i*4];
         }
     }
   else
     { 
      for (i = 0; i < size_of_block; i++)
         {
         ibuf[i] = charbuf[i*4]*(1<<24) + charbuf[i*4+1]*(1<<16) 
                     + charbuf[i*4+2]*(1<<8) + charbuf[i*4+3];
         }
     }
   mxFree(charbuf);
   return(((size_t) ((int) blocks_read)/4));
  }

/* fix problem with big endian, little endian issue */
int fread_float_values(char *simsource,float *fval, FILE *fp)
  {
   unsigned char *cptr,tmp;

   if (fread(fval,4,1,fp) != 1)
      return(0);
   if (strcmp(simsource,"hspice") == 0) /* as opposed to hspice_win */
     { 
      cptr = (unsigned char *)fval;
      tmp = cptr[0];
      cptr[0] = cptr[3];
      cptr[3] =tmp;
      tmp = cptr[1];
      cptr[1] = cptr[2];
      cptr[2] = tmp;
     }
   return(1);
  }

/* allow for future fix in case of problem with big endian, little endian issue */
int fread_double_values(char *simsource,double *fval, FILE *fp)
  {
   if (fread(fval,8,1,fp) != 1)
      return(0);

   return(1);
  }



