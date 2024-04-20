/* "matrix_functions" - a collection of C functions dealing with the  
    manipulation of matrices - some of which are adapted from the book 
    "Numerical Recipes in C" 
    - written by Michael H. Perrott (perrott@alum.mit.edu) 

   This code is free to the general public
   No warranty of any kind is provided
   The author (Michael Perrott) is not responsible for any loss encountered 
   due to the use of this code
   Anyone who uses this code must keep the authors name (Michael Perrott)
   attached to it and give due credit to its use
   Warning - the source code has not been commented! 
*/
  
 
  
#include "matrix_func.h"   
  
void free_matrix(matrix *x)
{
conform_matrix(0,0,x);
free(x);
} 




void vector_check(char *routine,matrix *A)
{
if (A->cols != 1)
  {
   printf("error in '%s':  matrix must be a column vector\n",routine);
   printf("  in this case, the matrix is '%s' (%d by %d)\n",
              A->name,A->rows,A->cols);
   exit(1);
  }
}

 
double bernoulli(double p)
{
double pp,out;
int idum;

idum = 1;
pp = (p <= 0.5 ? p : 1.0 - p);

if (ran1(&idum) < pp)
   out  = 1.0;
else
   out = -1.0;

if (p != pp)
   out *= -1.0;

return(out);
}

 
EL_TYPE l2_norm(matrix *x) 
{ 
register int i; 
EL_TYPE norm; 
 
if (x->cols != 1 && x->rows != 1) 
  { 
   printf("error in 'l2_norm':  input matrix must be a row or column vector!\n"); 
   printf("    in this case, input matrix '%s' is %d by %d\n",x->name,x->rows,x->cols); 
   exit(1); 
 } 
 
norm = 0.0; 
if (x->cols == 1) 
  { 
   for (i = 0; i < x->rows; i++) 
      norm += x->elem[i][0]*x->elem[i][0]; 
 } 
else 
  { 
   for (i = 0; i < x->cols; i++) 
     norm += x->elem[0][i]*x->elem[0][i]; 
 } 
return((EL_TYPE) sqrt(norm)); 
} 
 
 
EL_TYPE l1_norm(matrix *x) 
{ 
register int i; 
EL_TYPE norm; 
 
if (x->cols != 1 && x->rows != 1) 
  { 
   printf("error in 'l1_norm':  input matrix must be a row or column vector!\n"); 
   printf("    in this case, input matrix '%s' is %d by %d\n",x->name,x->rows,x->cols); 
   exit(1); 
 } 
 
norm = 0.0; 
if (x->cols == 1) 
  { 
   for (i = 0; i < x->rows; i++) 
      norm += fabs(x->elem[i][0]); 
 } 
else 
  { 
   for (i = 0; i < x->cols; i++) 
      norm += fabs(x->elem[0][i]); 
 } 
return(norm); 
} 
 
 
EL_TYPE inf_norm(matrix *x) 
{ 
register int i; 
EL_TYPE norm; 
 
if (x->cols != 1 && x->rows != 1) 
  { 
   printf("error in 'inf_norm':  input matrix must be a row or column vector!\n"); 
   printf("    in this case, input matrix '%s' is %d by %d\n",x->name,x->rows,x->cols); 
   exit(1); 
 } 
 
norm = fabs(x->elem[0][0]); 
if (x->cols == 1) 
  { 
   for (i = 1; i < x->rows; i++) 
      if (fabs(x->elem[i][0]) > norm) 
          norm = fabs(x->elem[i][0]); 
 } 
else 
  { 
   for (i = 0; i < x->cols; i++) 
      if (fabs(x->elem[0][i]) > norm) 
          norm = fabs(x->elem[0][i]); 
 } 
return(norm); 
} 
 
matrix *copy(matrix *A, matrix *B) 
{ 
register int i,j; 
 
conform_matrix(A->rows,A->cols,B); 
for (i = 0; i < A->rows; i++) 
   for (j = 0; j < A->cols; j++) 
       B->elem[i][j] = A->elem[i][j]; 
return(B); 
}   
   
   
matrix *filter(matrix *A,matrix *B,matrix *U,matrix *Y)   
{   
int i,n; 
matrix *TEMP,*temp_a,*temp_b; 
 
TEMP = init("TEMP");   
   
if ((A->rows != 1 || B->rows != 1 || U->rows != 1) && (A->cols != 1 || B->cols != 1 || U->cols != 1))   
   {   
    printf("error in 'filter':  input matrices A, B, and U must be vectors!\n");   
    printf(" (in this case, A was specified as matrix '%s' (which is %d by %d)\n",A->name,A->rows,A->cols);   
    printf("              , B was specified as matrix '%s' (which is %d by %d)\n",B->name,B->rows,B->cols);   
    printf("          , and U was specified as matrix '%s' (which is %d by %d)\n",U->name,U->rows,U->cols);   
    exit(1);   
  }   
 
conform_matrix(U->rows,U->cols,TEMP);      
if (A->cols == 1)   
   {   
    if (A->elem[0][0] == 0.0)  
      {  
       printf("error in 'filter':  input matrix A (in this case, '%s')\nmust have a nonzero first element (%s->elem[0][0] wrongly equals %f)\n",A->name,A->name,A->elem[0][0]);  
       exit(1);  
     }  
    if (A->elem[0][0] != 1.0)   
      {
        temp_a = init("temp_a");
        temp_b = init("temp_b");
        copy(A,temp_a);
        copy(B,temp_b);
        for (i = 1; i < A->rows; i++)   
           A->elem[i][0] /= A->elem[0][0];   
        for (i = 0; i < B->rows; i++)
           B->elem[i][0] /= A->elem[0][0];
      }
    for (n = 0; n < U->rows; n++)   
      {   
       TEMP->elem[n][0] = 0.0;   
       for (i = 0; i < B->rows; i++)   
	 {   
          if ((n-i) < 0)   
             break;   
          TEMP->elem[n][0] += U->elem[n-i][0]*B->elem[i][0];   
	}   
       for (i = 1; i < A->rows; i++)   
	 {   
          if ((n-i) < 0)   
             break;   
          TEMP->elem[n][0] -= TEMP->elem[n-i][0]*A->elem[i][0];   
	}   
     }   
  }   
else   
  {   
    if (A->elem[0][0] == 0.0)  
      {  
       printf("error in 'filter':  input matrix A (in this case, '%s')\nmust have a nonzero first element (%s->elem[0][0] wrongly equals %f)\n",A->name,A->name,A->elem[0][0]);  
       exit(1);  
     }  
    if (A->elem[0][0] != 1.0)   
      {
        temp_a = init("temp_a");
        temp_b = init("temp_b");
        copy(A,temp_a);
        copy(B,temp_b);
        for (i = 1; i < A->cols; i++)   
           A->elem[0][i] /= A->elem[0][0];
        for (i = 0; i < B->cols; i++)
           B->elem[0][i] /= A->elem[0][0];   
      }
    for (n = 0; n < U->cols; n++)   
      {   
       TEMP->elem[0][n] = 0.0;   
       for (i = 0; i < B->cols; i++)   
	 {   
          if ((n-i) < 0)   
             break;   
          TEMP->elem[0][n] += U->elem[0][n-i]*B->elem[0][i];   
	}   
       for (i = 1; i < A->cols; i++)   
	 {   
          if ((n-i) < 0)   
             break;   
          TEMP->elem[0][n] -= TEMP->elem[0][n-i]*A->elem[0][i];   
	}   
     }   
  } 
replace_elements(TEMP->elem,TEMP->rows,TEMP->cols,Y); 
free(TEMP); 
if (A->elem[0][0] != 1.0)   
   {
    copy(temp_a,A);
    copy(temp_b,B);
    conform_matrix(0,0,temp_a);
    conform_matrix(0,0,temp_b);
    free(temp_a);
    free(temp_b);
   }

return(Y);   
}   
   
       
matrix *nonlin(matrix *in, double a0, double a1, double a2, double a3, matrix *out)
{
int i,j;
conform_matrix(in->rows,in->cols,out);

for (i = 0; i < in->rows; i++)
   for (j = 0; j < in->cols; j++)
      out->elem[i][j] = a0 + 
                        a1*in->elem[i][j] + 
                        a2*in->elem[i][j]*in->elem[i][j] +
                        a3*in->elem[i][j]*in->elem[i][j]*in->elem[i][j];

return(out);
}



matrix *save(matrix *A, char *filename)   
{   
FILE *fp;   
int i,j;   

char control[10];
/* control:  parameter that allows the output file to be written
             or appended, and also to attach labels to the matrix
             data stored.  In the past, this parameter was rarely
             used for anything other than "w", and is therefore
             always set to that case now
*/
sprintf(control,"w");
   
if (strcmp(control,"w") == 0 || strcmp(control,"wl") == 0)   
  {   
   if ((fp = fopen(filename,"w")) == NULL)   
     {   
      printf("error in 'save':  file %s cannot be opened\n",filename);   
      exit(1);   
    }   
   if (strcmp(control,"wl") == 0)   
           fprintf(fp,"%s\n",A->name);   
   for (i = 0; i < A->rows; i++)   
     {   
      for (j = 0; j < A->cols; j++)   
          fprintf(fp,"%e ",A->elem[i][j]);   
      fprintf(fp,"\n");   
    }   
 }   
else if (strcmp(control,"a") == 0 || strcmp(control,"al") == 0)   
  {   
   if ((fp = fopen(filename,"a")) == NULL)   
     {   
      printf("error in 'send_to_file':  file %s cannot be opened\n",filename);   
      exit(1);   
    }   
   if (strcmp(control,"al") == 0)   
      fprintf(fp,"%s\n",A->name);   
   for (i = 0; i < A->rows; i++)   
     {   
      for (j = 0; j < A->cols; j++)   
          fprintf(fp,"%e ",A->elem[i][j]);   
      fprintf(fp,"\n");   
    }   
 }   
else   
  {   
   printf("error in 'save':  control character was specified as %s,\n",   
           control);   
   printf("which is invalid since it must be specified as either 'w' (for\n");   
   printf("writing to a file), or 'a' (for appending to a file),\n");   
   printf("or 'wl' (write and label matrix in file), or 'al'\n");   
   printf("(append and label matrix to file)\n");   
   exit(1);   
 }   
fclose(fp);   
/* if (check_file != NULL)   
   fprintf(check_file,"'save':  write matrix %s (%d by %d) into file %s\n",A->name,A->rows,A->cols,filename); */   
return(A);   
}   
 
   
void neg_index_error(char *function,char *variable,int value,matrix *A)   
{   
printf("error in '%s':  %s specified as %d for matrix '%s',\n",function,variable,value,A->name);   
printf(" - matrix index parameters must be specified greater than or equal to zero!\n");   
exit(1);   
}   
   
matrix *gauss_ran_vector(int idum,int rows,matrix *A)   
{   
int i,idum_variable;   
   
if (rows < 0)   
   neg_index_error("gauss_ran_vector","rows",rows,A);   
conform_matrix(rows,1,A);   
idum_variable = idum;   
for (i = 0; i < rows; i++)   
   (A->elem)[i][0] = gasdev(&idum_variable);   
return(A);   
}   
   
   
float ran1(int *idum)   
{   
static long ix1,ix2,ix3;   
static float r[98];   
float temp;   
static int iff=0;   
int j;   
   
if (*idum < 0 || iff == 0)   
  {   
   iff = 1;   
   ix1 = (IC1-(*idum)) % M1;   
   ix1 = (IA1*ix1+IC1) % M1;   
   ix2 = ix1 % M2;   
   ix1 = (IA1*ix1+IC1) % M1;   
   ix3 = ix1 % M3;   
   for (j=1;j<=97;j++)   
     {   
      ix1 = (IA1*ix1+IC1) % M1;   
      ix2 = (IA2*ix2+IC2) % M2;   
      r[j] = (ix1+ix2*RM2)*RM1;   
    }   
   *idum = 1;   
 }   
ix1 = (IA1*ix1+IC1) % M1;   
ix2 = (IA2*ix2+IC2) % M2;   
ix3 = (IA3*ix3+IC3) % M3;   
j = 1 + ((97*ix3)/M3);   
if (j > 97 || j < 1)   
  {   
   printf("\nerror in 'ran1':  this shouldn't happen?!\n");   
   exit(1);   
 }   
temp = r[j];   
r[j] = (ix1+ix2*RM2)*RM1;   
return(temp);   
}   
   
float gasdev(int *idum)   
{   
static int iset=0;   
static float gset;   
float fac,r,v1,v2;   
float ran1();   
   
if (iset == 0)   
  {   
   do {   
       v1 = 2.0*ran1(idum)-1.0;   
       v2 = 2.0*ran1(idum)-1.0;   
       r = v1*v1 + v2*v2;   
     }  while (r >= 1.0);   
   fac = sqrt(-2.0*log(r)/r);   
   gset = v1*fac;   
   iset = 1;   
   return(v2*fac);   
 }   
else   
  {   
   iset = 0;   
   return(gset);   
 }   
}   
   
matrix *s_times_m(double scalar,matrix *A,matrix *B)   
{   
int i,j;   
   
conform_matrix(A->rows,A->cols,B);   
for (i = 0; i < A->rows; i++)   
   for (j = 0; j < A->cols; j++)   
       (B->elem)[i][j] = scalar*(A->elem)[i][j];   
return(B);   
}   
   
matrix *mul_elem(matrix *A,matrix *B,matrix *C)   
{   
int i,j;   
   
if (A->rows != B->rows || A->cols != B->cols)   
  {   
   printf("\nerror in 'mul_elem':  input matrices have\n");   
   printf("uncompatible dimensions\n");   
   printf("\n matrix %s is %d by %d, and matrix %s is %d by %d\n",   
           A->name,A->rows,A->cols,B->name,B->rows,B->cols);   
   exit(1);   
 }   
conform_matrix(A->rows,A->cols,C);   
for (i = 0; i < A->rows; i++)   
   for (j = 0; j < A->cols; j++)   
       (C->elem)[i][j] = (A->elem)[i][j]*(B->elem)[i][j];   
return(C);   
}   
   
   
matrix *replace_elements(EL_TYPE **new_elements,int rows,int cols,matrix *A)   
{   
int i;   
   
if (rows < 0)   
   neg_index_error("replace_elements","rows",rows,A);   
else if (cols < 0)   
   neg_index_error("replace_elements","cols",cols,A);   
if (A->rows > 0 || A->cols > 0)   
  {   
  for (i = 0; i < A->rows; i++)   
     free((A->elem)[i]);   
  free(A->elem);   
  }   
A->elem = new_elements;   
A->rows = rows;   
A->cols = cols;   
return(A);   
}   
   
matrix *conv(matrix *A,matrix *B,matrix *C)   
{   
int i,j;   
EL_TYPE **new_mat;   
   
if (A->cols == 1 && B->cols == 1)   
  {   
   if (C != A && C != B)   
     {   
      conform_matrix(A->rows+B->rows-1,1,C);   
      if (A->rows >= B->rows)   
	{   
         for (i = 0; i <= B->rows-2; i++)   
	   {   
            (C->elem)[i][0] = 0.0;   
            for (j = 0; j <= i; j++)   
               (C->elem)[i][0] += (A->elem)[i-j][0]*(B->elem)[j][0];   
          }   
         for (i = B->rows-1; i <= A->rows-1; i++)   
           {   
            (C->elem)[i][0] = 0.0;   
            for (j = 0; j <= B->rows-1; j++)   
	       (C->elem)[i][0] += (A->elem)[i-j][0]*(B->elem)[j][0];   
          }   
         for (i = A->rows; i <= A->rows+B->rows-2; i++)   
           {   
            (C->elem)[i][0] = 0.0;   
            for (j = i-A->rows+1; j <= B->rows-1; j++)   
               (C->elem)[i][0] += (A->elem)[i-j][0]*(B->elem)[j][0];   
          }     
        }     
      else   
        {   
         for (i = 0; i <= A->rows-2; i++)   
	   {   
            (C->elem)[i][0] = 0.0;   
            for (j = 0; j <= i; j++)   
               (C->elem)[i][0] += (B->elem)[i-j][0]*(A->elem)[j][0];   
          }   
         for (i = A->rows-1; i <= B->rows-1; i++)   
           {   
            (C->elem)[i][0] = 0.0;   
            for (j = 0; j <= A->rows-1; j++)   
	       (C->elem)[i][0] += (B->elem)[i-j][0]*(A->elem)[j][0];   
          }   
         for (i = B->rows; i <= A->rows+B->rows-2; i++)   
           {   
            (C->elem)[i][0] = 0.0;   
            for (j = i-B->rows+1; j <= A->rows-1; j++)   
               (C->elem)[i][0] += (B->elem)[i-j][0]*(A->elem)[j][0];   
          }     
        }   
    }   
   else   
     {   
      if ((new_mat = (EL_TYPE **) calloc(A->rows+B->rows-1,sizeof(EL_TYPE *)))   
           == NULL)   
         {   
          printf("error in 'conv':  calloc call failed - \n");   
          printf("  not enough memory!!\n");   
          exit(1);   
        }   
      for (i = 0; i < A->rows+B->rows-1; i++)   
         if ((new_mat[i] = (EL_TYPE *) calloc(1,sizeof(EL_TYPE))) == NULL)   
            {   
             printf("error in 'conv':  calloc call failed - \n");   
             printf("  not enough memory!!\n");   
             exit(1);   
            }   
      if (A->rows >= B->rows)   
	{   
         for (i = 0; i <= B->rows-2; i++)   
	   {   
            new_mat[i][0] = 0.0;   
            for (j = 0; j <= i; j++)   
               new_mat[i][0] += (A->elem)[i-j][0]*(B->elem)[j][0];   
          }   
         for (i = B->rows-1; i <= A->rows-1; i++)   
           {   
            new_mat[i][0] = 0.0;   
            for (j = 0; j <= B->rows-1; j++)   
	       new_mat[i][0] += (A->elem)[i-j][0]*(B->elem)[j][0];   
          }   
         for (i = A->rows; i <= A->rows+B->rows-2; i++)   
           {   
            new_mat[i][0] = 0.0;   
            for (j = i-A->rows+1; j <= B->rows-1; j++)   
               new_mat[i][0] += (A->elem)[i-j][0]*(B->elem)[j][0];   
          }     
        }     
      else   
        {   
         for (i = 0; i <= A->rows-2; i++)   
	   {   
            new_mat[i][0] = 0.0;   
            for (j = 0; j <= i; j++)   
               new_mat[i][0] += (B->elem)[i-j][0]*(A->elem)[j][0];   
          }   
         for (i = A->rows-1; i <= B->rows-1; i++)   
           {   
            new_mat[i][0] = 0.0;   
            for (j = 0; j <= A->rows-1; j++)   
	       new_mat[i][0] += (B->elem)[i-j][0]*(A->elem)[j][0];   
          }   
         for (i = B->rows; i <= A->rows+B->rows-2; i++)   
           {   
            new_mat[i][0] = 0.0;   
            for (j = i-B->rows+1; j <= A->rows-1; j++)   
               new_mat[i][0] += (B->elem)[i-j][0]*(A->elem)[j][0];   
          }     
        }   
      replace_elements(new_mat,A->rows+B->rows-1,1,C);   
    }   
 }   
   
else if (A->rows == 1 && B->rows == 1)   
  {   
   if (C != A && C != B)   
     {   
      conform_matrix(1,A->cols+B->cols-1,C);   
      if (A->cols >= B->cols)   
	{   
         for (i = 0; i <= B->cols-2; i++)   
	   {   
            (C->elem)[0][i] = 0.0;   
            for (j = 0; j <= i; j++)   
               (C->elem)[0][i] += (A->elem)[0][i-j]*(B->elem)[0][j];   
          }   
         for (i = B->cols-1; i <= A->cols-1; i++)   
           {   
            (C->elem)[0][i] = 0.0;   
            for (j = 0; j <= B->cols-1; j++)   
	       (C->elem)[0][i] += (A->elem)[0][i-j]*(B->elem)[0][j];   
          }   
         for (i = A->cols; i <= A->cols+B->cols-2; i++)   
           {   
            (C->elem)[0][i] = 0.0;   
            for (j = i-A->cols+1; j <= B->cols-1; j++)   
               (C->elem)[0][i] += (A->elem)[0][i-j]*(B->elem)[0][j];   
          }     
        }     
      else   
	{   
         for (i = 0; i <= A->cols-2; i++)   
	   {   
            (C->elem)[0][i] = 0.0;   
            for (j = 0; j <= i; j++)   
               (C->elem)[0][i] += (B->elem)[0][i-j]*(A->elem)[0][j];   
          }   
         for (i = A->cols-1; i <= B->cols-1; i++)   
           {   
            (C->elem)[0][i] = 0.0;   
            for (j = 0; j <= A->cols-1; j++)   
	       (C->elem)[0][i] += (B->elem)[0][i-j]*(A->elem)[0][j];   
          }   
         for (i = B->cols; i <= A->cols+B->cols-2; i++)   
           {   
            (C->elem)[0][i] = 0.0;   
            for (j = i-B->cols+1; j <= A->cols-1; j++)   
               (C->elem)[0][i] += (B->elem)[0][i-j]*(A->elem)[0][j];   
          }     
        }   
    }   
   else   
     {   
      if ((new_mat = (EL_TYPE **) calloc(1,sizeof(EL_TYPE *))) == NULL)   
         {   
          printf("error in 'conv':  calloc call failed - \n");   
          printf("  not enough memory!!\n");   
          exit(1);   
        }   
      if ((new_mat[0] = (EL_TYPE *) calloc(A->cols+B->cols-1,sizeof(EL_TYPE))) ==   
           NULL)   
         {   
          printf("error in 'conv':  calloc call failed - \n");   
          printf("  not enough memory!!\n");   
          exit(1);   
        }   
      if (A->cols >= B->cols)   
	{   
         for (i = 0; i <= B->cols-2; i++)   
	   {   
            new_mat[0][i] = 0.0;   
            for (j = 0; j <= i; j++)   
               new_mat[0][i] += (A->elem)[0][i-j]*(B->elem)[0][j];   
          }   
         for (i = B->cols-1; i <= A->cols-1; i++)   
           {   
            new_mat[0][i] = 0.0;   
            for (j = 0; j <= B->cols-1; j++)   
	       new_mat[0][i] += (A->elem)[0][i-j]*(B->elem)[0][j];   
          }   
         for (i = A->cols; i <= A->cols+B->cols-2; i++)   
           {   
            new_mat[0][i] = 0.0;   
            for (j = i-A->cols+1; j <= B->cols-1; j++)   
               new_mat[0][i] += (A->elem)[0][i-j]*(B->elem)[0][j];   
          }     
        }     
      else   
	{   
         for (i = 0; i <= A->cols-2; i++)   
	   {   
            new_mat[0][i] = 0.0;   
            for (j = 0; j <= i; j++)   
               new_mat[0][i] += (B->elem)[0][i-j]*(A->elem)[0][j];   
          }   
         for (i = A->cols-1; i <= B->cols-1; i++)   
           {   
            new_mat[0][i] = 0.0;   
            for (j = 0; j <= A->cols-1; j++)   
	       new_mat[0][i] += (B->elem)[0][i-j]*(A->elem)[0][j];   
          }   
         for (i = B->cols; i <= A->cols+B->cols-2; i++)   
           {   
            new_mat[0][i] = 0.0;   
            for (j = i-B->cols+1; j <= A->cols-1; j++)   
               new_mat[0][i] += (B->elem)[0][i-j]*(A->elem)[0][j];   
          }     
        }   
      replace_elements(new_mat,1,A->cols+B->cols-1,C);   
    }   
 }   
   
else   
  {   
   printf("\nerror in 'conv':  input matrices must BOTH be\n");   
   printf("row vectors or must BOTH be column vectors\n");   
   printf("\n  matrix %s is %d by %d, matrix %s is %d by %d\n",   
           A->name,A->rows,A->cols,B->name,B->rows,B->cols);   
   exit(1);   
 }   
return(C);   
}   
   
matrix *s_in_m(matrix *input,int top_row,int left_col,matrix *out)   
{   
int i,j;   
   
if (top_row < 0)   
   neg_index_error("s_in_m","top_row",top_row,out);   
else if (left_col < 0)   
   neg_index_error("s_in_m","left_col",left_col,out);   
if (input == out)   
   {   
   printf("\nerror in 's_in_m': input matrix cannot be the same as\n");   
   printf("output matrix for this function\n");   
   printf("       input matrix: %s, output matrix: %s\n",   
          input->name,out->name);   
   exit(1);   
 }   
else if (out->rows < top_row+input->rows)   
  {   
   printf("\nerror in 's_in_m':  output matrix doesn't have enough\n");   
   printf("rows to allow input matrix to be fitted in\n");   
   printf(" output matrix %s has %d rows, input matrix %s has %d rows, and\n",   
           out->name,out->rows,input->name,input->rows);   
   printf(" top row index for substituting into out matrix specified as %d\n",   
           top_row);   
   exit(1);   
 }   
else if (out->cols < left_col+input->cols)   
  {   
   printf("\nerror in 's_in_m':  output matrix doesn't have enough\n");   
   printf("columns to allow input matrix to be fitted in\n");   
   printf(" output matrix %s has %d cols, input matrix %s has %d cols, and\n",   
           out->name,out->cols,input->name,input->cols);   
   printf(" left col index for substituting into out matrix specified as %d\n",   
           left_col);   
   exit(1);   
 }   
if (out == input)   
  {   
   printf("error in 's_in_m':  matrix to be substituted in cannot\n");   
   printf("be the same as the matrix substituted into\n");   
   printf("     both are specified as matrix %s in this case\n",out->name);   
   exit(1);   
 }   
for (i = 0; i < input->rows; i++)   
   for (j = 0; j < input->cols; j++)   
      (out->elem)[i+top_row][j+left_col] = (input->elem)[i][j];   
return(out);   
}   
   
matrix *trans(matrix *A,matrix *B)   
{   
int i,j;   
EL_TYPE **temp_matrix;   
   
if (A != B)   
  {   
   conform_matrix(A->cols,A->rows,B);   
   for (i = 0; i < A->cols; i++)   
      for (j = 0; j < A->rows; j++)   
          (B->elem)[i][j] = (A->elem)[j][i];   
 }   
else   
  {   
   if ((temp_matrix = (EL_TYPE **) calloc(A->cols,sizeof(EL_TYPE *))) == NULL)   
      {   
       printf("error in 'trans':  calloc call failed - \n");   
       printf("  not enough memory!!\n");   
       exit(1);   
     }   
   for (i = 0; i < A->cols; i++)   
      if ((temp_matrix[i] = (EL_TYPE *) calloc(A->rows,sizeof(EL_TYPE))) == NULL)   
         {   
          printf("error in 'trans':  calloc call failed - \n");   
          printf("  not enough memory!!\n");   
          exit(1);   
        }   
   for (i = 0; i < A->cols; i++)   
      for (j = 0; j < A->rows; j++)   
          temp_matrix[i][j] = (A->elem)[j][i];   
   replace_elements(temp_matrix,A->cols,A->rows,B);   
 }   
return(B);   
}   
   
matrix *p_of_m(matrix *input,int top_row,int left_col,int bot_row,int right_col,matrix *out)   
{   
int i,j,new_rows,new_cols;   
EL_TYPE **temp_matrix;   
   
if (top_row < 0)   
   neg_index_error("p_of_m","top_row",top_row,input);   
else if (left_col < 0)   
   neg_index_error("p_of_m","left_col",left_col,input);   
else if (bot_row < 0)   
   neg_index_error("p_of_m","bot_row",bot_row,input);   
else if (right_col < 0)   
   neg_index_error("p_of_m","right_col",right_col,input);   
if (input->rows-1 < bot_row)   
  {   
   printf("\nerror in 'p_of_m':  bottom row specified as %d,\n",   
          bot_row);   
   printf("but highest row index of matrix %s is %d\n",input->name,   
           input->rows-1);   
   exit(1);   
 }   
else if (input->cols-1 < right_col)   
  {   
   printf("\nerror in 'p_of_m':  rightmost column specified as %d,\n",   
           right_col);   
   printf("but highest column index of matrix %s is %d\n",input->name,   
           input->cols-1);   
   exit(1);   
 }   
else if (top_row > bot_row)   
  {   
   printf("\nerror in 'p_of_m':  top row is specified as %d,\n",   
           top_row);   
   printf("bottom row should be larger than this, but is specified as %d\n",   
           bot_row);   
   printf("for matrix %s\n",input->name); 
   exit(1);   
 }   
else if (right_col < left_col)   
   {    
    printf("\nerror in 'p_of_m':  left column is specified as %d,\n",   
            left_col);   
    printf("right column should be larger than this, but is specified as %d\n",   
            right_col);   
    printf("for matrix %s\n",input->name); 
    exit(1);   
  }   
new_rows = bot_row-top_row+1;   
new_cols = right_col-left_col+1;   
if (input != out)   
  {   
   conform_matrix(new_rows,new_cols,out);   
   for (i = top_row; i <= bot_row; i++)   
      for (j = left_col; j <= right_col; j++)   
          (out->elem)[i-top_row][j-left_col] = (input->elem)[i][j];   
 }   
else   
  {   
   if ((temp_matrix = (EL_TYPE **) calloc(new_rows,sizeof(EL_TYPE *))) == NULL)   
      {   
       printf("error in 'p_of_m':  calloc call failed - \n");   
       printf("  not enough memory!!\n");   
       exit(1);   
     }   
   for (i = 0; i < new_rows; i++)   
     if ((temp_matrix[i] = (EL_TYPE *) calloc(new_cols,sizeof(EL_TYPE))) == NULL)   
        {   
         printf("error in 'p_of_m':  calloc call failed - \n");   
         printf("  not enough memory!!\n");   
         exit(1);   
        }   
   for (i = top_row; i <= bot_row; i++)   
      for (j = left_col; j <= right_col; j++)   
          temp_matrix[i-top_row][j-left_col] = (input->elem)[i][j];      
   replace_elements(temp_matrix,new_rows,new_cols,out);   
 }   
return(out);   
}   
   
matrix *s_to_m(double scalar,int rows,int cols,matrix *A)   
{   
int i,j;   
   
if (rows < 0)   
   neg_index_error("s_to_m","rows",rows,A);   
else if (cols < 0)   
   neg_index_error("s_to_m","cols",cols,A);   
conform_matrix(rows,cols,A);   
for (i = 0; i < A->rows; i++)   
   for (j = 0; j < A->cols; j++)   
       (A->elem)[i][j] = scalar;   
return(A);   
}   
   
double mean(matrix *A) 
{   
int i;   
double total;   
   
if (A->cols != 1 && A->rows != 1)   
  {   
   printf("\nerror in 'mean':  matrix %s is not a vector!\n",A->name);   
   printf("\n'mean' requires input matrix to have one column or\n");   
   printf("one row, while matrix %s is %d by %d\n",A->name,A->rows,A->cols);   
   exit(1);   
 }   
total = 0;   
if (A->cols == 1)   
  {   
   if (A->rows == 0)  
     {  
      printf("error in 'mean':  input matrix '%s' is %d by %d!\n",A->name,A->rows,A->cols);  
      exit(1);  
    }  
   for (i = 0;i < A->rows;i++)   
      total += (A->elem)[i][0];   
   return(total/(A->rows));   
 }   
else   
  {   
   if (A->cols == 0)  
     {  
      printf("error in 'mean':  input matrix '%s' is %d by %d!\n",A->name,A->rows,A->cols);  
      exit(1);  
    }  
   for (i = 0;i < A->cols;i++)   
      total += (A->elem)[0][i];   
   return(total/(A->cols));   
 }   
}   
   
double var(matrix *A)   
{   
int i;   
double total,bias,mean_A;   
   
if (A->cols != 1 && A->rows != 1)   
  {   
   printf("\nerror in 'var':  matrix '%s' is not a vector!\n",A->name);   
   printf("\n'var' requires input matrix to have one column or\n");   
   printf("one row, while matrix %s is %d by %d\n",A->name,A->rows,A->cols);   
   exit(1);   
 }   
total = 0;   
if (A->cols == 1)   
  {  
   if (A->rows == 0)  
      {  
       printf("error in 'var':  matrix '%s' is %d by %d!\n",A->name,A->rows,A->cols);  
       exit(1);  
     }  
   for (i = 0;i < A->rows;i++)   
      total += (A->elem)[i][0]*(A->elem)[i][0];   
   if (A->rows == 1)  
      bias = 0.0;  
   else  
      bias = ((double) A->rows)/((double) (A->rows-1));   
   mean_A = mean(A);  
   return(bias*((total/A->rows) - mean_A*mean_A));   
 }   
else   
  {   
   if (A->cols == 0)  
      {  
       printf("error in 'var':  matrix '%s' is %d by %d!\n",A->name,A->rows,A->cols);  
       exit(1);  
     }  
   for (i = 0;i < A->cols;i++)   
      total += (A->elem)[0][i]*(A->elem)[0][i];   
   if (A->cols == 1)  
      bias = 0.0;  
   else  
      bias = ((double) A->cols)/((double) (A->cols-1));   
   mean_A = mean(A);  
   return(bias*((total/A->cols) - mean_A*mean_A));   
 }   
}   
   
   
   
matrix *add(matrix *A,matrix *B,matrix *C)   
{   
int i,j;   
   
if (A->rows != B->rows || A->cols != B->cols)   
  {   
   printf("error in 'add':  attempt to add uncompatible matrices\n\n");   
   printf("matrix %s is %d by %d, and matrix %s is %d by %d\n",   
           A->name,A->rows,A->cols,B->name,B->rows,B->cols);   
   exit(1);   
 }   
conform_matrix(A->rows,A->cols,C);   
for (i = 0; i < A->rows; i++)   
   for (j = 0; j < A->cols; j++)   
       (C->elem)[i][j] = (A->elem)[i][j] + (B->elem)[i][j];   
return(C);   
}   
   
matrix *sub(matrix *A,matrix *B,matrix *C)   
{   
int i,j;   
   
if (A->rows != B->rows || A->cols != B->cols)   
  {   
   printf("error in 'sub':  attempt to subtract uncomp. matrices\n\n");   
   printf("matrix %s is %d by %d, and matrix %s is %d by %d\n",   
           A->name,A->rows,A->cols,B->name,B->rows,B->cols);   
   exit(1);   
 }   
conform_matrix(A->rows,A->cols,C);   
for (i = 0; i < A->rows; i++)   
   for (j = 0; j < A->cols; j++)   
       (C->elem)[i][j] = (A->elem)[i][j] - (B->elem)[i][j];   
return(C);   
}   
   
matrix *print(matrix *A)   
{   
int i,j;   
   
printf("\nmatrix:  %s   (%d by %d)\n\n",A->name,A->rows,A->cols);   
for (i=0;i < A->rows;i++)   
  {   
   for (j=0;j < A->cols;j++)   
     printf("%10.6e ",(A->elem)[i][j]);   
   printf("\n");   
 }   
return(A);   
}   
   
matrix *init(char *name)   
{   
matrix *A;   
int i;   
   
if ((A = (matrix *) malloc(sizeof(matrix))) == NULL)   
   {   
   printf("error in 'init':  malloc call failed\n");   
   printf("out of memory!\n");   
   exit(1);   
  }   
strncpy(A->name,name,29);   
A->rows = 0;   
A->cols = 0;   
return(A);   
}   
   
matrix *conform_matrix(int rows,int cols,matrix *A)   
{   
int i;   
   
if (rows < 0)   
   neg_index_error("conform_matrix","rows",rows,A);   
if (cols < 0)   
   neg_index_error("conform_matrix","cols",cols,A);   
if (A->rows != rows || A->cols != cols)
  {   
   if (A->rows > 0 || A->cols > 0)   
     {   
     for (i = 0; i < A->rows; i++)   
        free((A->elem)[i]);   
     free(A->elem);   
     }   
   if (rows > 0 && cols > 0)   
     {   
     if ((A->elem = (EL_TYPE **) calloc(rows,sizeof(EL_TYPE *))) == NULL)   
        {   
         printf("error in 'conform_matrix':  calloc call failed - \n");   
         printf("  not enough memory!!\n");   
         exit(1);   
       }   
     for (i = 0; i < rows; i++)   
        if (((A->elem)[i] = (EL_TYPE *) calloc(cols,sizeof(EL_TYPE))) == NULL)   
           {   
            printf("error in 'conform_matrix':  calloc call failed - \n");   
            printf("  not enough memory!!\n");   
            exit(1);   
          }   
    }   
 }   
A->rows = rows;   
A->cols = cols;   
return(A);   
}   

matrix *load(char filename[],matrix *A)   
{   
FILE *fp;   
int i,j,entry_count,row_count,col_count,char_count,temp_col_count,flag;   
int file_segment_flag,dummy_count,line_count;   
char line[MAX_FILE_CHAR+1],name[MAX_FILE_CHAR+1];   
float dummy_var;

char task[30];
int rows,cols;   
   
if ((fp = fopen(filename,"r")) == NULL)   
  {   
   printf("\nerror in 'load': file %s can't be opened\n",filename);   
   exit(1);   
 }   

/* task: can be a matrix name or "exclusive", "exclusive" meaning that
         only one matrix is contained in the file.
         this parameter was rarely used, and is now always set to "exclusive"
*/
sprintf(task,"exclusive");
/* rows/cols:  can be used to limit the number of data points retrieved
               from the file to what's set by these values.
               these parameters were rarely used in the past, and are now
               always set to 0 so that the all of the points are obtained
               from the file
*/
rows = 0;
cols = 0;

if (strcmp(task,"exclusive") == 0)   
   file_segment_flag = 2;   
else   
   file_segment_flag = 0;   
if (rows <= 0 || cols <= 0)   
  {   
   col_count = row_count = line_count = 0;   
   while(1)   
     {   
      if (fgets(line,MAX_FILE_CHAR+1,fp) != NULL)   
	{   
         line_count++;   
         if (sscanf(line,"%f",&dummy_var) == 0)   
	   {   
            if (sscanf(line,"%s",name) != 0)   
              {   
               if (file_segment_flag == 2)   
                  continue;   
               else if (strcmp(task,name) == 0)   
	         {   
                  file_segment_flag = 1;   
                  continue;   
	         }   
               else   
                   file_segment_flag = 0;   
	     }   
	  }   
         if (file_segment_flag)   
	   {   
            char_count = temp_col_count = flag = 0;   
            while (line[char_count] != '\0' && line[char_count] != '\n')   
	      {   
               if (line[char_count] != ' ' && flag == 0)   
	         {   
                  temp_col_count += 1;   
                  flag = 1;   
	        }   
               if (line[char_count] == ' ' && flag == 1)   
                  flag = 0;   
               char_count++;   
	     }   
            if (col_count == 0)   
               col_count = temp_col_count;   
            else if (col_count != temp_col_count && (rows <= 0 || cols <= 0)   
                      && temp_col_count != 0)   
	         {   
                  printf("error in 'load':\n\n");   
                  printf("  file '%s':  number of cols needs to be the same in each row\n",filename);   
                  printf("              in order to fill matrix %s\n",A->name);   
                  printf("(this condition is violated on line %d of file)\n",   
                          line_count);   
                  exit(1);   
	        }   
            if (temp_col_count > 0)   
               row_count++;   
	  }   
       }   
     else   
        break;   
    }   
   rows = row_count;   
   cols = col_count;   
   rewind(fp);   
 }   
      conform_matrix(rows,cols,A);   
      entry_count = 0;   
      if (file_segment_flag != 2)   
         file_segment_flag = 0;   
      for (i = 0; i < A->rows; i++)   
         for (j = 0; j < A->cols; j++)   
           {   
            if (fscanf(fp,"%s",name) == EOF)   
               {   
               printf("\nerror in 'load':  matrix %s needs %d values,\n",   
                       A->name,rows*cols);    
               printf("but file %s has only %d data values to fill it with\n",   
                       filename,entry_count);   
               exit(1);   
             }   
            if (atof(name) == 0)   
	      {   
               flag = 0;   
               for (dummy_count = 0; dummy_count < MAX_FILE_CHAR &&    
                    name[dummy_count] != '\0' && name[dummy_count] != '\n';   
                    dummy_count++)   
		 {   
                  if (name[dummy_count] == '0')   
		    {   
                     if (dummy_count == 0)   
                         flag = 1;   
                     else if (name[dummy_count-1] == ' ' ||   
                              name[dummy_count-1] == '.' ||   
                              name[dummy_count-1] == '-')   
                         flag = 1;   
                     break;   
		    }   
                  else   
                      continue;   
		}   
               if (flag == 0)   
		 {   
                  j--;   
                  if (file_segment_flag == 2)   
                     continue;   
                  else if (strcmp(task,name) == 0)   
	            {   
                     file_segment_flag = 1;   
                     continue;   
	            }   
                  else   
                    {   
                     file_segment_flag = 0;    
                     continue;   
		   }   
		}   
	     }   
           if (file_segment_flag != 0)   
	     {   
              A->elem[i][j] = (EL_TYPE) atof(name);   
              entry_count++;   
	     }   
           else   
               j--;   
	  }   
   
fclose(fp);   
return(A);   
}   
   
matrix *mul(matrix *A,matrix *B,matrix *C)   
{   
int i,j,k;   
EL_TYPE **temp_elem;   
   
if (A->cols != B->rows)   
  {   
   printf("\nerror in 'mul':  attempt to multiply uncomp. matrices\n\n");   
   printf("matrix %s is %d by %d, and matrix %s is %d by %d\n", A->name,    
           A->rows,A->cols,B->name,B->rows,B->cols);   
   exit(1);   
 }   
if (A != C && B != C)   
  {   
   conform_matrix(A->rows,B->cols,C);   
   for (i = 0;i < A->rows; i++)   
      for (j = 0;j < B->cols; j++)   
        {   
         (C->elem)[i][j] = 0;   
         for (k = 0;k < A->cols; k++)   
            (C->elem)[i][j] += (A->elem)[i][k] * (B->elem)[k][j];   
       }   
 }   
else   
  {   
   if ((temp_elem = (EL_TYPE **) calloc(A->rows,sizeof(EL_TYPE *))) == NULL)   
      {   
       printf("error in 'mul':  calloc call failed - \n");   
       printf("  not enough memory!!\n");   
       exit(1);   
     }   
   for (i = 0;i < A->rows; i++)   
      if ((temp_elem[i] = (EL_TYPE *) calloc(B->cols,sizeof(EL_TYPE))) == NULL)   
         {   
          printf("error in 'mul':  calloc call failed - \n");   
          printf("  not enough memory!!\n");   
          exit(1);   
        }   
   for (i = 0;i < A->rows; i++)   
      for (j = 0;j < B->cols; j++)   
        {   
         temp_elem[i][j] = 0;   
         for (k = 0;k < A->cols; k++)   
            temp_elem[i][j] += (A->elem)[i][k]*(B->elem)[k][j];   
       }   
   replace_elements(temp_elem,A->rows,B->cols,C);      
 }   
return(C);   
}        
   
   
matrix *reverse(matrix *A,matrix *B)   
{   
EL_TYPE **temp;   
int i;   
   
if (A->cols == 1)   
  {   
   if (A != B)   
     {   
      conform_matrix(A->rows,A->cols,B);   
      for (i = 0; i < A->rows; i++)   
          B->elem[i][0] = A->elem[A->rows-1-i][0];   
    }   
   else   
     {   
      if ((temp = (EL_TYPE **) calloc(A->rows,sizeof(EL_TYPE *))) == NULL)   
	{   
         printf("error in 'reverse':  calloc call failed!\n");   
         printf(" (not enough memory)\n");   
         exit(1);   
       }   
      for (i = 0; i < A->rows; i++)   
         if ((temp[i] = (EL_TYPE *) calloc(A->cols,sizeof(EL_TYPE))) == NULL)   
	   {   
            printf("error in 'reverse':  calloc call failed!\n");   
            printf(" (not enough memory)\n");   
            exit(1);   
          }        
      for (i = 0; i < A->rows; i++)   
          temp[i][0] = A->elem[A->rows-1-i][0];   
      replace_elements(temp,A->rows,A->cols,B);   
    }   
 }   
else if (A->rows == 1)   
  {   
   if (A != B)   
     {   
      conform_matrix(A->rows,A->cols,B);   
      for (i = 0; i < A->cols; i++)   
          B->elem[0][i] = A->elem[0][A->cols-1-i];   
    }   
   else   
     {   
      if ((temp = (EL_TYPE **) calloc(A->rows,sizeof(EL_TYPE *))) == NULL)   
	{   
         printf("error in 'reverse':  calloc call failed!\n");   
         printf(" (not enough memory)\n");   
         exit(1);   
       }   
      for (i = 0; i < A->rows; i++)   
         if ((temp[i] = (EL_TYPE *) calloc(A->cols,sizeof(EL_TYPE))) == NULL)   
	   {   
            printf("error in 'reverse':  calloc call failed!\n");   
            printf(" (not enough memory)\n");   
            exit(1);   
          }        
      for (i = 0; i < A->cols; i++)   
          temp[0][i] = A->elem[0][A->cols-1-i];   
      replace_elements(temp,A->rows,A->cols,B);   
    }   
  }   
else   
  {   
   printf("error in 'reverse':  input matrix must be a column or row vector\n");   
   printf("  (input matrix %s is %d by %d)\n",A->name,A->rows,A->cols);   
   exit(1);   
 }   
return(B);   
}   

matrix *least_sq(matrix *A,matrix *b,matrix *x)   
{   
int jj,j,i;   
EL_TYPE s;   
EL_TYPE *tmp,*b_temp;   
matrix *U,*W,*V;   
EL_TYPE max;   
   
if (b->cols != 1)   
  {   
   printf("error in 'least_sq':  input matrix b (of A*x = b) must be\n");   
   printf("a column vector!\n");   
   printf("  in this case, b was specified as matrix %s, which is %d by %d\n",   
           b->name,b->rows,b->cols);   
   exit(1);   
 }   
if (b->rows != A->rows)   
  {   
   printf("error in 'least_sq':  input matrix b (of A*x = b) must\n");   
   printf("have the same number of rows as A\n");   
   printf("  in this case, A was specified as matrix %s, which is %d by %d\n",   
           A->name,A->rows,A->cols);   
   printf("                b was specified as matrix %s, which is %d by %d\n",   
           b->name,b->rows,b->cols);   
   exit(1);   
 }   
U = init("matrix_U_used_by_least_sq");   
W = init("matrix_W_used_by_least_sq");   
V = init("matrix_V_used_by_least_sq");   
if ((tmp = (EL_TYPE *) calloc(A->cols,sizeof(EL_TYPE))) == NULL)   
  {   
   printf("error in 'least_sq':  calloc call failed!\n");   
   printf("    (not enough memory)\n");   
   exit(1);   
 }   
if (A->rows < A->cols)   
  {   
   conform_matrix(A->cols,A->cols,U);   
   for (i = 0; i < A->rows; i++)   
      for (j = 0; j < A->cols; j++)   
          U->elem[i][j] = A->elem[i][j];   
   for (i = A->rows; i < A->cols; i++)   
      for (j = 0; j < A->cols; j++)   
          U->elem[i][j] = 0.0;   
   svd(U,U,W,V);   
 }   
else   
  {   
   svd(A,U,W,V);   
 }   

max = fabs(W->elem[0][0]);   
for (i = 1; i < W->cols; i++)   
    if (max < fabs(W->elem[i][i]))   
         max = fabs(W->elem[i][i]);   
for (j = 0; j < A->cols; j++)   
  {   
   s = 0.0;   
   if ((fabs(W->elem[j][j]) >= LS_SP_SV_L*max && EL_TYPE_NUMBER == 1) ||   
        (fabs(W->elem[j][j]) >= LS_DP_SV_L*max && EL_TYPE_NUMBER == 2))   
     {   
      for (i = 0; i < A->rows; i++)   
         s += U->elem[i][j]*b->elem[i][0];   
      s /= W->elem[j][j];   
    }   
   else 
     { 
      printf("warning in 'least_sq':  singular values that are too small\n"); 
      printf("    have their inverse set to zero as 'A-inverse' is calculated\n"); 
      printf("    one such singular value has occurred in matrix '%s'\n",A->name); 
      printf("  with a max sing. value of '%f' occurring in matrix '%s',\n",max,A->name); 
      printf("      the sing. value '%f' was considered too small\n",W->elem[j][j]); 
      printf("            calculation continuing....\n"); 
    }     
   tmp[j] = s;   
 }  
conform_matrix(A->cols,1,x);    
for (j = 0; j < V->rows; j++)   
  {   
   s  = 0.0;   
   for (jj = 0; jj < V->cols; jj++)   
      s += V->elem[j][jj]*tmp[jj];   
   x->elem[j][0] = s;   
 }   
free(tmp);   
conform_matrix(0,0,U);   
free(U);   
conform_matrix(0,0,W);   
free(W);   
conform_matrix(0,0,V);   
free(V);   
/* if (check_file != NULL)   
   fprintf(check_file,"'least_sq':  A*x=b   A:  %s (%d by %d), b:  %s (%d by %d), x:  %s (%d by %d)",A->name,A->rows,A->cols,b->name,b->rows,b->cols,x->name,x->rows,x->cols); */   
return(x);   
}   
 
 
 
				         
   
matrix *inv(matrix *A,matrix *B)   
{   
matrix *U,*W,*V;   
double inv_rcond,max,min;   
int i;   
   
if (A->rows != A->cols)   
  {   
   printf("error in 'inv':  input matrix is not square!\n");   
   printf("  (input matrix %s is %d by %d\n",A->name,A->rows,A->cols);   
   exit(1);   
 }   
U = init("U_matrix_used_by_inv");   
W = init("W_matrix_used_by_inv");   
V = init("V_matrix_used_by_inv");   
conform_matrix(A->rows,A->cols,U);   
conform_matrix(A->cols,A->cols,W);   
conform_matrix(A->cols,A->cols,V);   
svd(A,U,W,V);   
max = min = fabs(W->elem[0][0]);   
for (i = 1; i < W->cols; i++)   
   {   
    if (W->elem[i][i] > max)   
         max = fabs(W->elem[i][i]);   
    if (W->elem[i][i] < min)   
         min = fabs(W->elem[i][i]);   
   }   
if (EL_TYPE_NUMBER == 1)   
  {   
   if (min <= INV_SP_SV_L*max)   
      {   
       printf("error in 'inv':  input matrix %s is singular!\n",   
               A->name);   
       printf("  (condition number = %f, minimum singular value = %f\n",   
                  max/min,min);   
       exit(1);   
      }   
   if ((inv_rcond = log10(min)-log10(max)) <= INV_SP_RC_L)   
     {   
      printf("warning in 'inv':  input matrix is ill-conditioned!\n");   
      printf("  (matrix %s has condition number: %f)\n",A->name,max/min);    
    }   
 }   
else if (EL_TYPE_NUMBER == 2)   
  {   
   if (min <= INV_DP_SV_L*max)   
      {   
       printf("error in 'inv':  input matrix %s is singular!\n",   
               A->name);   
       printf("  (condition number = %f, minimum singular value = %f\n",   
                  max/min,min);   
       exit(1);   
      }   
   if ((inv_rcond = log10(min)-log10(max)) <= INV_DP_RC_L)   
     {   
      printf("warning in 'inv':  input matrix is ill-conditioned!\n");   
      printf("  (matrix %s has condition number: %f)\n",A->name,max/min);   
    }   
 }   
else   
  {   
   printf("error in defining:  EL_TYPE_NUMBER must be equal to 1 or 2\n");   
   printf("   (currently, EL_TYPE_NUMBER = %d)",EL_TYPE_NUMBER);   
   exit(1);   
 }   
for (i = 0; i < W->cols; i++)   
   W->elem[i][i] = 1.0/W->elem[i][i];   
mul(V,mul(W,trans(U,U),W),B);   
conform_matrix(0,0,U);   
free(U);   
conform_matrix(0,0,W);   
free(W);   
conform_matrix(0,0,V);   
free(V);   
/* if (check_file != NULL)   
   fprintf(check_file,"'inv':  B = inv(A)  B: %s, A:  %s (%d by %d)",B->name,B->rows,B->cols,A->name,A->rows,A->cols); */   
return(B);   
}   
   
 
#define MAX_ITER 50 
 
void svd(matrix *A,matrix *U,matrix *W,matrix *V)   
{   
int flag,i,its,j,jj,k,l,nm,m,n;   
EL_TYPE c,f,h,s,x,y,z;   
EL_TYPE anorm = 0.0,g = 0.0,scale = 0.0,*rv1;   
   
if (A->rows < A->cols)   
  {   
   printf("error in 'svd':  input matrix needs to have more rows than");   
   printf(" columns\n  (input matrix %s is %d by %d)\n",A->name,A->rows,   
           A->cols);   
   exit(1);   
 }   
if (A == W)   
  {   
   printf("error in 'svd':  input matrix A cannot be the same as matrix W!\n");   
   printf("  (in this case, matrix A and W are both specified as matrix %s)\n",   
           A->name);   
   exit(1);   
 }   
if (A == V)   
  {   
   printf("error in 'svd':  input matrix A cannot be the same as matrix V!\n");   
   printf("  (in this case, matrix A and V are both specified as matrix %s)\n",   
           A->name);   
   exit(1);   
 }   
if (U == W || U == V || W == V)   
  {   
   printf("error in 'svd':  matrices U, W, and V must all be different\n");   
   printf("   (in this case, U = matrix %s, W = matrix %s, and V = matrix %s\n",   
           U->name,W->name,V->name);   
   exit(1);   
 }   
conform_matrix(A->rows,A->cols,U);   
if (A != U)   
  {   
   for (i = 0; i < A->rows; i++)   
      for (j = 0; j < A->cols; j++)   
         (U->elem)[i][j] = (A->elem)[i][j];   
 }   
conform_matrix(A->cols,A->cols,W);   
for (i = 0; i < A->cols; i++)   
   for (j = 0; j < A->cols; j++)   
       (W->elem)[i][j] = 0.0;   
conform_matrix(A->cols,A->cols,V);   
if ((rv1 = (EL_TYPE *) calloc(A->cols,sizeof(EL_TYPE))) == NULL)   
  {   
   printf("error in 'svd':  calloc call failed\n");   
   printf(" - not enough memory !\n");   
   exit(1);   
 }   
for (i = 0; i < U->rows; i++)   
   (U->elem)[i]--;   
for (i = 0; i < W->rows; i++)   
   (W->elem)[i]--;   
for (i = 0; i < V->rows; i++)   
   (V->elem)[i]--;   
(U->elem)--;   
(W->elem)--;   
(V->elem)--;   
rv1--;   
        m = A->rows;   
        n = A->cols;   
	for (i=1;i<=n;i++) {   
		l=i+1;   
		rv1[i]=scale*g;   
		g=s=scale=0.0;   
		if (i <= m) {   
			for (k=i;k<=m;k++) scale += fabs(U->elem[k][i]);   
			if (scale) {   
				for (k=i;k<=m;k++) {   
					U->elem[k][i] /= scale;   
					s += U->elem[k][i]*U->elem[k][i];   
				}   
				f=U->elem[i][i];   
				g = -SIGN(sqrt(s),f);   
				h=f*g-s;   
				U->elem[i][i]=f-g;   
				if (i != n) {   
					for (j=l;j<=n;j++) {   
						for (s=0.0,k=i;k<=m;k++) s += U->elem[k][i]*U->elem[k][j];   
						f=s/h;   
						for (k=i;k<=m;k++) U->elem[k][j] += f*U->elem[k][i];   
					}   
				}   
				for (k=i;k<=m;k++) U->elem[k][i] *= scale;   
			}   
		}   
		W->elem[i][i]=scale*g;   
		g=s=scale=0.0;   
		if (i <= m && i != n) {   
			for (k=l;k<=n;k++) scale += fabs(U->elem[i][k]);   
			if (scale) {   
				for (k=l;k<=n;k++) {   
					U->elem[i][k] /= scale;   
					s += U->elem[i][k]*U->elem[i][k];   
				}   
				f=U->elem[i][l];   
				g = -SIGN(sqrt(s),f);   
				h=f*g-s;   
				U->elem[i][l]=f-g;   
				for (k=l;k<=n;k++) rv1[k]=U->elem[i][k]/h;   
				if (i != m) {   
					for (j=l;j<=m;j++) {   
						for (s=0.0,k=l;k<=n;k++) s += U->elem[j][k]*U->elem[i][k];   
						for (k=l;k<=n;k++) U->elem[j][k] += s*rv1[k];   
					}   
				}   
				for (k=l;k<=n;k++) U->elem[i][k] *= scale;   
			}   
		}   
		anorm=MAX(anorm,(fabs(W->elem[i][i])+fabs(rv1[i])));   
	}   
	for (i=n;i>=1;i--) {   
		if (i < n) {   
			if (g) {   
				for (j=l;j<=n;j++)   
					V->elem[j][i]=(U->elem[i][j]/U->elem[i][l])/g;   
				for (j=l;j<=n;j++) {   
					for (s=0.0,k=l;k<=n;k++) s += U->elem[i][k]*V->elem[k][j];   
					for (k=l;k<=n;k++) V->elem[k][j] += s*V->elem[k][i];   
				}   
			}   
			for (j=l;j<=n;j++) V->elem[i][j]=V->elem[j][i]=0.0;   
		}   
		V->elem[i][i]=1.0;   
		g=rv1[i];   
		l=i;   
	}   
	for (i=n;i>=1;i--) {   
		l=i+1;   
		g=W->elem[i][i];   
		if (i < n)   
			for (j=l;j<=n;j++) U->elem[i][j]=0.0;   
		if (g) {   
			g=1.0/g;   
			if (i != n) {   
				for (j=l;j<=n;j++) {   
					for (s=0.0,k=l;k<=m;k++) s += U->elem[k][i]*U->elem[k][j];   
					f=(s/U->elem[i][i])*g;   
					for (k=i;k<=m;k++) U->elem[k][j] += f*U->elem[k][i];   
				}   
			}   
			for (j=i;j<=m;j++) U->elem[j][i] *= g;   
		} else {   
			for (j=i;j<=m;j++) U->elem[j][i]=0.0;   
		}   
		++U->elem[i][i];   
	}   
	for (k=n;k>=1;k--) {   
		for (its=1;its<=MAX_ITER;its++) {   
			flag=1;   
			for (l=k;l>=1;l--) {   
				nm=l-1;   
				if (fabs(rv1[l])+anorm == anorm) {   
					flag=0;   
					break;   
				}   
				if (fabs(W->elem[nm][nm])+anorm == anorm) break;   
			}   
			if (flag) {   
				c=0.0;   
				s=1.0;   
				for (i=l;i<=k;i++) {   
					f=s*rv1[i];   
					if (fabs(f)+anorm != anorm) {   
						g=W->elem[i][i];   
						h=PYTHAG(f,g);   
						W->elem[i][i]=h;   
						h=1.0/h;   
						c=g*h;   
						s=(-f*h);   
						for (j=1;j<=m;j++) {   
							y=U->elem[j][nm];   
							z=U->elem[j][i];   
							U->elem[j][nm]=y*c+z*s;   
							U->elem[j][i]=z*c-y*s;   
						}   
					}   
				}   
			}   
			z=W->elem[k][k];   
			if (l == k) {   
				if (z < 0.0) {   
					W->elem[k][k] = -z;   
					for (j=1;j<=n;j++) V->elem[j][k]=(-V->elem[j][k]);   
				}   
				break;   
			}   
			if (its == MAX_ITER)    
                            {   
                             printf("error in 'svd':  ");   
                             printf("no convergence in %d SVDCMP iterations\n",MAX_ITER);   
                             exit(1);   
			   }   
			x=W->elem[l][l];   
			nm=k-1;   
			y=W->elem[nm][nm];   
			g=rv1[nm];   
			h=rv1[k];   
			f=((y-z)*(y+z)+(g-h)*(g+h))/(2.0*h*y);   
			g=PYTHAG(f,1.0);   
			f=((x-z)*(x+z)+h*((y/(f+SIGN(g,f)))-h))/x;   
			c=s=1.0;   
			for (j=l;j<=nm;j++) {   
				i=j+1;   
				g=rv1[i];   
				y=W->elem[i][i];   
				h=s*g;   
				g=c*g;   
				z=PYTHAG(f,h);   
				rv1[j]=z;   
				c=f/z;   
				s=h/z;   
				f=x*c+g*s;   
				g=g*c-x*s;   
				h=y*s;   
				y=y*c;   
				for (jj=1;jj<=n;jj++) {   
					x=V->elem[jj][j];   
					z=V->elem[jj][i];   
					V->elem[jj][j]=x*c+z*s;   
					V->elem[jj][i]=z*c-x*s;   
				}   
				z=PYTHAG(f,h);   
				W->elem[j][j]=z;   
				if (z) {   
					z=1.0/z;   
					c=f*z;   
					s=h*z;   
				}   
				f=(c*g)+(s*y);   
				x=(c*y)-(s*g);   
				for (jj=1;jj<=m;jj++) {   
					y=U->elem[jj][j];   
					z=U->elem[jj][i];   
					U->elem[jj][j]=y*c+z*s;   
					U->elem[jj][i]=z*c-y*s;   
				}   
			}   
			rv1[l]=0.0;   
			rv1[k]=f;   
			W->elem[k][k]=x;   
		      }   
	      }   
   
(U->elem)++;   
(W->elem)++;   
(V->elem)++;   
for (i = 0; i < U->rows; i++)   
   (U->elem)[i]++;   
for (i = 0; i < W->rows; i++)   
   (W->elem)[i]++;   
for (i = 0; i < V->rows; i++)   
   (V->elem)[i]++;   
rv1++;   
free(rv1);   
/* if (check_file != NULL)   
   fprintf(check_file,"'svd':  A = U*W*V'  A: %s (%d by %d), U: %s (%d by ",B->name,B->rows,B->cols,A->name,A->rows,A->cols); */   
}   
 
#undef MAX_ITER 


void qr_decomp(matrix *A,matrix *Q,matrix *R) 
{ 
register int i,j,k,row_Q; 
double norm,store_value; 
matrix *h,*temp,*H,*NORM; 
 
h = init("h"); 
temp = init("temp"); 
H = init("H"); 
NORM = init("NORM"); 
 
 
if (A->rows < A->cols) 
  { 
   printf("error in 'qr_decomp':  input matrix A cannot have more cols than rows\n"); 
   printf("  (in this case, A = '%s' (%d by %d)\n",A->name,A->rows,A->cols); 
   exit(1); 
 } 
 
if (A == R || Q == R || A == Q) 
  { 
   printf("error in 'qr_decomp':  matrices A,R, and Q must be distinct\n"); 
   printf("  in this case, A = '%s', R = '%s', Q = '%s'\n",A->name,R->name,Q->name); 
   exit(1); 
 } 
 
conform_matrix(A->rows,1,h); 
conform_matrix(A->rows,1,temp); 
conform_matrix(A->rows,A->cols,H); 
conform_matrix(1,A->cols,NORM); 
copy(A,R); 
 
 
 
for (k = 0; k < A->cols; k++) 
  { 
   norm = 0.0; 
   for (i = k; i < R->rows; i++) 
     { 
      h->elem[i][0] = R->elem[i][k]; 
      norm += h->elem[i][0]*h->elem[i][0]; 
    } 
   store_value = h->elem[k][0]; 
 
   if (store_value > 0.0) 
      h->elem[k][0] += sqrt(norm); 
   else 
      h->elem[k][0] -= sqrt(norm); 
   norm += h->elem[k][0]*h->elem[k][0] - store_value*store_value; 
 
 
   if (norm < QR_DIVIDE_ERROR) 
     { 
      printf("error in 'qr_decomp':  one of the resulting cols in\n"); 
      printf("  R had too small of an l2_norm\n"); 
      exit(1); 
    } 
    
   NORM->elem[0][k] = norm; 
   s_in_m(h,0,k,H); 
 
   for (j = k; j < R->cols; j++) 
     { 
      temp->elem[j][0] = 0.0; 
      for (i = k; i < R->rows; i++) 
         temp->elem[j][0] += h->elem[i][0]*R->elem[i][j]; 
    } 
   for (i = k; i < R->rows; i++) 
      for (j = k; j < R->cols; j++) 
          R->elem[i][j] += h->elem[i][0]*temp->elem[j][0]*(-2.0)/norm; 
 } 
 
p_of_m(R,0,0,A->cols-1,A->cols-1,R); 
conform_matrix(A->cols,A->rows,Q); 
 
for (row_Q = 0; row_Q < Q->rows; row_Q++) 
  { 
   store_value = -2.0*H->elem[row_Q][row_Q]/NORM->elem[0][row_Q]; 
   for (j = 0; j < Q->cols; j++) 
     { 
      if (j < row_Q) 
          Q->elem[row_Q][j] = 0.0; 
      else 
          Q->elem[row_Q][j] = H->elem[j][row_Q]*store_value; 
    } 
   Q->elem[row_Q][row_Q] += 1.0; 
 
   for (k = row_Q-1; k >= 0; k--) 
     { 
      store_value = 0.0; 
      for (j = k+1; j < Q->cols; j++) 
         store_value += Q->elem[row_Q][j]*H->elem[j][k]; 
      store_value *= -2.0/NORM->elem[0][k]; 
      for (j = k; j < Q->cols; j++) 
         Q->elem[row_Q][j] += H->elem[j][k]*store_value; 
    } 
 } 
 
conform_matrix(0,0,h); 
conform_matrix(0,0,temp); 
conform_matrix(0,0,H); 
conform_matrix(0,0,NORM); 
free(h); 
free(temp); 
free(H); 
free(NORM); 
} 

matrix *eye(int rows,int cols,matrix *A) 
{ 
register int i; 
int min; 
 
if (rows <= 0 || cols <= 0) 
  { 
   printf("error in 'eye':  specified row and column dimensions must be\n"); 
   printf("    greater than zero for input matrix '%s'\n",A->name); 
   printf("     (in this case, rows = %d, cols = %d)\n",rows,cols); 
   exit(1); 
 } 
s_to_m(0.0,rows,cols,A); 
if (rows < cols) 
   min = rows; 
else 
   min = cols; 
for (i = 0; i < min; i++) 
   A->elem[i][i] = 1.0; 
return(A); 
} 


void mag_phase(matrix *REAL, matrix *IMAG, matrix *MAG, matrix *PHASE)   
{   
register int i;   
double pi = 3.141592653589793,temp;   
   
   
        if (REAL == IMAG)   
	  {   
           printf("error in 'mag_phase':  REAL and IMAG matrices must be specified\ndifferently - in this case, both are specified as matrix '%s'\n",REAL->name);   
           exit(1);   
	 }   
        if (MAG == PHASE)   
	  {   
           printf("error in 'mag_phase':  MAG and PHASE matrices must be specified\ndifferently - in this case, both are specified as matrix '%s'\n",MAG->name);   
           exit(1);   
	 }   
        if (REAL->cols != 1 || IMAG->cols != 1)   
	  {   
           printf("error in 'mag_phase':  REAL and IMAG matrices must have 1 column\n  in this case, REAL matrix '%s' is %d by %d\n              IMAG matrix '%s' is %d by %d\n",REAL->name,REAL->rows,REAL->cols,IMAG->name,IMAG->rows,IMAG->cols);
           exit(1);   
	 }   
        if (REAL->rows != IMAG->rows)   
	  {   
           printf("error in 'mag_phase':  REAL and IMAG matrices must have\nthe same number of rows\n   in this case, REAL matrix '%s' is %d by %d\n              IMAG matrix '%s' is %d by %d\n",REAL->name,REAL->rows,REAL->cols,IMAG->name,IMAG->rows,IMAG->cols);   
           exit(1);   
	 }   
        conform_matrix(REAL->rows,1,MAG);   
        conform_matrix(REAL->rows,1,PHASE);   
        if (MAG != REAL && MAG != IMAG)   
           for (i = 0; i < REAL->rows; i++)   
	     {   
              MAG->elem[i][0] = sqrt(REAL->elem[i][0]*REAL->elem[i][0] + IMAG->elem[i][0]*IMAG->elem[i][0]);  
               if (REAL->elem[i][0] < 0.0)   
		{  
                 if (IMAG->elem[i][0] >= 0.0)   
                    PHASE->elem[i][0] = pi - atan(-IMAG->elem[i][0]/REAL->elem[i][0]);   
                 else  
                    PHASE->elem[i][0] = -pi + atan(IMAG->elem[i][0]/REAL->elem[i][0]);  
	       }  
              else if (REAL->elem[i][0] == 0.0)  
                {  
                 if (IMAG->elem[i][0] >= 0.0)  
                     PHASE->elem[i][0] = pi;  
                 else  
                     PHASE->elem[i][0] = -pi;  
	       }  
              else   
                 PHASE->elem[i][0] = atan(IMAG->elem[i][0]/REAL->elem[i][0]);   
	    }   
        else if (PHASE != REAL && PHASE != IMAG)   
           for (i = 0; i < REAL->rows; i++)   
	     {   
              if (REAL->elem[i][0] < 0.0)   
		{   
                 if (IMAG->elem[i][0] >= 0.0)   
                    PHASE->elem[i][0] = pi - atan(-IMAG->elem[i][0]/REAL->elem[i][0]);   
                 else  
                    PHASE->elem[i][0] = -pi + atan(IMAG->elem[i][0]/REAL->elem[i][0]);  
	       }  
              else if (REAL->elem[i][0] == 0.0)  
                {  
                 if (IMAG->elem[i][0] >= 0.0)  
                     PHASE->elem[i][0] = pi;  
                 else  
                     PHASE->elem[i][0] = -pi;  
	       }   
              else   
                 PHASE->elem[i][0] = atan(IMAG->elem[i][0]/REAL->elem[i][0]);   
              MAG->elem[i][0] = sqrt(REAL->elem[i][0]*REAL->elem[i][0] + IMAG->elem[i][0]*IMAG->elem[i][0]);   
	    }   
        else if (MAG == REAL)   
           for (i = 0; i < REAL->rows; i++)   
	     {   
              MAG->elem[i][0] = sqrt((temp = REAL->elem[i][0])*REAL->elem[i][0] + IMAG->elem[i][0]*IMAG->elem[i][0]);   
              if (temp < 0.0)   
		{                   
                 if (IMAG->elem[i][0] >= 0.0)   
                    PHASE->elem[i][0] = pi - atan(-IMAG->elem[i][0]/temp);   
                 else  
                    PHASE->elem[i][0] = -pi + atan(IMAG->elem[i][0]/temp);   
	       }  
              else if (temp == 0.0)  
                {  
                 if (IMAG->elem[i][0] >= 0.0)  
                     PHASE->elem[i][0] = pi;  
                 else  
                     PHASE->elem[i][0] = -pi;  
	       }   
              else   
                 PHASE->elem[i][0] = atan(IMAG->elem[i][0]/temp);   
	    }   
        else    
           for (i = 0; i < REAL->rows; i++)   
	     {   
              MAG->elem[i][0] = sqrt(REAL->elem[i][0]*REAL->elem[i][0] + (temp = IMAG->elem[i][0])*IMAG->elem[i][0]);   
              if (REAL->elem[i][0] < 0.0)   
		{   
                 if (IMAG->elem[i][0] >= 0.0)   
                    PHASE->elem[i][0] = pi - atan(-temp/REAL->elem[i][0]);   
                 else  
                    PHASE->elem[i][0] = -pi + atan(temp/REAL->elem[i][0]);  
	       }   
              else if (REAL->elem[i][0] == 0.0)  
                {  
                 if (temp >= 0.0)  
                     PHASE->elem[i][0] = pi;  
                 else  
                     PHASE->elem[i][0] = -pi;  
	       }  
              else   
                 PHASE->elem[i][0] = atan(temp/REAL->elem[i][0]);   
	    }   
}   
   
void real_imag(matrix *MAG, matrix *PHASE, matrix *REAL, matrix *IMAG)   
{   
register int i;   
double temp;   
   
        if (REAL == IMAG)   
	  {   
           printf("error in 'real_imag':  REAL and IMAG matrices must be specified\ndifferently - in this case, both are specified as matrix '%s'\n",REAL->name);   
           exit(1);   
	 }   
        if (MAG == PHASE)   
	  {   
           printf("error in 'real_imag':  MAG and PHASE matrices must be specified\ndifferently - in this case, both are specified as matrix '%s'\n",MAG->name);   
           exit(1);   
	 }   
        if (MAG->cols != 1 || PHASE->cols != 1)   
	  {   
           printf("error in 'real_imag':  MAG and PHASE matrices must have 1 column\n  in this case, MAG matrix '%s' is %d by %d\n              PHASE matrix '%s' is %d by %d\n",MAG->name,MAG->rows,MAG->cols,PHASE->name,PHASE->rows,PHASE->cols); 
           exit(1);   
	 }   
        if (MAG->rows != PHASE->rows)   
	  {   
           printf("error in 'real_imag':  MAG and PHASE matrices must have\nthe same number of rows\n   in this case, MAG matrix '%s' is %d by %d\n              PHASE matrix '%s' is %d by %d\n",MAG->name,MAG->rows,MAG->cols,PHASE->name,PHASE->rows,PHASE->cols);   
           exit(1);   
	 }   
        conform_matrix(MAG->rows,1,REAL);   
        conform_matrix(MAG->rows,1,IMAG);  
        if (REAL != MAG && REAL != PHASE)   
           for (i = 0; i < MAG->rows; i++)   
	     {   
              REAL->elem[i][0] = MAG->elem[i][0]*cos(PHASE->elem[i][0]);   
              IMAG->elem[i][0] = MAG->elem[i][0]*sin(PHASE->elem[i][0]);   
	    }   
        else if (IMAG != MAG && IMAG != PHASE)   
           for (i = 0; i < MAG->rows; i++)   
	     {   
              IMAG->elem[i][0] = MAG->elem[i][0]*sin(PHASE->elem[i][0]);   
              REAL->elem[i][0] = MAG->elem[i][0]*cos(PHASE->elem[i][0]);   
	    }   
        else if (REAL == MAG)   
           for (i = 0; i < REAL->rows; i++)   
	     {   
              REAL->elem[i][0] = (temp = MAG->elem[i][0])*cos(PHASE->elem[i][0]);   
              IMAG->elem[i][0] = temp*sin(PHASE->elem[i][0]);   
	    }   
        else    
           for (i = 0; i < REAL->rows; i++)   
	     {   
              REAL->elem[i][0] = MAG->elem[i][0]*cos(temp = PHASE->elem[i][0]);   
              IMAG->elem[i][0] = MAG->elem[i][0]*sin(temp);   
	    }  
}   
   
void real_fft(matrix *DATA, matrix *REAL, matrix *IMAG)   
{   
	int i1,i2,i3,i4,n2p3,n;   
        register int i,j;   
	float h1r,h1i,h2r,h2i;   
	double wr,wi,wpr,wpi,wtemp,wtemp2,theta,test_log2,store_log2;   
        EL_TYPE temp_store;   
        matrix *temp;
	void four1();   
   
        if (REAL == IMAG)   
	  {   
           printf("error in 'real_fft':  REAL and IMAG matrices must be distinct\n   in this case, matrix '%s' is specified for both matrix REAL and IMAG\n",REAL->name);   
           exit(1);   
	 }   
        if (DATA->cols != 1)   
	  {   
           printf("error in 'real_fft':  input matrix ('%s' in this case) should have one column\n",DATA->name);   
           printf("   in this case, matrix '%s' is %d by %d\n",DATA->name,DATA->rows,DATA->cols);   
           exit(1);   
	 }   
        if (DATA->rows == 0)  
	  {  
           printf("error in 'real_fft':  input matrix '%s' has zero rows of data!\n",DATA->name);  
           exit(1);  
	 }  
  
        test_log2 = log((double) DATA->rows/2)/log(2.0) + 0.0000001;  
        store_log2 = floor(test_log2);   
        test_log2 -= store_log2;   
        if (test_log2 > 0.0000002 )   
	  {   
          temp = init("temp");
          i1 = (int) 2.0*pow(2.0,store_log2+1.0);
          conform_matrix(i1,1,temp);
          for (i = 0; i < DATA->rows; i++)   
              temp->elem[i][0] = DATA->elem[i][0];   
          for ( ; i < temp->rows; i++)   
              temp->elem[i][0] = 0.0;   
          n = temp->rows/2;
          four1(temp,REAL);
          REAL->elem--;  
  
          conform_matrix(temp->rows,1,IMAG);   
          conform_matrix(0,0,temp);
          free(temp);
	}   
        else
	  {
           n = DATA->rows/2;   
	   four1(DATA,REAL);   
           REAL->elem--;  
  
           if (IMAG != DATA)   
              conform_matrix(DATA->rows,1,IMAG);   
	 }

  
	theta = -(ISIGN)*3.141592653589793/(double) n;   
	wtemp=sin(0.5*theta);   
	wpr = -2.0*wtemp*wtemp;   
	wpi=sin(theta);   
	wr=1.0 + wpr;   
	wi=wpi;   
	n2p3=2*n + 3;   
	for (i=2;i<=n/2;i++)    
           {   
	       i4=1+(i3=n2p3-(i2=1+(i1=i+i-1)));  
	        h1r=0.5*(REAL->elem[i1][0] + REAL->elem[i3][0]);   
		h1i=0.5*(REAL->elem[i2][0] - REAL->elem[i4][0]);   
		h2r = 0.5*(REAL->elem[i2][0] + REAL->elem[i4][0]);   
		h2i=0.5*(REAL->elem[i3][0] - REAL->elem[i1][0]);   
		REAL->elem[i1][0] = h1r+(wtemp2 = wr*h2r+wi*h2i);   
		REAL->elem[i2][0] = h1i+(wtemp = wr*h2i-wi*h2r);   
		REAL->elem[i3][0] = h1r-wtemp2;   
		REAL->elem[i4][0] = -h1i+wtemp;   
		wr=(wtemp=wr)*wpr-wi*wpi+wr;   
		wi=wi*wpr+wtemp*wpi+wi;   
	}   
  
        REAL->elem[n+2][0] *= ISIGN;  
	REAL->elem[1][0] = (h1r=REAL->elem[1][0]) + REAL->elem[2][0];   
	REAL->elem[2][0] = h1r-REAL->elem[2][0];   
  
        REAL->elem++;   
   
        IMAG->elem[0][0] = 0.0;   
        IMAG->elem[n][0] = 0.0;   
        for (i = 1; i < n; i++)   
           IMAG->elem[i][0] = REAL->elem[2*i+1][0];    
  
        temp_store = REAL->elem[1][0];   
        for (i = 0; i < n; i++)   
           REAL->elem[i][0] = REAL->elem[2*i][0];   
        REAL->elem[n][0] = temp_store;   
  
        for (i = n+1,j = n-1; i < IMAG->rows; i++,j--)   
	  {  
           REAL->elem[i][0] = REAL->elem[j][0];   
           IMAG->elem[i][0] = -IMAG->elem[j][0];   
	 }  
  
  
}   
   
#define SWAP(a,b) tempr=(a);(a)=(b);(b)=tempr   
   
void four1(matrix *DATA, matrix *FFT)   
{   
	int n,nn,mmax,m,istep;   
        register int i,j;   
	double wtemp,wr,wpr,wpi,wi,theta,test_log2;   
	float tempr,tempi;   
   
        nn = DATA->rows/2;   
        if (DATA->cols != 1)   
	  {   
           printf("error in 'four1':  input matrix must have 1 column\n  in this case, input matrix '%s' is %d by %d\n",DATA->name,DATA->rows,DATA->cols);   
           exit(1);   
	 }   
        if (DATA->rows == 0)  
	  {  
           printf("error in 'four1':  input matrix '%s' has zero rows of data!\n",DATA->name);  
           exit(1);  
	 }  
        test_log2 = log((double) nn)/log(2.0) + 0.0000001;   
        test_log2 -= floor(test_log2);   
   
        if (test_log2 > 0.0000002)   
	  {   
           printf("error in 'four1':  number of rows in input matrix must be\n");   
           printf("an integer power of 2\n  in this case, matrix '%s' is %d (times 2) by %d\n",DATA->name,DATA->rows/2,DATA->cols);   
           exit(1);   
	 }   
        if (DATA != FFT)   
          {   
           conform_matrix(DATA->rows,1,FFT);   
           for (i = 0; i < DATA->rows; i++)   
              FFT->elem[i][0] = DATA->elem[i][0];   
	 }   
        FFT->elem--;   
	n=nn << 1;   
	j=1;   
	for (i=1;i<n;i+=2) {   
		if (j > i) {   
			SWAP(FFT->elem[j][0],FFT->elem[i][0]);   
			SWAP(FFT->elem[j+1][0],FFT->elem[i+1][0]);   
		}   
		m=n >> 1;   
		while (m >= 2 && j > m) {   
			j -= m;   
			m >>= 1;   
		}   
		j += m;   
	}   
	mmax=2;   
	while (n > mmax) {   
		istep=2*mmax;   
		theta=6.28318530717959/(ISIGN*mmax);   
		wtemp=sin(0.5*theta);   
		wpr = -2.0*wtemp*wtemp;   
		wpi=sin(theta);   
		wr=1.0;   
		wi=0.0;   
		for (m=1;m<mmax;m+=2) {   
			for (i=m;i<=n;i+=istep) {   
				j=i+mmax;   
				tempr=wr*FFT->elem[j][0]-wi*FFT->elem[j+1][0];   
				tempi=wr*FFT->elem[j+1][0]+wi*FFT->elem[j][0];   
				FFT->elem[j][0]=FFT->elem[i][0]-tempr;   
				FFT->elem[j+1][0]=FFT->elem[i+1][0]-tempi;   
				FFT->elem[i][0] += tempr;   
				FFT->elem[i+1][0] += tempi;   
			}   
			wr=(wtemp=wr)*wpr-wi*wpi+wr;   
			wi=wi*wpr+wtemp*wpi+wi;   
		}   
		mmax=istep;   
	}   
       FFT->elem++;   
}   
   
   
void fft(matrix *DATA_REAL, matrix *DATA_IMAG, matrix *FFT_REAL, matrix *FFT_IMAG)   
{   
	int n,mmax,m,istep,i1,nn;   
        register int i,j;   
	double wtemp,wr,wpr,wpi,wi,theta,test_log2,store_log2;   
        EL_TYPE **temp;   
	float tempr,tempi;   
   
        if (DATA_REAL == DATA_IMAG)   
	  {   
           printf("error in 'fft':  DATA_REAL and DATA_IMAG matrices must be specified\ndifferently - in this case, both are specified as matrix '%s'\n",DATA_REAL->name);   
           exit(1);   
	 }   
        if (FFT_REAL == FFT_IMAG)   
	  {   
           printf("error in 'fft':  FFT_REAL and FFT_IMAG matrices must be specified\ndifferently - in this case, both are specified as matrix '%s'\n",FFT_REAL->name);   
           exit(1);   
	 }   
        if (DATA_REAL->cols != 1 || DATA_IMAG->cols != 1)   
	  {   
           printf("error in 'fft':  DATA_REAL and DATA_IMAG matrices must have 1 column\n  in this case, DATA_REAL matrix '%s' is %d by %d\n              DATA_IMAG matrix '%s' is %d by %d\n",DATA_REAL->name,DATA_REAL->rows,DATA_REAL->cols,DATA_IMAG->name,DATA_IMAG->rows,DATA_IMAG->cols);   
           exit(1);   
	 }   
        if (DATA_REAL->rows != DATA_IMAG->rows)   
	  {   
           printf("error in 'fft':  DATA_REAL and DATA_IMAG matrices must have\nthe same number of rows\n   in this case, DATA_REAL matrix '%s' is %d by %d\n              DATA_IMAG matrix '%s' is %d by %d\n",DATA_REAL->name,DATA_REAL->rows,DATA_REAL->cols,DATA_IMAG->name,DATA_IMAG->rows,DATA_IMAG->cols);   
           exit(1);   
	 }   
        if (DATA_REAL->rows == 0)  
	  {  
           printf("error in 'fft':  input matrices '%s' and '%s' have zero rows of data!\n",DATA_REAL->name,DATA_IMAG->name);  
           exit(1);  
	 }  
  
        test_log2 = log((double) DATA_REAL->rows)/log(2.0) + 0.0000001;   
        store_log2 = floor(test_log2);   
        test_log2 -= store_log2;   
   
        if (test_log2 > 0.0000002 || FFT_REAL == DATA_REAL || FFT_REAL == DATA_IMAG)   
	  {   
          if (test_log2 > 0.0000002)   
	    {  
             if ((temp = (EL_TYPE **) calloc(i1 = (int) 2.0*pow(2.0,store_log2+1.0),sizeof(EL_TYPE *))) == NULL)   
	       {   
                printf("error in 'fft':  calloc call failed!\n");   
                printf(" (not enough memory)\n");   
                exit(1);   
              }   
	   }  
          else  
            {   
             if ((temp = (EL_TYPE **) calloc(i1 = 2*DATA_REAL->rows,sizeof(EL_TYPE *))) == NULL)   
	       {   
                printf("error in 'fft':  calloc call failed!\n");   
                printf(" (not enough memory)\n");   
                exit(1);   
              }  
	   }  
  
          for (i = 0; i < i1; i++)   
             if ((temp[i] = (EL_TYPE *) calloc(1,sizeof(EL_TYPE))) == NULL)   
	       {   
                printf("error in 'fft':  calloc call failed!\n");   
                printf(" (not enough memory)\n");   
                exit(1);   
              }        
          for (i = 0,j = 0; i < DATA_REAL->rows && j < i1-1; i++,j += 2)   
	    {   
              temp[j][0] = DATA_REAL->elem[i][0];   
              temp[j+1][0] = DATA_IMAG->elem[i][0];   
	    }   
  
          for ( ; j < i1; j++)   
              temp[j][0] = 0.0;   
          replace_elements(temp,i1,1,FFT_REAL);              
	}  
        else   
	  {   
           conform_matrix(2*DATA_REAL->rows,1,FFT_REAL);   
           for (i = 0, j = 0; i < DATA_REAL->rows && j < FFT_REAL->rows-1; i++,j += 2)   
	     {   
              FFT_REAL->elem[j][0] = DATA_REAL->elem[i][0];   
              FFT_REAL->elem[j+1][0] = DATA_IMAG->elem[i][0];   
	    }   
	 }   
        FFT_REAL->elem--;   
  
        nn = FFT_REAL->rows/2;   
   
	n=nn << 1;   
	j=1;   
	for (i=1;i<n;i+=2) {   
		if (j > i) {   
			SWAP(FFT_REAL->elem[j][0],FFT_REAL->elem[i][0]);   
			SWAP(FFT_REAL->elem[j+1][0],FFT_REAL->elem[i+1][0]);   
		}   
		m=n >> 1;   
		while (m >= 2 && j > m) {   
			j -= m;   
			m >>= 1;   
		}   
		j += m;   
	}   
  
	mmax=2;   
	while (n > mmax) {   
		istep=2*mmax;   
		theta=6.28318530717959/(ISIGN*mmax);   
		wtemp=sin(0.5*theta);   
		wpr = -2.0*wtemp*wtemp;   
		wpi=sin(theta);   
		wr=1.0;   
		wi=0.0;   
		for (m=1;m<mmax;m+=2) {   
			for (i=m;i<=n;i+=istep) {   
				j=i+mmax;   
				tempr=wr*FFT_REAL->elem[j][0]-wi*FFT_REAL->elem[j+1][0];   
				tempi=wr*FFT_REAL->elem[j+1][0]+wi*FFT_REAL->elem[j][0];   
				FFT_REAL->elem[j][0]=FFT_REAL->elem[i][0]-tempr;   
				FFT_REAL->elem[j+1][0]=FFT_REAL->elem[i+1][0]-tempi;   
				FFT_REAL->elem[i][0] += tempr;   
				FFT_REAL->elem[i+1][0] += tempi;   
			}   
			wr=(wtemp=wr)*wpr-wi*wpi+wr;   
			wi=wi*wpr+wtemp*wpi+wi;   
		}   
		mmax=istep;   
	}   
       FFT_REAL->elem++;   
  
       conform_matrix(FFT_REAL->rows/2,1,FFT_IMAG);   
       if ((temp = (EL_TYPE **) calloc(FFT_IMAG->rows,sizeof(EL_TYPE *))) == NULL)   
	    {   
             printf("error in 'fft':  calloc call failed!\n");   
             printf(" (not enough memory)\n");   
             exit(1);   
            }   
       for (i = 0; i < FFT_IMAG->rows; i++)   
             if ((temp[i] = (EL_TYPE *) calloc(1,sizeof(EL_TYPE))) == NULL)   
	       {   
                printf("error in 'fft':  calloc call failed!\n");   
                printf(" (not enough memory)\n");   
                exit(1);   
              }        
  
       for (i = 0, j = 0; i < FFT_IMAG->rows && j < FFT_REAL->rows-1; i++, j += 2)   
	 {   
          temp[i][0] = FFT_REAL->elem[j][0];   
          FFT_IMAG->elem[i][0] = FFT_REAL->elem[j+1][0];   
	}  
  
       replace_elements(temp,FFT_IMAG->rows,1,FFT_REAL);  
   
}   
   
void ifft(matrix *DATA_REAL, matrix *DATA_IMAG, matrix *FFT_REAL, matrix *FFT_IMAG)   
{   
	int n,mmax,m,istep,i1,nn;   
        register int i,j;   
	double wtemp,wr,wpr,wpi,wi,theta,test_log2,store_log2;   
        EL_TYPE **temp;   
	float tempr,tempi;   
   
/* note:  this program's labels are misleading - output is the real and imag */  
/* components of the inverse fft of the input data */  
  
        if (DATA_REAL == DATA_IMAG)   
	  {   
           printf("error in 'ifft':  DATA_REAL and DATA_IMAG matrices must be specified\ndifferently - in this case, both are specified as matrix '%s'\n",DATA_REAL->name);   
           exit(1);   
	 }   
        if (FFT_REAL == FFT_IMAG)   
	  {   
           printf("error in 'ifft':  FFT_REAL and FFT_IMAG matrices must be specified\ndifferently - in this case, both are specified as matrix '%s'\n",FFT_REAL->name);   
           exit(1);   
	 }   
        if (DATA_REAL->cols != 1 || DATA_IMAG->cols != 1)   
	  {   
           printf("error in 'ifft':  DATA_REAL and DATA_IMAG matrices must have 1 column\n  in this case, DATA_REAL matrix '%s' is %d by %d\n              DATA_IMAG matrix '%s' is %d by %d\n",DATA_REAL->name,DATA_REAL->rows,DATA_REAL->cols,DATA_IMAG->name,DATA_IMAG->rows,DATA_IMAG->cols);   
           exit(1);   
	 }   
        if (DATA_REAL->rows != DATA_IMAG->rows)   
	  {   
           printf("error in 'ifft':  DATA_REAL and DATA_IMAG matrices must have\nthe same number of rows\n   in this case, DATA_REAL matrix '%s' is %d by %d\n              DATA_IMAG matrix '%s' is %d by %d\n",DATA_REAL->name,DATA_REAL->rows,DATA_REAL->cols,DATA_IMAG->name,DATA_IMAG->rows,DATA_IMAG->cols);   
           exit(1);   
	 }   
         if (DATA_REAL->rows == 0)  
	  {  
           printf("error in 'ifft':  input matrices '%s' and '%s' have zero rows of data!\n",DATA_REAL->name,DATA_IMAG->name);  
           exit(1);  
	 }  
  
        test_log2 = log((double) DATA_REAL->rows)/log(2.0) + 0.0000001;   
        store_log2 = floor(test_log2);   
        test_log2 -= store_log2;   
   
        if (test_log2 > 0.0000002 || FFT_REAL == DATA_REAL || FFT_REAL == DATA_IMAG)   
	  {   
          if (test_log2 > 0.0000002)   
	    {  
             if ((temp = (EL_TYPE **) calloc(i1 = (int) 2.0*pow(2.0,store_log2+1.0),sizeof(EL_TYPE *))) == NULL)   
	       {   
                printf("error in 'ifft':  calloc call failed!\n");   
                printf(" (not enough memory)\n");   
                exit(1);   
              }   
	   }  
          else   
	    {  
             if ((temp = (EL_TYPE **) calloc(i1 = 2*DATA_REAL->rows,sizeof(EL_TYPE *))) == NULL)   
	       {   
                printf("error in 'ifft':  calloc call failed!\n");   
                printf(" (not enough memory)\n");   
                exit(1);   
              }   
	   }  
          for (i = 0; i < i1; i++)   
             if ((temp[i] = (EL_TYPE *) calloc(1,sizeof(EL_TYPE))) == NULL)   
	       {   
                printf("error in 'ifft':  calloc call failed!\n");   
                printf(" (not enough memory)\n");   
                exit(1);   
              }        
          for (i = 0,j = 0; i < DATA_REAL->rows && j < i1-1; i++,j += 2)   
	    {   
              temp[j][0] = DATA_REAL->elem[i][0];   
              temp[j+1][0] = DATA_IMAG->elem[i][0];   
	    }   
                 
          for ( ; j < i1; j++)   
              temp[j][0] = 0.0;   
          replace_elements(temp,i1,1,FFT_REAL);              
	}   
        else   
	  {   
           conform_matrix(2*DATA_REAL->rows,1,FFT_REAL);   
           for (i = 0, j = 0; i < DATA_REAL->rows && j < FFT_REAL->rows-1; i++,j += 2)   
	     {   
              FFT_REAL->elem[j][0] = DATA_REAL->elem[i][0];   
              FFT_REAL->elem[j+1][0] = DATA_IMAG->elem[i][0];   
	    }   
	 }   
        FFT_REAL->elem--;   
   
        nn = FFT_REAL->rows/2;   
   
	n=nn << 1;   
	j=1;   
	for (i=1;i<n;i+=2) {   
		if (j > i) {   
			SWAP(FFT_REAL->elem[j][0],FFT_REAL->elem[i][0]);   
			SWAP(FFT_REAL->elem[j+1][0],FFT_REAL->elem[i+1][0]);   
		}   
		m=n >> 1;   
		while (m >= 2 && j > m) {   
			j -= m;   
			m >>= 1;   
		}   
		j += m;   
	}   
	mmax=2;   
	while (n > mmax) {   
		istep=2*mmax;   
		theta=6.28318530717959/(-(ISIGN)*mmax);   
		wtemp=sin(0.5*theta);   
		wpr = -2.0*wtemp*wtemp;   
		wpi=sin(theta);   
		wr=1.0;   
		wi=0.0;   
		for (m=1;m<mmax;m+=2) {   
			for (i=m;i<=n;i+=istep) {   
				j=i+mmax;   
				tempr=wr*FFT_REAL->elem[j][0]-wi*FFT_REAL->elem[j+1][0];   
				tempi=wr*FFT_REAL->elem[j+1][0]+wi*FFT_REAL->elem[j][0];   
				FFT_REAL->elem[j][0]=FFT_REAL->elem[i][0]-tempr;   
				FFT_REAL->elem[j+1][0]=FFT_REAL->elem[i+1][0]-tempi;   
				FFT_REAL->elem[i][0] += tempr;   
				FFT_REAL->elem[i+1][0] += tempi;   
			}   
			wr=(wtemp=wr)*wpr-wi*wpi+wr;   
			wi=wi*wpr+wtemp*wpi+wi;   
		}   
		mmax=istep;   
	}   
       FFT_REAL->elem++;   
   
       conform_matrix(FFT_REAL->rows/2,1,FFT_IMAG);   
       if ((temp = (EL_TYPE **) calloc(FFT_IMAG->rows,sizeof(EL_TYPE *))) == NULL)   
	    {   
             printf("error in 'ifft':  calloc call failed!\n");   
             printf(" (not enough memory)\n");   
             exit(1);   
            }   
       for (i = 0; i < FFT_IMAG->rows; i++)   
             if ((temp[i] = (EL_TYPE *) calloc(1,sizeof(EL_TYPE))) == NULL)   
	       {   
                printf("error in 'ifft':  calloc call failed!\n");   
                printf(" (not enough memory)\n");   
                exit(1);   
              }        
       for (i = 0, j = 0; i < FFT_IMAG->rows && j < FFT_REAL->rows-1; i++, j += 2)   
	 {   
          temp[i][0] = FFT_REAL->elem[j][0]/(double) FFT_IMAG->rows;   
          FFT_IMAG->elem[i][0] = FFT_REAL->elem[j+1][0]/(double) FFT_IMAG->rows;   
	}   
       replace_elements(temp,FFT_IMAG->rows,1,FFT_REAL);    
   
}   
   

matrix *pn_seq(matrix *init_vec,matrix *poly_vec, int num_samples,
                 matrix *out)
{
int i,j,m,rows;
int start,count,bit_tag;
double sum;
matrix *a;

a = init("a");

/* note:  poly_vec represents the implemented polynomial   */
/*    i.e.  x^m = a_{m-1} x^{m-1} + a_{m-2} x^{m-2} + ...  */
/*                a_2 x^2 + a_1 x + 1                      */
/*  corresponds to poly_vec[0][0] = 1, poly_vec[1][0] = a_1 */
/*       poly_vec[2][0] = a_2 ... poly_vec[m-1][0] = a_{m-1} */

/*  the init_vec is set as:                                 */
/*     init_vec[0][0] = x[k-1], init_vec[1][0] = x[k-2],  */
/*     init_vec[2][0] = x[k-3], init_vec[3][0] = x[k-4],   */
/*     ....   init_vec[m-1][0] = x[k-m]    */

rows = num_samples;

if (poly_vec == out)
  {
   printf("error in 'pn_seq:'  poly_vec matrix must be distinct from out matrix\n");
   printf("  in this case poly_vec and out are both matrix '%s' (%d by %d)\n",
            poly_vec->name,poly_vec->rows,poly_vec->cols);
   exit(1);
  }
if (rows <= 0)
  {
   printf("error in 'pn_seq':  rows must be > 0\n");
   printf("  in this case, rows was specified as %d\n",rows);
   exit(1);
 }
if (poly_vec->cols != 1 || init_vec->cols != 1)
  {
   printf("error in 'pn_seq':  poly_vec and init_vec must be\n");
   printf("        column vectors!  in this case:\n");
   printf("  '%s' (poly_vec) is %d by %d, '%s' (init_vec) is %d by %d\n",
         poly_vec->name, poly_vec->rows, poly_vec->cols,
         init_vec->name,init_vec->rows,init_vec->cols);
   exit(1);
 }
if (poly_vec->rows != init_vec->rows)
  {
   printf("error in 'pn_seq':  length of poly_vec and init_vec must\n");
   printf("    be equal!  in this case:\n");
   printf("  '%s' (poly_vec) is %d by %d, '%s' (init_vec) is %d by %d\n",
         poly_vec->name, poly_vec->rows, poly_vec->cols,
         init_vec->name,init_vec->rows,init_vec->cols);
   exit(1);
 }

m = poly_vec->rows;
conform_matrix(m+1,1,a);


if (poly_vec->elem[0][0] != 1.0)
  {
   printf("error in 'pn_seq':  poly_vec[0][0] must be 1\n");
   printf("  in this case:\n");
   print(poly_vec);
   exit(1);
 }
if (poly_vec->rows < 2)
  {
   printf("error in 'pn_seq':  poly_vec must have length > 1\n");
   printf("  '%s' (poly_vec) is %d by %d\n",
         poly_vec->name, poly_vec->rows, poly_vec->cols);
   exit(1);
 }
sum = 0.0;
for (i = 0; i < m; i++)
  {
  sum += init_vec->elem[i][0];
  if (poly_vec->elem[i][0] != 1.0 && poly_vec->elem[i][0] != 0.0)
    {
     printf("error in 'pn_seq':  poly_vec must consist of entries\n");
     printf("    that are zero or one,   in this case:\n");
     print(poly_vec);
     exit(1);
   }
  if (init_vec->elem[i][0] != 1.0 && init_vec->elem[i][0] != 0.0)
    {
     printf("error in 'pn_seq':  init_vec must consist of entries\n");
     printf("    that are zero or one,   in this case:\n");
     print(init_vec);
     exit(1);
   }
 }
if (sum == 0.0)
  {
   printf("error in 'pn_seq':  init_vec must not consist of\n");
   printf("all zeros!  in this case:\n");
   print(init_vec);
   exit(1);
 }

for (i = 1; i <= m; i++)
   a->elem[i][0] = init_vec->elem[i-1][0];
start = m;
bit_tag = 1;

conform_matrix(rows,1,out);
for (i = 0; i < rows; i++)
  {
   start--;
   bit_tag--;
   if (start == -1)
     {
      start = m;
      sum = a->elem[0][0];
    }
   else
      sum = a->elem[start+1][0];
   if (bit_tag == -1)
      bit_tag = m;
  
   for (j = start,count = 1; count < m; j--,count++)
     {
      if (j == -1)
         j = m;
      sum = XOR(sum,a->elem[j][0] * poly_vec->elem[count][0]);
    }
   if (sum > 0.5)
      out->elem[i][0] = 1.0;
   else
      out->elem[i][0] = 0.0;
   a->elem[bit_tag][0] = sum;
 }

free_matrix(a);
return(out);
}

/*  note:  the hilbert transform filter used for this routine was
           designed on Matlab using the remez algorithm.  It consists
           of 119 taps and will accurately shift input signals 90 degrees
           over a bandwidth ranging from .04 to .96 (where 0 to 1 is
            the ideal bandwidth extending from dc up to the half
            sampling frequency (i.e. w goes from 0 to PI)).  Defining
            the accuracy, the ripples in the above bandwidth vary no more
            than +/- 65.0 db about 1.0. 
            also:  hilbert transform filter adds -90 to phase of signal */

matrix *phase_shifter(matrix *inp, double phase, matrix *out)
{
matrix *hilbert,*i_comp,*q_comp;
static int inc=0;
int i;

hilbert = init("hilbert");
q_comp = init("q_comp");
i_comp = init("i_comp");

load("90_65_4_96.filter",hilbert);
trans(hilbert,hilbert);

conv(inp,hilbert,q_comp); 
p_of_m(q_comp,(hilbert->rows-1)/2,0,q_comp->rows-(hilbert->rows-1)/2-1,0,q_comp);

s_times_m(cos(phase),inp,i_comp);
s_times_m(-sin(phase),q_comp,q_comp);
add(i_comp,q_comp,out);

free_matrix(hilbert);
free_matrix(q_comp);
free_matrix(i_comp);
return(out);
}


matrix *peak_detect(matrix *input, double time_constant, 
                   double sample_period, matrix *output)
{
int i;
double gain;
matrix *temp;



if (time_constant <= PK_DIVIDE_ERROR)
  {
   printf("error in 'peak_detect':  time_constant must be > %f\n",PK_DIVIDE_ERROR);
   printf("  time_constant = %f\n",time_constant);
   exit(1);
 }
vector_check("peak_detect",input);
gain = exp(sample_period/time_constant);

if (input == output)
  {
   temp = init("temp");
   conform_matrix(input->rows,1,temp);
   temp->elem[0][0] = input->elem[0][0];
   for (i = 1; i < input->rows; i++)
     {
      temp->elem[i][0] = gain*temp->elem[i-1][0];
      if (temp->elem[i][0] < input->elem[i][0])
        temp->elem[i][0] = input->elem[i][0];
    }
   replace_elements(temp->elem,temp->rows,temp->cols,output);
   free(temp);
 }
else
  {
   conform_matrix(input->rows,1,output);
   output->elem[0][0] = input->elem[0][0];
   for (i = 1; i < input->rows; i++)
     {
      output->elem[i][0] = gain*output->elem[i-1][0];
      if (output->elem[i][0] < input->elem[i][0])
        output->elem[i][0] = input->elem[i][0];
    }
 }
return(output);
}


/***************************** Integer matrix library ***********************/

int_matrix *int_mul_elem(int_matrix *A,int_matrix *B,int_matrix *C)   
{   
int i,j;   
   
if (A->rows != B->rows || A->cols != B->cols)   
  {   
   printf("\nerror in 'mul_elem':  input matrices have\n");   
   printf("uncompatible dimensions\n");   
   printf("\n matrix %s is %d by %d, and matrix %s is %d by %d\n",   
           A->name,A->rows,A->cols,B->name,B->rows,B->cols);   
   exit(1);   
 }   
int_conform_matrix(A->rows,A->cols,C);   
for (i = 0; i < A->rows; i++)   
   for (j = 0; j < A->cols; j++)   
       (C->elem)[i][j] = (A->elem)[i][j]*(B->elem)[i][j];   
return(C);   
}   

int_matrix *int_load(char filename[],int_matrix *int_A)   
{   
matrix *A;

A = init("A");

load(filename,A);
real_to_int(A,int_A);

free_matrix(A);
return(int_A);   
}   


int_matrix *int_save(int_matrix *int_A, char *filename)   
{   
FILE *fp;   
int i,j;
char control[10];

/* control:  parameter that allows the output file to be written
             or appended, and also to attach labels to the matrix
             data stored.  In the past, this parameter was rarely
             used for anything other than "w", and is therefore
             always set to that case now
*/
sprintf(control,"w");
   
if (strcmp(control,"w") == 0 || strcmp(control,"wl") == 0)   
  {   
   if ((fp = fopen(filename,"w")) == NULL)   
     {   
      printf("error in 'int_save':  file %s cannot be opened\n",filename);   
      exit(1);   
    }   
   if (strcmp(control,"wl") == 0)   
           fprintf(fp,"%s\n",int_A->name);   
   for (i = 0; i < int_A->rows; i++)   
     {   
      for (j = 0; j < int_A->cols; j++)   
          fprintf(fp,"%d ",int_A->elem[i][j]);   
      fprintf(fp,"\n");   
    }   
 }   
else if (strcmp(control,"a") == 0 || strcmp(control,"al") == 0)   
  {   
   if ((fp = fopen(filename,"a")) == NULL)   
     {   
      printf("error in 'int_save':  file %s cannot be opened\n",filename);   
      exit(1);   
    }   
   if (strcmp(control,"al") == 0)   
      fprintf(fp,"%s\n",int_A->name);   
   for (i = 0; i < int_A->rows; i++)   
     {   
      for (j = 0; j < int_A->cols; j++)   
          fprintf(fp,"%d ",int_A->elem[i][j]);   
      fprintf(fp,"\n");   
    }   
 }   
else   
  {   
   printf("error in 'int_save':  control character was specified as %s,\n",   
           control);   
   printf("which is invalid since it must be specified as either 'w' (for\n");   
   printf("writing to a file), or 'a' (for appending to a file),\n");   
   printf("or 'wl' (write and label matrix in file), or 'al'\n");   
   printf("(append and label matrix to file)\n");   
   exit(1);   
 }   
fclose(fp);   

return(int_A);   
}   


void int_vector_check(char *routine,int_matrix *A)
{
if (A->cols != 1)
  {
   printf("error in '%s':  matrix must be a column vector\n",routine);
   printf("  in this case, the matrix is '%s' (%d by %d)\n",
              A->name,A->rows,A->cols);
   exit(1);
  }
}

int_matrix *int_extract_bit(int_matrix *in,int b,int_matrix *out)
{
int i,mask;

if (b < 0 || b > 31)
  {
   printf("error in 'int_extract_bit':  b must be between 0 and 31\n");
   printf("  in this case, b = %d\n",b);
   exit(1);
 }
int_vector_check("int_extract_bit",in);

mask = 1 << b;
/* printf("mask = '%s'\n",bit_print(mask)); */
int_conform_matrix(in->rows,1,out);

for (i = 0; i < in->rows; i++)
   out->elem[i][0] = ((in->elem[i][0] & mask) == 0) ? 0 : 1;

return(out);
}


int_matrix *int_insert_bit(int_matrix *in,int b,int_matrix *out)
{
int i,mask;

if (b < 0 || b > 31)
  {
   printf("error in 'int_insert_bit':  b must be between 0 and 31\n");
   printf("  in this case, b = %d\n",b);
   exit(1);
 }
int_vector_check("int_insert_bit",in);

mask = 1 << b;
int_conform_matrix(in->rows,1,out);

for (i = 0; i < in->rows; i++)
  {
   if (in->elem[i][0] == 0)
       out->elem[i][0] = out->elem[i][0] & (~mask);
   else
       out->elem[i][0] = out->elem[i][0] | mask;
 }

return(out);
}

int_matrix *int_delay(int_matrix *in, int delay, int_matrix *out)
{
int i;
int_matrix *temp;

if (delay < 0)
  {
   printf("error in 'int_delay':  delay must be >= 0\n");
   printf("   in this case, delay = %d\n",delay);
   exit(1);
 }
int_vector_check("int_delay",in);

int_conform_matrix(in->rows,1,out);
if (in != out)
  {
   for (i = 0; i < in->rows; i++)
     {
      if ( (i-delay) >= 0)
         out->elem[i][0] = in->elem[i-delay][0];
      else
         out->elem[i][0] = 0;
     }
  }
else
  {
   temp = int_init("temp");
   int_conform_matrix(in->rows,1,temp);
   for (i = 0; i < in->rows; i++)
     {
      if ( (i-delay) >= 0)
         temp->elem[i][0] = in->elem[i-delay][0];
      else
         temp->elem[i][0] = 0;
     }
   int_copy(temp,out);
   int_free_matrix(temp);
  }

return(out);
} 



int_matrix *int_copy(int_matrix *A, int_matrix *B) 
{ 
register int i,j; 
 
int_conform_matrix(A->rows,A->cols,B); 
for (i = 0; i < A->rows; i++) 
   for (j = 0; j < A->cols; j++) 
       B->elem[i][j] = A->elem[i][j]; 
return(B); 
} 




/* note:  will map negative real values in x to their two's complement
          counterparts in y */
int_matrix *real_to_int(matrix *x,int_matrix *y)
{
int i,j;

int_conform_matrix(x->rows,x->cols,y);

for (i = 0; i < x->rows; i++)
   for (j = 0; j < x->cols; j++) 
      y->elem[i][j] = (unsigned long int) floor(x->elem[i][j]);

return(y);
}


matrix *int_to_real(int_matrix *x,matrix *y)
{
int i,j;

conform_matrix(x->rows,x->cols,y);

for (i = 0; i < x->rows; i++)
   for (j = 0; j < x->cols; j++)
      y->elem[i][j] = (double) ((signed long int) x->elem[i][j]);

return(y);
}


int_matrix *int_limit_bits(int_matrix *in,int num_bits,int_matrix *out)
{
int i;
unsigned long int mask_num_bits;


if (num_bits > 32 || num_bits < 1)
  {
   printf("error in 'int_limit_bits':  must have 1 <= num_bits <= 32\n");
   printf("   in this case, num_bits = %d\n",num_bits);
   exit(1);
 }
int_vector_check("int_limit_bits",in);

if (num_bits == 32) 
   mask_num_bits = ~0;
else
   mask_num_bits = (1 << num_bits) - 1;

int_conform_matrix(in->rows,1,out);

for (i = 0; i < in->rows; i++)
   out->elem[i][0] = in->elem[i][0] & mask_num_bits;

return(out);
}


/*  test of delta_sigma modulator 


x = init("x");
temp = init("temp");
in = int_init("in");
out = int_init("out");
error = int_init("error");

timing = set_timing(1E-6,0.0,5000,'n');

create_sin_wave(.997e3,0,pow(2,29),timing,x);
add(x,s_to_m(pow(2,30),x->rows,1,temp),x); 
send_to_file(s_times_m(1.5/pow(2,29),x,temp),"sin.dat","w");
real_to_int(x,in);

int_ord2_mash(in,31,29,out);

int_to_real(out,x);
send_to_file(x,"out.dat","w");  */

/*   test of 2nd order delta sigma modulator 
int_s_to_m((int) 0x3555,20000,1,alpha);
int_ord1_mash(alpha,16,15,error,n_value);
int_ord2_mash(error,16,12,shaped_int_error);
int_limit_bits(shaped_int_error,4,shaped_int_error);  (optional)


conform_matrix(error->rows,1,in);
conform_matrix(error->rows,1,x);
for (i = 0; i < error->rows; i++)
  {
   in->elem[i][0] = (double) ((int) error->elem[i][0]);
   x->elem[i][0] = ((double) ((int) shaped_int_error->elem[i][0]));
 }
send_to_file(in,"in.dat","w");
send_to_file(x,"x.dat","w");
exit(1);

*/


int_matrix *int_ord2_mash(int_matrix *in,int b,int beta,int_matrix *out)
{
int i;
int_matrix *error,*error2,*out2;

if (b == 32)
  {
   printf("error in 'int_ord2_mash':  must have b < 32\n");
   printf("   in this case, 'b = %d bits'\n",b);
   exit(1);
 }
int_vector_check("int_ord2_mash",in);

error = int_init("error");
error2 = int_init("error2");
out2 = int_init("out2");

int_ord1_mash(in,b,beta,error,out);
int_ord1_mash(error,beta+1,beta,error2,out2);
int_deriv(out2,out2);
int_add(out,out2,out);

int_free_matrix(error);
int_free_matrix(error2);
int_free_matrix(out2);

return(out);
}

void int_free_matrix(int_matrix *x)
{
int_conform_matrix(0,0,x);
free(x);
} 

int_matrix *int_deriv(int_matrix *in,int_matrix *out)
{
unsigned long int delay_value=0,store_delay;
int i;

int_vector_check("int_deriv",in);
int_conform_matrix(in->rows,1,out);

for (i = 0; i < in->rows; i++)
  {
   store_delay = in->elem[i][0];
   out->elem[i][0] = in->elem[i][0] - delay_value;
   delay_value = store_delay;
 }

return(out);
}



int_matrix *int_ord1_mash(int_matrix *in,int b,int beta,
       int_matrix *error,int_matrix *out)
{
unsigned long int mask_b,mask_error,mask_out,delay_value=0;
int i;

if (b > 32 || b < 1)
  {
   printf("error in 'int_ord1_mash':  must have 1 <= b <= 32\n");
   printf("   in this case, b = %d\n",b);
   exit(1);
 }
if (beta > b || beta < 1)
  {
   printf("error in 'int_ord1_mash':  must have 0 < beta <= b\n");
   printf("   in this case, beta = %d, b = %d\n",beta,b);
   exit(1);
 }
if (error == in || error == out)
  {
   printf("error in 'int_ord1_mash':  error matrix must be\n");
   printf("  distinct from in and out matrices\n");
   printf("  (in this case, error = '%s', in = '%s', out = '%s'\n",
            error->name,in->name,out->name);
   exit(1);
 }
int_vector_check("int_ord1_mash",in);

int_conform_matrix(in->rows,1,out);
int_conform_matrix(in->rows,1,error);
if (b == 32) 
   mask_b = ~0;
else
   mask_b = (1 << b) - 1;
mask_error = (1 << beta) - 1;
mask_out = mask_b ^ mask_error;


for (i = 0; i < in->rows; i++)
  {
   if ((in->elem[i][0] & (~mask_b)) == 0)
     {
      out->elem[i][0] = in->elem[i][0] + delay_value;
      delay_value = out->elem[i][0] & mask_error;
      error->elem[i][0] = delay_value;
      out->elem[i][0] = (out->elem[i][0] & mask_out) >> beta;
    }
   else
     {
      printf("error in 'int_ord1_mash':  input values must\n");
      printf("      be constrained to 'b = %d bits'\n",b);
      printf("in->elem[%d][0] = %s\n",i,bit_print(in->elem[i][0]));
      exit(1);
     }
  }
return(out);
}


int_matrix *int_add(int_matrix *A,int_matrix *B,int_matrix *C)   
{   
int i,j;   
   
if (A->rows != B->rows || A->cols != B->cols)   
  {   
   printf("error in 'int_add':  attempt to add uncompatible matrices\n\n");   
   printf("matrix %s is %d by %d, and matrix %s is %d by %d\n",   
           A->name,A->rows,A->cols,B->name,B->rows,B->cols);   
   exit(1);   
 }   
int_conform_matrix(A->rows,A->cols,C);   
for (i = 0; i < A->rows; i++)   
   for (j = 0; j < A->cols; j++)   
       (C->elem)[i][j] = (A->elem)[i][j] + (B->elem)[i][j];   
return(C);   
}   

int_matrix *int_sub(int_matrix *A,int_matrix *B,int_matrix *C)   
{   
int i,j;   
   
if (A->rows != B->rows || A->cols != B->cols)   
  {   
   printf("error in 'int_sub':  attempt to add uncompatible matrices\n\n");   
   printf("matrix %s is %d by %d, and matrix %s is %d by %d\n",   
           A->name,A->rows,A->cols,B->name,B->rows,B->cols);   
   exit(1);   
 }   
int_conform_matrix(A->rows,A->cols,C);   
for (i = 0; i < A->rows; i++)   
   for (j = 0; j < A->cols; j++)   
       (C->elem)[i][j] = (A->elem)[i][j] - (B->elem)[i][j];   
return(C);   
}   


int_matrix *int_print(int_matrix *A,char *control)   
{   
int i,j;   
   
printf("\nmatrix:  %s   (%d by %d)\n\n",A->name,A->rows,A->cols);   
for (i=0;i < A->rows;i++)   
  {   
   for (j=0;j < A->cols;j++)   
     {
     if (strcmp(control,"b") == 0)
        printf("%s ",bit_print((A->elem)[i][j]));   
     else if (strcmp(control,"d") == 0)
        printf("%d ",(A->elem)[i][j]);   
     }
   printf("\n");   
 }   
return(A);   
}   

int_matrix *int_s_to_m(unsigned int scalar,int rows,
          int cols,int_matrix *A)   
{   
int i,j;   
   
if (rows < 0)   
  {
   printf("error in 'int_s_to_m':  rows = %d which is < 0\n",rows); 
   exit(1);
 }
else if (cols < 0)   
  {
   printf("error in 'int_s_to_m':  cols = %d which is < 0\n",cols); 
   exit(1);
 }
int_conform_matrix(rows,cols,A);   
for (i = 0; i < A->rows; i++)   
   for (j = 0; j < A->cols; j++)   
       (A->elem)[i][j] = scalar;   
return(A);   
}   

int_matrix *int_s_times_m(unsigned int scalar,
                      int_matrix *A,int_matrix *B)   
{   
int i,j;   
   
int_conform_matrix(A->rows,A->cols,B);   
for (i = 0; i < A->rows; i++)   
   for (j = 0; j < A->cols; j++)   
       (B->elem)[i][j] = scalar*(A->elem)[i][j];   
return(B);   
}   


int_matrix *int_conform_matrix(int rows,int cols,int_matrix *A)   
{   
int i;   
   
if (rows < 0)
  {
   printf("error in 'int_conform_matrix':  rows = %d which is < 0\n",rows);   
   exit(1);
 }
if (cols < 0)   
  {
   printf("error in 'int_conform_matrix':  cols = %d which is < 0\n",cols);   
   exit(1);
 }
if (A->rows != rows || A->cols != cols)
  {   
   if (A->rows > 0 || A->cols > 0)   
     {   
     for (i = 0; i < A->rows; i++)   
        free((A->elem)[i]);   
     free(A->elem);   
     }   
   if (rows > 0 && cols > 0)   
     {   
     if ((A->elem = (unsigned long int **) calloc(rows,
            sizeof(unsigned long int *))) == NULL)   
        {   
         printf("error in 'int_conform_matrix':  calloc call failed - \n");   
         printf("  not enough memory!!\n");   
         exit(1);   
       }   
     for (i = 0; i < rows; i++)   
        if (((A->elem)[i] = (unsigned long int *) calloc(cols,
              sizeof(unsigned long int))) == NULL)   
           {   
            printf("error in 'int_conform_matrix':  calloc call failed - \n");   
            printf("  not enough memory!!\n");   
            exit(1);   
          }   
    }   
 }   
A->rows = rows;   
A->cols = cols;   
return(A);   
}   

int_matrix *int_init(char *name)   
{   
int_matrix *A;   
int i;   
   
if ((A = (int_matrix *) malloc(sizeof(int_matrix))) == NULL)   
   {   
   printf("error in 'int_init':  malloc call failed\n");   
   printf("out of memory!\n");   
   exit(1);   
  }   
strncpy(A->name,name,29);   
A->rows = 0;   
A->cols = 0;   
return(A);   
}   

char *bit_print(unsigned long int v)
{
int i, mask = 1 << 31,j;
static char out[40];

for (i=1,j=0; i <=32; ++i)
  {
   out[j++] = ((v & mask) == 0) ? '0' : '1';
   v <<=1;
   if (i%8 == 0 && i != 32)
      out[j++] = ' ';
 }
out[j] = '\0';
return(out);
}

