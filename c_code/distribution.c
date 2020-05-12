#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

struct Node {
  char card_value;
  char card_symbol;
  float probability;
  struct Node *next;
};

char symbol_arr[] = {'H','D','S','C'};
char value_arr[] = {'A','2','3','4','5','6','7','8','9','T','J','Q','K'};

void push(struct Node** head_ref, int size) {
    struct Node* new_node = (struct Node*) malloc(sizeof(struct Node));
    new_node->card_value  = symbol_arr[rand()%4];
    new_node->card_symbol  = value_arr[rand()%13];
    new_node->probability = 1.0/((float) size);

    new_node->next = (*head_ref);
    (*head_ref) = new_node;
}

void printList(struct Node *node) {
  while (node != NULL)  {
    printf("value: %c, symbol: %c, prob: %f\n", node->card_value, node->card_symbol, node->probability);
    node = node->next;
  }
}

int main() {
    srand(time(0));
    struct Node *start = NULL;

    start = NULL;
    int input_size = 7;
    for (int i=0; i < input_size; i++) {
       push(&start, input_size);
    }
    printList(start);
    return 0;
}
