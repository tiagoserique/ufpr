#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <likwid.h>

#include "utils.h"
#include "libGaussJacobi.h"

int main(int argc, char ** argv) {

  LIKWID_MARKER_INIT;

  if (argc < 2) {
    printf("uso: %s file_in\n\n", argv[0]);
    return 1;
  }

  FILE *f_in = fopen(argv[1], "r");
  int n;
  fscanf(f_in, "%d", &n);
  rewind(f_in);

  FILE *f_out;

  f_out = fopen(markerName("out_gaussJacobi", n), "w");
  LIKWID_MARKER_START("out_gaussJacobi");
  gaussJacobi(f_in, f_out);
  LIKWID_MARKER_STOP("out_gaussJacobi");
  fclose(f_out);
  rewind(f_in);

  f_out = fopen(markerName("out_gaussJacobiOpt", n), "w");
  LIKWID_MARKER_START("out_gaussJacobiOpt");
  gaussJacobiOpt(f_in, f_out);
  LIKWID_MARKER_STOP("out_gaussJacobiOpt");
  fclose(f_out);
  fclose(f_in);

  LIKWID_MARKER_CLOSE;
  return 0;
}
