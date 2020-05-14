#include "dist.h"
#include <stdio.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <string.h>

struct Node {
  char * card_value;
  float probability;
  struct Node *next;
};

char * deck[] = {"A-Heart", "1-Heart", "2-Heart", "3-Heart", "4-Heart",
                "5-Heart", "6-Heart", "7-Heart", "8-Heart", "9-Heart",
                "10-Heart", "J-Heart", "Q-Heart", "K-Heart", "A-Spade",
                "1-Spade", "2-Spade", "3-Spade", "4-Spade", "5-Spade",
                "6-Spade", "7-Spade", "8-Spade", "9-Spade", "10-Spade",
                "J-Spade", "Q-Spade", "K-Spade", "A-Club", "1-Club",
                "2-Club", "3-Club", "4-Club", "5-Club", "6-Club", "7-Club",
                "8-Club", "9-Club", "10-Club", "J-Club", "Q-Club", "K-Club",
                "A-Diamond", "1-Diamond", "2-Diamond", "3-Diamond",
                "4-Diamond", "5-Diamond", "6-Diamond", "7-Diamond",
                "8-Diamond", "9-Diamond", "10-Diamond", "J-Diamond",
                "Q-Diamond", "K-Diamond"};

void push(struct Node** head_ref, int size) {
    struct Node* new_node = (struct Node*) malloc(sizeof(struct Node));
    new_node->card_value = deck[rand()%52];
    new_node->probability = 1.0/((float) size);
    new_node->next = (*head_ref);
    (*head_ref) = new_node;
}

void pop(struct Node **head_ref, int position)
{
   if (*head_ref == NULL) { return; }

   struct Node* temp = *head_ref;

   if (position == 0) {
     *head_ref = temp->next;
     free(temp);
     return;
   }

   for (int i=0; temp!=NULL && i<position-1; i++){
     temp = temp->next;
   }

   if (temp == NULL || temp->next == NULL) { return; }

   struct Node *next = temp->next->next;
   free(temp->next);
   temp->next = next;
}

void printList(struct Node **head_ref, int size) {
  if (size <= 0) {
    return;
  }
  printf("--- Number of Cards: %d\n", size);
  struct Node* temp = *head_ref;
  while (temp != NULL) {
    printf("value: %s   \tprob: %f\n", temp->card_value, temp->probability);
    temp = temp->next;
  }
}

void editDistribution(struct Node **head_ref, int size){
  struct Node* temp = *head_ref;
  while (temp != NULL)  {
    temp->probability = 1.0/((float) size);
    temp = temp->next;
  }
}

void removeRandomCard(struct Node ** head_ref, int new_size){
  if (new_size <= 0) {
    return;
  }
  int randomnumber = rand()%(1+new_size);
  pop(head_ref, randomnumber);
  editDistribution(head_ref, new_size);
}

// int main() {
//     srand(time(0));
//     struct Node *start = NULL;
//     start = NULL;
//     int input_size = 5; // CHANGE ME TO ADD NUMBER
//     for (int i=0; i < input_size; i++) {
//        push(&start, input_size);
//     }
//     printList(&start, input_size);

//     input_size -= 1;

//     removeRandomCard(&start, input_size);
//     printList(&start, input_size);

//     input_size -= 1;

//     removeRandomCard(&start, input_size);
//     printList(&start, input_size);

//     return 0;
// }

struct Node *makeNode(char *dist){
	struct Node *n;
	char delim[2]= ":";
	char * end_ptr;
	strcpy(strtok(dist, delim),n->card_value);
	float result = strtof(strtok(dist, delim), &end_ptr );
	n->probability = result;
	return n;
}
char* sample(char *dist){
   return dist;
}

void fillDist(struct Dist *dist,char * d){
	dist->n=d;
	dist->p=3.3;
	dist->next=NULL;
}