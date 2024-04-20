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
 
#include <stdio.h>
#include <stdlib.h> /* use with ansi compiler */
#include <math.h>  
  
  
/* the following dictates whether matrices are single or double precision  */  
/* note:  EL_TYPE_NUMBER = 1 if float specified, 2 if double specified for */  
/* EL_TYPE                                                                 */  
typedef double EL_TYPE;  
#define EL_TYPE_NUMBER 2  
/* the following dictate when singular values are to be rounded down to 0 */  
/* 'least_squares':  single precision limit on rounding down singular values */  
/* note:  this limit is scaled by the maximum singular value */  
#define LS_SP_SV_L 1E-4  
/* 'least_squares':  double precision limit on rounding down singular values */  
/* note:  this limit is scaled by the maximum singular value */  
#define LS_DP_SV_L 1E-8  
/* 'inverse_matrix':  single precision limit on singular values to */  
/*                    determine if matrix is singular            */  
/* note:  this limit is scaled by the maximum singular value */   
#define INV_SP_SV_L 1E-4  
/* 'inverse_matrix':  double precision limit on singular values to */  
/*                    determine if matrix is singular            */  
/* note:  this limit is scaled by the maximum singular value */  
#define INV_DP_SV_L 1E-8  
/* 'inverse_matrix':  single precision limit on inverse condition number of */  
/*                    determining if matrix is ill-conditioned          */  
#define INV_SP_RC_L -1.5  
/* 'inverse_matrix':  double precision limit on inverse condition number of */  
/*                    determining if matrix is ill-conditioned          */  
#define INV_DP_RC_L -3.0 

#define ISIGN -1.0
/*  the following definition is used by the 'qr_decomp' function */
#define QR_DIVIDE_ERROR 1E-3

/*  the following definition is used by the 'peak_detect' function */
#define PK_DIVIDE_ERROR 1E-9
    
/* the following defines the maximum number of characters read in per line */  
/* for a file (used by the 'fillin_matrix' function) */  
#define MAX_FILE_CHAR 3000  
  
/* the following defines and declarations are used by the 'svd' function */  
static float at,bt,ct;  
#define PYTHAG(a,b) ((at = fabs(a)) > (bt = fabs(b)) ? (ct = bt/at,at*sqrt(1.0+ct*ct)) : (bt ? (ct=at/bt,bt*sqrt(1.0+ct*ct)) : 0.0))  
static float maxarg1,maxarg2;  
#define MAX(a,b) (maxarg1 = (a), maxarg2 = (b), (maxarg1) > (maxarg2) ? (maxarg1) : (maxarg2))  
#define SIGN(a,b) ((b) >= 0.0 ? fabs(a) : -fabs(a))  

/* the following define is used by pn_seq */
#define XOR(x,y) (((x) == (y)) ? 0.0 : 1.0)
  
/* the following 'defines' are used with the 'ran1' function */  
#define M1 259200  
#define IA1 7141  
#define IC1 54773  
#define RM1 (1.0/M1)  
#define M2 134456  
#define IA2 8121  
#define IC2 28411  
#define RM2 (1.0/M2)  
#define M3 243000  
#define IA3 4561  
#define IC3 51349  
#ifndef PI
  #define PI 3.14159265359
#endif

typedef struct  
  {  
   char name[30];  
   int rows,cols;  
   EL_TYPE **elem;
} matrix;  

/* Initialization and closure of matrices */
matrix *init(char *name);  
matrix *conform_matrix(int rows,int cols,matrix *A);
void free_matrix(matrix *x);

/* ASCII I/O */
matrix *load(char filename[],matrix *A);
matrix *save(matrix *A,char *filename);
matrix *print(matrix *A);

/* Norms of matrices */
EL_TYPE l2_norm(matrix *x);
EL_TYPE l1_norm(matrix *x);
EL_TYPE inf_norm(matrix *x);
double mean(matrix *A);
double var(matrix *A); 

/* Filtering operations */
matrix *filter(matrix *A,matrix *B,matrix *U,matrix *Y);
matrix *conv(matrix *A,matrix *B,matrix *C);
matrix *phase_shifter(matrix *inp, double phase, matrix *out);
matrix *peak_detect(matrix *input, double time_constant, 
                   double sample_period, matrix *output);

/* Creation of matrices */
matrix *s_to_m(double scalar,int rows,int cols,matrix *A);
matrix *gauss_ran_vector(int idum,int rows,matrix *A);
matrix *pn_seq(matrix *init_vec,matrix *poly_vec, int num_samples,
                 matrix *out);
matrix *eye(int rows,int cols,matrix *A);

/* Basic matrix operations */
matrix *copy(matrix *A, matrix *B);
matrix *p_of_m(matrix *input,int top_row,int left_col,int bot_row,int right_col,matrix *out);
matrix *s_in_m(matrix *input,int top_row,int left_col,matrix *out);
matrix *s_times_m(double scalar,matrix *A,matrix *B);
matrix *reverse(matrix *A,matrix *B);
matrix *add(matrix *A,matrix *B,matrix *C);
matrix *sub(matrix *A,matrix *B,matrix *C);  
matrix *mul(matrix *A,matrix *B,matrix *C);
matrix *mul_elem(matrix *A,matrix *B,matrix *C);
matrix *trans(matrix *A,matrix *B);
void qr_decomp(matrix *A,matrix *Q,matrix *R);
void svd(matrix *A,matrix *U,matrix *W,matrix *V);
matrix *inv(matrix *A,matrix *B);
matrix *least_sq(matrix *A,matrix *b,matrix *x);
matrix *nonlin(matrix *in, double a0, double a1, double a2, double a3, matrix *out);

/* FFT and inverse FFT operations */
void mag_phase(matrix *REAL, matrix *IMAG, matrix *MAG, matrix *PHASE);
void real_imag(matrix *MAG, matrix *PHASE, matrix *REAL, matrix *IMAG);  
void real_fft(matrix *DATA, matrix *REAL, matrix *IMAG);
void four1(matrix *DATA, matrix *FFT);
void fft(matrix *DATA_REAL, matrix *DATA_IMAG, matrix *FFT_REAL, matrix *FFT_IMAG);
void ifft(matrix *DATA_REAL, matrix *DATA_IMAG, matrix *FFT_REAL, matrix *FFT_IMAG);

/* Support functions for other matrix functions */
matrix *replace_elements(EL_TYPE **new_elements,int rows,int cols,matrix *A);
float ran1(int *idum);
float gasdev(int *idum);   
double bernoulli(double p);
void neg_index_error(char *function,char *variable,int value,matrix *A);
  
  
/************************ Integer matrix library **************************/

typedef struct  
  {  
   char name[30];  
   int rows,cols;  
   unsigned long int **elem;     
} int_matrix;  



/* Initialization and closure of integer matrices */
int_matrix *int_conform_matrix(int rows,int cols,int_matrix *A);
int_matrix *int_init(char *name);
void        int_free_matrix(int_matrix *x);

/* Creation of int_matrices */
int_matrix *int_s_to_m(unsigned int scalar,int rows,int cols,int_matrix *A);

/* Conversions between real and integer matrices */
int_matrix *real_to_int(matrix *x,int_matrix *y);
matrix     *int_to_real(int_matrix *x,matrix *y);

/* ASCII I/O */
int_matrix *int_load(char filename[],int_matrix *int_A);
int_matrix *int_save(int_matrix *int_A, char *filename);
int_matrix *int_print(int_matrix *A,char *control);

/* Basic integer matrix operations */
int_matrix *int_insert_bit(int_matrix *in,int b,int_matrix *out);
int_matrix *int_extract_bit(int_matrix *in,int b,int_matrix *out);
int_matrix *int_limit_bits(int_matrix *in,int num_bits,int_matrix *out);
int_matrix *int_delay(int_matrix *in, int delay, int_matrix *out);
int_matrix *int_add(int_matrix *A,int_matrix *B,int_matrix *C);
int_matrix *int_sub(int_matrix *A,int_matrix *B,int_matrix *C);
int_matrix *int_copy(int_matrix *A, int_matrix *B);
int_matrix *int_s_times_m(unsigned int scalar,int_matrix *A,int_matrix *B);
int_matrix *int_deriv(int_matrix *in,int_matrix *out);

/* Sigma Delta functions */
int_matrix *int_ord1_mash(int_matrix *in,int b,int beta,
       int_matrix *error,int_matrix *out);
int_matrix *int_ord2_mash(int_matrix *in,int b,int beta,int_matrix *out);

/* Support functions for other int_matrix functions */
char *bit_print(unsigned long int v);

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
