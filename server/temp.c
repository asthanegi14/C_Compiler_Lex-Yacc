#include<stdio.h>
void insertion(int arr[],int n)
{
    for (int i = 1; i < n; i++)
    {
        int key=arr[i];
        int j=i-1;
        while(j>=0 && arr[j]>key)
        {
            arr[j+1]=arr[j];
            j=j-1;
        }
        arr[j+1]=key;
    }
}
void printarray(int arr[],int n)
{
    for (int i = 0; i < n; i++)
    {
        printf("%d ",arr[i]);
    }
}
int main()
{
    int arr[]={3,6,4,8,1,9};
    printarray(arr,6);
    printf("\nSorted array: ");
    insertion(arr,6);
    printarray(arr,6);   
    return 0;
}