#include<iostream>
#include<algorithm>
using namespace std;

int hight[1001] = {0};  //�����߶�
int dpstr[1001];  //һ��ϵͳ�������ĵ���������ݼ��Ӵ���
int dpnum[1001];  //��Ҫ�䱸��ϵͳ����������Ӵ���

int main()
{
    int len = 0;    //������
    while(cin>>hight[++len])
    {
        dpstr[len] = 1;         //ȫΪ����ʱ�����������Ϊ1
        dpnum[len] = 1;         //ȫΪ�ݼ�ʱ��ֻ��Ҫһ��ϵͳ
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
