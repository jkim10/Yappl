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
  printf("--- Number of Cards: %d\n", size);
  struct Dist * temp = *head_ref;
  while (temp != NULL) {
    printf("value: %s   \tprob: %f\n", temp->n, temp->p);
    temp = temp->next;
  }
}

struct Dist *makeNode(struct Dist ** head_ref, char ** dist){
  struct Dist * n = *head_ref;
	const char delim[2]= ":";
  char copy_of_dist[255];

  strcpy(copy_of_dist, *dist);

  n->n = strtok(*dist, delim);
  printf("value: %s  \t", n->n);

  char * token = strtok(copy_of_dist, delim);
  token = strtok(NULL, delim); // parses again to get probability

	n->p = atof(token);
  printf("prob: %f\n", n->p);

  n->next = NULL;
	return n;
}

char * sample(struct Dist ** head_ref, int size){
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

void fillDist(struct Dist *dist,char * d){
	dist->n=d;
	dist->p=3.3;
	dist->next=NULL;
}

int main(){
  char input[] = "t:0.5,test:0.3,test2:0.2";
  const char comma[2] = ",";

  char * token = NULL;
  char * copy_token = NULL;
  int number_of_item = 0;

  token = strtok(input, comma);

  struct Dist * output = (struct Dist *) malloc(sizeof(struct Dist));

  while (token != NULL){
    printf("token: %s\n", token);
    copy_token = token;
    ++number_of_item;

    output = makeNode(&output, &token);
    token = strtok(NULL, comma);
  }

  printf("\n");
  printList(&output, number_of_item);

  printf("\n");
  char * returned_sample = sample(&output, number_of_item);
  free(returned_sample);

  return 0;
}
