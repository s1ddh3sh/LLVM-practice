#include <stdio.h>

int sum_to_n(int n) {
    int sum = 0;
    for (int i = 0; i < n; i++) {
        sum += i;
    }
    return sum;
}

int main() {
    int result = sum_to_n(10);
    printf("%d\n", result);
    return 0;
}
