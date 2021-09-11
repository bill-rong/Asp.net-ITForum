#include<stdio.h>
main()
{
	int n;     //设置n为格子数 
	double t=1,sum=0;//t为每个格子对于的麦子数，sum为总和。 
 
	for(n=1;n<=64;n++)
	{
	sum=sum+t;
	t = t * 2;
	}
	
	printf("放满需要%e粒麦子，共%e立方米\n",sum,sum/1.42e8);
	return 0;
 } 
