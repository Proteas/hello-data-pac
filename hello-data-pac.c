#include <stdio.h>
#include <stdlib.h>

typedef struct _One {
	int a;
} One;

typedef struct _Two {
	int b;
	One *one;
} Two;

int main(int argc, char **argv)
{
	// One
    One *ptrOne = (One *)malloc(sizeof(One));
	ptrOne->a = 1;
	
	// Two
	Two *ptrTwo = (Two *)malloc(sizeof(Two));
	ptrTwo->b = 2;
	ptrTwo->one = ptrauth_sign_unauthenticated(ptrOne, ptrauth_key_process_independent_data, ptrauth_string_discriminator("one"));
	
	// print: a
	printf("[+] one, a: %d\n", ptrOne->a);
	
	// print: b
	One *authedOne = ptrauth_auth_data(ptrTwo->one, ptrauth_key_process_independent_data, ptrauth_string_discriminator("one"));
	printf("[+] two, b: %d, a: %d\n", ptrTwo->b, authedOne->a);
	
	free(ptrTwo); ptrTwo = NULL;
	free(ptrOne); ptrOne = NULL;

    return 0;
}
