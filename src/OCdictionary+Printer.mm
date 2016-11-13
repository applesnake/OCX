#import "OCdictionary+Printer.hh"
#import "OCstring.hh"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-method-access"

@implementation OCdictionary(Printer)
-(void) print {
	for(auto& pp : (*p)) {
		OCstring* k = pp.first.kobj;
		OCstring* v = pp.second;
		printf("%s -> %s\n", [k UTF8String], [v UTF8String]);
	};
};
@end
#pragma clang diagnostic pop
