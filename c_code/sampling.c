#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

float get_closest_tenth_value(int num){
  int len = log10(num) + 1;
  return pow(10, len);
}

void generate_samples(float *array_address, int num) {
  srand(time(0));
  int sample;
  float closest_tenth;
  for (int i = 0; i < num; i++) {
    sample = rand();
    closest_tenth = get_closest_tenth_value(sample);
    *array_address = sample/closest_tenth;
    array_address++;
  }
}

#ifdef BUILD_TEST
int main()
{
  int sample_size = 5;
  float samples_array[sample_size];

  generate_samples(samples_array, sample_size);

  for (int i = 0; i < sample_size ; i++) {
    printf("samples_array[%d]: %f\n", i, samples_array[i]);
  }
}
#endif
