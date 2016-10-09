#import "OCdictionary+Printer.hh"
#import "OCstring+Printer.hh"
#import "OCarray+Printer.hh"

int main(int argc, char* argv[]) {
	@autoreleasepool{
		{
			OCdictionary* od = [[[OCdictionary alloc] init] retain];
			[od initWithObjectPairs:
						[OCstring stringWithCString:"Key-ABC"],
					[OCstring stringWithCString:"Value-012"],
					nil,nil];
			[od print];
			printf("%d\n", [od keyCount]);
			[[od keys] print];
			[[od values] print];

			[[od valueForKey:[OCstring stringWithCString:"Key-ABC"]] print];
			[[od keyForValue:[OCstring stringWithCString:"Value-012"]] print];
			[od each_pair:^(id k, id v) {
					printf("Key: %s Value: %s\n", [k UTF8String], [v UTF8String]);
				}];
			[od clearAll];
			printf("%d\n", [od keyCount]);
		}
	}
	return 0;
};
