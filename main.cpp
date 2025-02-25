#include <iostream>
#include <limits> // For numeric_limits
using namespace std;

void printArray(int arr[], int size) {
    for (int i = 0; i < size; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;
}

void bubbleSort(int arr[], int size) {
    for (int i = 0; i < size - 1; i++) {
        for (int j = 0; j < size - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                swap(arr[j], arr[j + 1]);
            }
        }
    }
}

int main() {
    int n;
    cout << "Enter the number of elements (max 10): ";
    cin >> n;

    // Check if n is within the allowed range
    while (n < 1 || n > 10) {
        cout << "Invalid input. Please enter a number between 1 and 10: ";
        cin >> n;
    }

    int arr[n];
    cout << "Enter " << n << " integers (between -100 and 100):" << endl;

    for (int i = 0; i < n; i++) {
        while (!(cin >> arr[i]) || arr[i] < -100 || arr[i] > 100) {
            cin.clear(); // Clear the error flag
            cin.ignore(numeric_limits<streamsize>::max(), '\n'); // Discard invalid input
            cout << "Invalid input. Please enter an integer between -100 and 100: ";
        }
    }

    cout << "Original array: ";
    printArray(arr, n);

    bubbleSort(arr, n);

    cout << "Sorted array: ";
    printArray(arr, n);

    return 0;
}
