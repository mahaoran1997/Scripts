#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>
#include <unistd.h>
// pthread_t idd[16];
// int a[16][100LL*1024*1024*1024/8/16];

// void thread(void) {
//     int i;
// 	for(i =0 ; i<16; i++) {
// 		if(pthread_equal(idd[i], pthread_self())){
// 			memset(a[i], 0, sizeof(a[i]));
// 			return;
// 		}

// 	}
// }


// int main() {
	
// 	int i;
// 	int ret;
// 	for(i =0 ; i<16; i++) {
// 		ret=pthread_create(&idd[i], NULL, (void  *) thread, NULL);
// 	}
// 	for(i =0 ; i<16; i++) {
// 		pthread_join(idd[i], NULL);
// 	}

// }






int a[50LL*1024*1024*1024/8];
int main() {
	memset(a, 0, sizeof(a));


}
