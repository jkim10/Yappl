#include "dist.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <string.h>

void printList(struct Dist **head_ref, int size) {
  if (size <= 0) {
    return;
  }
  printf("--- Number of Items: %d\n", size);
  struct Dist * temp = *head_ref;
  while (temp != NULL) {
    printf("value: %s   \tprob: %f\n", temp->n, temp->p);
    temp = temp->next;
  }
}

struct Dist *makeNode(struct Dist ** head_ref, char ** dist){
  struct Dist * n = *head_ref;
  char * token = (char *) malloc(sizeof(char *));
  strcpy(token, *dist);
  const char delim[2]= ":";

  char * value = NULL;
  value = strtok(token, delim);
  printf("value: %s\t", value);
  n->n = value;
  value = strtok(NULL, delim);
  printf("prob: %s\n", value);
  n->p = atof(value);
  
  n->next = NULL;
  free(token);
  return n;
}

char * sample(struct Dist ** head_ref, int size){
   if (size <= 0){
     return "No items to sample";
   }
   int randomnumber = rand()%(1+size);
   struct Dist * temp = *head_ref;

   for (int i=0; temp!=NULL && i<randomnumber-1; i++){
     temp = temp->next;
   }

   char * result = (char *) malloc(sizeof(char) * 255);
   sprintf(result, "sample -> val: %s\tprob: %f", temp->n, temp->p);
   printf("%s\n", result);

   return result;
}

int main(){
  char input[] = "t:0.5,test:0.3,test2:0.2";
  char* rest = NULL;

  char * token = (char *) malloc(sizeof(char *));
  int number_of_item = 0;

  struct Dist * output = (struct Dist *) malloc(sizeof(struct Dist));
  struct Dist ** p_output = &output;

  int counter = 0;
  for (token = strtok_r(input, ",", &rest); token != NULL; token = strtok_r(NULL, ",", &rest))
  {
    if (counter == 0){
      output = makeNode(&output, &token);
    } else {
      struct Dist * temp_output = (struct Dist *) malloc(sizeof(struct Dist));
      temp_output = makeNode(&temp_output, &token);
      output->next = temp_output;
    }
    ++number_of_item;
    ++counter;
    printf("token: %s\n", token);
  }

  printf("\n");
  printList(p_output, number_of_item);

  printf("\n");
  sample(&output, number_of_item);
  free(token);
  return 0;
}
