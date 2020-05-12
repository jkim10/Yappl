#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

float get_closest_tenth_value(int num){
  int len = log10(num) + 1;
  return pow(10, len);
}

void generate_samples(float *array_address, int num) {
  int sample;
  float closest_tenth;
  for (int i = 0; i < num; i++) {
    sample = rand();
    closest_tenth = get_closest_tenth_value(sample);
    *array_address = sample/closest_tenth;
    array_address++;
  }
}

int main()
{
  // setting the random seed
  srand(time(0));

  // 1D example
  int sample_size = 5;
  float samples_1D_array[sample_size];
  generate_samples(samples_1D_array, sample_size);
  for (int i = 0; i < sample_size ; i++) {
    printf("%f\n", samples_1D_array[i]);
  }

  printf("\n");

  // 2D example
  int sample_size_x = 4, sample_size_y = 3;
  float samples_2D_array[sample_size_x][sample_size_y];
  for (int i = 0; i < sample_size_x; i++){
    generate_samples(samples_2D_array[i], sample_size_y);
  }
  for (int i = 0; i < sample_size_x; i++){
    printf("[");
    for (int j = 0; j < sample_size_y; j++) {
      printf("%f, ", samples_2D_array[i][j]);
    }
    printf("], ");
    printf("\n");
  }

  printf("\n");

  // 3D example
  float samples_3D_array[sample_size_x][sample_size_y][sample_size];
  for (int i = 0; i < sample_size_x; i++){
    for (int j = 0; j < sample_size_y; j++) {
      generate_samples(samples_3D_array[i][j], sample_size);
    }
  }
  for (int i = 0; i < sample_size_x; i++){
    for (int j = 0; j < sample_size_y; j++) {
      printf("[");
      for (int k = 0; k < sample_size; k++) {
        printf("%f, ", samples_3D_array[i][j][k]);
      }
      printf("], ");
    }
    printf("\n");
  }
}
