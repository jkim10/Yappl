struct Event{
	char* e;
};

struct Dist {
  char * n;
  float p;
  struct Dist *next;
};

void printList(struct Dist **head_ref, int size);

struct Dist *makeNode(struct Dist ** head_ref, char ** dist);

char * sample(struct Dist ** head_ref, int size);
