#include<iostream>
#include<map>
#include<vector>
#include<string>
#include <algorithm>
#include<string.h>
using namespace std;

#define maxL 30

void init();
void change(char x[], char y[], bool &negY);
void add(char x[],char y[],char z[]);
void sub(char x[],char y[],char z[]);
void calc(char x[],char y[],bool negX,bool negY,char z[],bool &negZ);
bool com(char x[],char y[]);

int T;
char tmpA[30],tmpB[30],tmpC[30];
char a[30],b[30],c[30],res[30],ans[30],zero[30];
bool isNegA,isNegB,isNegC,isNegRes,isNegAns;
char tmp;


int main(){
    //freopen("/Users/yyy/study/code/pat/in.txt","r",stdin);
    scanf("%d",&T);
    int i;
    for(i=1;i<=T;i++) {
        scanf("%s%s%s",tmpA,tmpB,tmpC);
        init();
        change(tmpA, a, isNegA);
        change(tmpB, b, isNegB);
        change(tmpC, c, isNegC);
        
        calc(a, b, isNegA, isNegB, res, isNegRes);
        calc(res, c, isNegRes, !isNegC, ans, isNegAns);
        if (isNegAns && com(ans, zero)) {
            printf("Case #%d: true\n",i);
        }
        else{
            printf("Case #%d: false\n",i);
        }
    }
}
void init()
{
    memset(a, '0', maxL);
    memset(b, '0', maxL);
    memset(c, '0', maxL);
    memset(res, '0', maxL);
    memset(ans, '0', maxL);
    memset(zero, '0', maxL);
}
void change(char x[], char y[], bool &negY)
{
    int i,j;
    int len = strlen(x);
    negY = true;
    for (i=len-1,j=0; i>=0; i--,j++) {
        if (x[i] == '-') {
            negY = false;
            break;
        }
        y[j] = x[i];
    }
}
void calc(char x[],char y[],bool negX,bool negY,char z[],bool &negZ)
{
    if(negX == negY)
    {
        add(x,y,z);
        negZ = negX;
    }
    else{
        if (com(x, y)) {
            sub(x, y, z);
            negZ = negX;
        }
        else
        {
            sub(y, x, z);
            negZ = negY;
        }
    }
}
void add(char x[],char y[],char z[])
{
    int i,jw=0;
    int tmpSum;
    for (i=0;i<maxL;i++)
    {
        tmpSum = x[i] - '0' + y[i] - '0' + jw;
        jw = tmpSum/10;
        z[i] = tmpSum %10 + '0';
    }
}
void sub(char x[],char y[],char z[])
{
    int i,tw=0;
    int tmpRes;
    for (i=0;i<maxL;i++)
    {
        tmpRes = (x[i] - '0' - tw) - (y[i] - '0');
        if (tmpRes < 0) {
            tmpRes  += 10;
            tw -- ;
        }
        z[i] = tmpRes + '0';
    }
}
bool com(char x[],char y[])//比较绝对值大小 >
{
    int i;
    for (i=maxL-1;i>=0;i--)
    {
        if (x[i]>y[i]) {
            return true;
        }
    }
    return false;
}
