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

void pop(struct Node **head_ref, int pop_idx) {
    struct Node* temp = *head_ref, *prev;
    int current_idx = 0;

    if (temp != NULL && (current_idx == pop_idx)) {
        *head_ref = temp->next;
        printf("\n--- Removing Card: %s\n", temp->card_value);
        free(temp);
        return;
    }
    ++current_idx;

    while (temp != NULL && (current_idx != pop_idx)){
        prev = temp;
        temp = temp->next;
        ++current_idx;
    }

    if (temp == NULL) {
      return;
    } else {
      printf("\n--- Removing Card: %s\n", temp->card_value);
      prev->next = temp->next;
      free(temp);
    }
}

void printList(struct Node *node, int size) {
  printf("--- Number of Cards: %d\n", size);
  while (node != NULL)  {
    printf("value: %s   \tprob: %f\n", node->card_value, node->probability);
    node = node->next;
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
  int randomnumber = rand()%(1+new_size);
  pop(head_ref, randomnumber);
  editDistribution(head_ref, new_size);
}

int main() {
    srand(time(0));
    struct Node *start = NULL;
    start = NULL;
    int input_size = 4;
    for (int i=0; i < input_size; i++) {
       push(&start, input_size);
    }
    printList(start, input_size);

    removeRandomCard(&start, --input_size);
    printList(start, input_size);

    removeRandomCard(&start, --input_size);
    printList(start, input_size);

    return 0;
}
