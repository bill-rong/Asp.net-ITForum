#include<stdio.h>
main()
{
	int n;     //����nΪ������ 
	double t=1,sum=0;//tΪÿ�����Ӷ��ڵ���������sumΪ�ܺ͡� 
 
	for(n=1;n<=64;n++)
	{
	sum=sum+t;
	t = t * 2;
	}
	
	printf("������Ҫ%e�����ӣ���%e������\n",sum,sum/1.42e8);
	return 0;
 } 
