struct Event{
	char* e;
};

struct Dist {
  char * n;
  float p;
  struct Dist *next;
};

char* sample(char *dist);


