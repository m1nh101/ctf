#include <stdio.h>

char to_lower(char c) {
    return c + 32;
}

int main(int argc, const char * argv[]) {
    char random_string[] = "thIsIsName";
    for (int i = 0; i < 10; i++) {
        char c = random_string[i];
        if(c >= 'A' && c <= 'Z') {
            random_string[i] = to_lower(c);
        }
    }
    
    printf("%s\n", random_string);
    
    return 0;
}
