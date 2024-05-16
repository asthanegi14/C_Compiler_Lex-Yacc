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
    // int arr[]={3,6,4,8,1,9};
    int n;

    printf("Enter the number of elements in the array: \n");
    scanf("%d", &n);
    int arr[n];

    printf("Enter the elements of the array: \n");
    for (int i = 0; i < n; i++) {
        scanf("%d", &arr[i]);
    }

    printarray(arr,n);
    printf("\nSorted array: ");
    insertion(arr,n);
    printarray(arr,n);   
    return 0;
}