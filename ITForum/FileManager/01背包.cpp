#include<bits/stdc++.h>
using namespace std;

int dp[201][5001];

int main()
{
	int n, m;
	int arr[201][2];
	cin >> n >> m;
	for(int i=1; i<=n; i++)
	{
		cin >> arr[i][0] >> arr[i][1];
	}
	for(int i=1; i<=n; i++)
	{
		for(int j=1; j<=m; j++)
		{
			int a = dp[i-1][j];
			int b = dp[i-1][j-arr[i][0]] + arr[i][1];
			if(j < arr[i][0])	dp[i][j] = a;
			else	dp[i][j] = max(a, b);
		}
	}
	
	cout << dp[n][m] << endl;
	
	return 0;
}
