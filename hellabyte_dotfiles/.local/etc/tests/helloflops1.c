//
// helloflops1
//
// Taken from linuxkernal.com/files/M.Kaufmann.-.Intel.XPCHPP2013.pdf
//
//


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>

double dtime() {
  double tsecs = 0.;
  struct timeval myt;
  gettimeofday(&myt, (struct timezone*)0);
  tsecs = (double)(myt.tv_sec + myt.tv_usec*1.0e-6);

  return( tsecs );
}

#define FLOPS_ARR_SIZE (1024*1024)
#define MAXFLOPS_ITERS 100000000 
#define LOOP_COUNT     128
#define FLOPS_PER_CALC 2

float fa[FLOPS_ARR_SIZE] __attribute__((align(64)));
float fb[FLOPS_ARR_SIZE] __attribute__((align(64)));

int main(int argc, char *argv[] ) {
  int i, j, k;
  double tstart, tstop, ttime;
  double gflops = 0.;
  float a = 1.1;

  printf("Initializing\r\n");
  for(i=0; i<FLOPS_ARR_SIZE;i++){
    fa[i]=(float)i+.1;
    fb[i]=(float)i+.2;
  }

  printf("Starting Compute");

  tstart = dtime();
  for(j=0;j<MAXFLOPS_ITERS;j++){
    for(k=0;k<LOOP_COUNT;k++){
      fa[k] = a * fa[k] + fb[k];
    }
  }
  tstop = dtime();

  gflops = (double)( 1.0e-9 * LOOP_COUNT * MAXFLOPS_ITERS * FLOPS_PER_CALC);

  ttime = tstop - tstart;

  if( (ttime) > 0. ){
    printf("GFlops = %10.31f\n Secs = %10.31f\n GFlops per sec = %10.31f\r\n", 
      gflops, ttime, gflops/ttime );
  }
  return( 0 );
}


