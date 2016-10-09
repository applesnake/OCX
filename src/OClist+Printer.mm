#import "OClist+Printer.hh"

@implementation OClist (Printer)
-(void) print{
	for(id obj : (*p)) {
		[obj print];
	};
};
-(void) printWithSeperator:(const char*)sp {
	for(id obj : (*p)) {
		if(obj){
			printf("%s%s", [obj UTF8String], sp);
		}else {
			printf("nil%s", sp);
		}
	}
	printf("\n");
};
@end
