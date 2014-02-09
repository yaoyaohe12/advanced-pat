#include<iostream>
#include<map>
#include<vector>
#include<string>
#include <algorithm>
#include<string.h>
using namespace std;

long long a,b,c;
int T;
int main(){
    //freopen("/Users/yyy/study/code/pat/in.txt","r",stdin);
    scanf("%d",&T);
    int i;
    bool ans;
    for(i=1;i<=T;i++) {
        scanf("%lld%lld%lld",&a,&b,&c);
        if (a+b>c) {
            ans = true;
        }
        else
        {
            ans = false;
        }
        if (a>0&b>0&a+b<=0) {
            ans = true;
        }
        else if (a<0&b<0&a+b>=0)
        {
            ans = false;
        }
        if (ans) {
            printf("Case #%d: true\n",i);
        }
        else{
            printf("Case #%d: false\n",i);
        }
    }
}
