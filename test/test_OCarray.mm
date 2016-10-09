#include "OCarray+Printer.hh"
#include "OCstring+Printer.hh"

int main(int argc, char* argv[])
{
	OCstring* s0 = [[OCstring stringWithCString:"Text Line - 0"] retain];
	OCstring* s1 = [[OCstring stringWithCString:"Text Line - 1"] retain];
	OCstring* s2 = [[OCstring stringWithCString:"Text Line - 2"] retain];
	{
		OCarray* a = [[OCarray arrayWithObjects:s0,s1,s2,nil] retain];
		[a print];
		printf("Length: %d\n", [a length]);
		[a push:[OCstring stringWithCString:"Push New Line - 0"],nil];
		printf("Length: %d\n", [a length]);
		printf("%s\n", [[a objectAtIndex:3] UTF8String]);
		[a setObject:[OCstring stringWithCString:"Replace String here"]
				 atIndex:3];
		[a print];
		printf("%d\n", [a indexOfObject:s2]);
		[a forward_each:^(id obj) {
				printf("Content '%s'\n", [obj UTF8String]);
			}];
		[a backward_each:^(id obj) {
				printf("Content '%s'\n", [obj UTF8String]);
			}];
		[a removeAllObjects];
	}
};
