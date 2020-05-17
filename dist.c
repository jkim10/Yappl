#include <time.h>
#include <stdlib.h>



char* sample(
             char *a1, char *a2, char *a3, char *a4, char *a5, char *a6, char *a7, char *a8, char *a9, char *a10,
             char *a11, char *a12, char *a13, char *a14, char *a15, char *a16, char *a17, char *a18, char *a19, char *a20,
             char *a21, char *a22, char *a23, char *a24, char *a25, char *a26, char *a27, char *a28, char *a29, char *a30,
             char *a31, char *a32, char *a33, char *a34, char *a35, char *a36, char *a37, char *a38, char *a39, char *a40,
             char *a41, char *a42, char *a43, char *a44, char *a45, char *a46, char *a47, char *a48, char *a49, char *a50,
             char *a51, char *a52, char *a53, char *a54, char *a55, char *a56, char *a57, char *a58, char *a59, char *a60,
             char *a61, char *a62, char *a63, char *a64, char *a65, char *a66, char *a67, char *a68, char *a69, char *a70,
             char *a71, char *a72, char *a73, char *a74, char *a75, char *a76, char *a77, char *a78, char *a79, char *a80,
             char *a81, char *a82, char *a83, char *a84, char *a85, char *a86, char *a87, char *a88, char *a89, char *a90,
             char *a91, char *a92, char *a93, char *a94, char *a95, char *a96, char *a97, char *a98, char *a99, char *a100
            ){
  char *arr[100] = {a1, a2, a3, a4, a5, a6, a7, a8, a9, a10,
             a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
             a21, a22, a23, a24, a25, a26, a27, a28, a29, a30,
             a31, a32, a33, a34, a35, a36, a37, a38, a39, a40,
             a41, a42, a43, a44, a45, a46, a47, a48, a49, a50,
             a51, a52, a53, a54, a55, a56, a57, a58, a59, a60,
             a61, a62, a63, a64, a65, a66, a67, a68, a69, a70,
             a71, a72, a73, a74, a75, a76, a77, a78, a79, a80,
             a81, a82, a83, a84, a85, a86, a87, a88, a89, a90,
             a91, a92, a93, a94, a95, a96, a97, a98, a99, a100};
  int randMax = 99;
  srand(time(NULL));
  int r = rand() % randMax;
  // printf("~~~~~~~~~~~~~~~~~~\n");
  // for(int i=0; i<100;i++){
  //   printf("%s\n",arr[i]);
  // }
  // printf("~~~~~~~~~~~~~~~~~~\n");
  return arr[r];
}