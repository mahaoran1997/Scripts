#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <cstring>
#include <ctime>
using namespace std;


#define N 100000000


/*

4KB page = 512 long long integer
cache line 64B = 8 long long integer


512 pages in one pagetable
*/

long long a[N];
int page_n = N/512;
int pagetable_n = page_n/512;

void initialize() {
    for (int i = 0 ; i < N; i ++) {
        a[i] = i;
    }
}

int main() {
    initialize();
    int st_time = clock();
    
    int cnt = 0;
    int pt = 1;
    for(int p = 0; cnt < 10*N; p++, cnt++){
        int offset = rand() % 512;
        int id = p % page_n * 512 + offset;
        a[id] += 1;
    }
    int ed_time = clock();
    cout << ed_time - st_time <<endl;
    freopen("out.txt", "w", stdout);
    for(int i = 0; i < N; i ++)
        printf("%d ", a[i]);
    fclose(stdout);
}