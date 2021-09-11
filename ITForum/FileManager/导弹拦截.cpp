#include<iostream>
#include<algorithm>
using namespace std;

int hight[1001] = {0};  //导弹高度
int dpstr[1001];  //一套系统拦截最多的导弹数（最长递减子串）
int dpnum[1001];  //需要配备的系统数（最长递增子串）

int main()
{
    int len = 0;    //导弹数
    while(cin>>hight[++len])
    {
        dpstr[len] = 1;         //全为递增时，最多拦截数为1
        dpnum[len] = 1;         //全为递减时，只需要一套系统
        if(cin.get()=='\n') break;
    }
    for(int i=1;i<=len;i++)
    {
        for(int j=1;j<i;j++)
        {
            if(hight[j]>=hight[i]){
                dpstr[i] = max(dpstr[i], dpstr[j]+1);
            }else{
                dpnum[i] = max(dpnum[i], dpnum[j]+1);
            }
        }
    }
    int max_dpstr = 0;
    int max_dpnum = 0;
    for(int i=1;i<=len;i++)
    {
        max_dpstr = max(max_dpstr, dpstr[i]);
        max_dpnum = max(max_dpnum, dpnum[i]);
    }
    cout << max_dpstr << endl << max_dpnum <<endl;
    return 0;
}
