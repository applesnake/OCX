#import "OCXUT-OCdictionary-Basic.hh"
#import "OCstring.hh"
#import "OCarray.hh"
#include <stdarg.h>

@implementation OCXUT_OCdictionary_Basic
-(BOOL) OCXUT_dictWithObjectPairs:(id)k0, ...{
	@autoreleasepool{
		OCdictionary* ocd = [OCdictionary dictWithObjectPairs:S("KA"), S("VA"), S("KB"), S("VB"), S("KC"), S("VC"), nil];
		if( [(*(ocd.p))[S("KA")] equalTo:S("VA")] &&
				[(*(ocd.p))[S("KB")] equalTo:S("VB")] &&
				[(*(ocd.p))[S("KC")] equalTo:S("VC")]) {
			return YES;
		}
	}
	return NO;
};

-(BOOL) OCXUT_dictWithKeys:(OCarray*)kary
										values:(OCarray*)vary
											copy:(BOOL)yn
{
	@autoreleasepool{
		OCarray* a0 = [OCarray arrayWithObjectsNoCopy:S("A"), S("B"), S("C"), nil];
		OCarray* a1 = [OCarray arrayWithObjectsNoCopy:S("1"), S("2"), S("3"), nil];
		OCdictionary* ocd = [OCdictionary dictWithKeys:a0
																					values:a1
																						copy:NO];
		if( [(*(ocd.p))[S("A")] equalTo:S("1")] &&
				[(*(ocd.p))[S("B")] equalTo:S("2")] &&
				[(*(ocd.p))[S("C")] equalTo:S("3")]) {
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_dictWithOCdictionary:(OCdictionary*)d
{
	@autoreleasepool{
		OCdictionary* d0 = [OCdictionary dictWithObjectPairs:S("KA"), S("VA"), S("KB"), S("VB"), S("KC"), S("VC"), nil];
		OCdictionary* d1 = [OCdictionary dictWithOCdictionary:d0];
		if( [(*(d1.p))[S("KA")] equalTo:S("VA")] &&
				[(*(d1.p))[S("KB")] equalTo:S("VB")] &&
				[(*(d1.p))[S("KC")] equalTo:S("VC")]) {
			return YES;
		}
	}
	return NO;
};

-(BOOL) OCXUT_dictWithMap:(map<OCMKey,id>*)m{
	@autoreleasepool{
		OCdictionary* d0 = [OCdictionary dictWithObjectPairs:S("KA"), S("VA"), S("KB"), S("VB"), S("KC"), S("VC"), nil];
		OCdictionary* d1 = [OCdictionary dictWithMap:d0.p];
		if( [(*(d1.p))[S("KA")] equalTo:S("VA")] &&
				[(*(d1.p))[S("KB")] equalTo:S("VB")] &&
				[(*(d1.p))[S("KC")] equalTo:S("VC")]) {
			return YES;
		}
	}
	return NO;
};


-(BOOL) OCXUT_initWithObjectPairs:(id)k0, ...{
	@autoreleasepool{
		OCdictionary* d = [[OCdictionary alloc] initWithObjectPairs:S("A"), S("1"), S("B"), S("2"), S("C"), S("3"), nil];
		if( [(*(d.p))[S("A")] equalTo:S("1")] &&
				[(*(d.p))[S("B")] equalTo:S("2")] &&
				[(*(d.p))[S("C")] equalTo:S("3")]) {
			return YES;
		}
	}
	return NO;
};

-(BOOL) OCXUT_initWithKeys:(OCarray*)kary
										values:(OCarray*)vary{
	@autoreleasepool{
		OCarray* a0 = [OCarray arrayWithObjectsNoCopy:S("A"), S("B"), S("C"), nil];
		OCarray* a1 = [OCarray arrayWithObjectsNoCopy:S("1"), S("2"), S("3"), nil];
		OCdictionary* d = [[OCdictionary alloc] initWithKeys:a0
																									values:a1
																										copy:NO];
		if( [(*(d.p))[S("A")] equalTo:S("1")] &&
				[(*(d.p))[S("B")] equalTo:S("2")] &&
				[(*(d.p))[S("C")] equalTo:S("3")]) {
			return YES;
		}
	}
	return NO;
};

-(BOOL) OCXUT_initWithOCdictionary:(OCdictionary*)d{
	@autoreleasepool{
		OCdictionary* d0 = [OCdictionary dictWithObjectPairs:S("KA"), S("VA"), S("KB"), S("VB"), S("KC"), S("VC"), nil];
		OCdictionary* d1 = [[OCdictionary alloc] initWithOCdictionary:d0];
		if( [(*(d1.p))[S("KA")] equalTo:S("VA")] &&
				[(*(d1.p))[S("KB")] equalTo:S("VB")] &&
				[(*(d1.p))[S("KC")] equalTo:S("VC")]) {
			return YES;
		}
	}
	return NO;
	
};
-(BOOL) OCXUT_initWithMap:(map<OCMKey,id>*) OCXUT_m{
	@autoreleasepool{
		OCdictionary* d0 = [OCdictionary dictWithObjectPairs:S("KA"), S("VA"), S("KB"), S("VB"), S("KC"), S("VC"), nil];
		OCdictionary* d1 = [[OCdictionary alloc] initWithMap:d0.p];
		if( [(*(d1.p))[S("KA")] equalTo:S("VA")] &&
				[(*(d1.p))[S("KB")] equalTo:S("VB")] &&
				[(*(d1.p))[S("KC")] equalTo:S("VC")]) {
			return YES;
		}
	}
	return NO;
};

-(BOOL) OCXUT_keyCount{
	@autoreleasepool{
		OCdictionary* d0 = [OCdictionary dictWithObjectPairs:S("KA"), S("VA"), S("KB"), S("VB"), S("KC"), S("VC"), nil];
		if([d0 keyCount] == 3) {
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_keys{
	@autoreleasepool{
		OCdictionary* d0 = [OCdictionary dictWithObjectPairs:S("KA"), S("VA"), S("KB"), S("VB"), S("KC"), S("VC"), nil];
		OCarray* a = [d0 keys];
		int n = 0;
		for(id o : *(a.p)) {
			if([o equalToCstr:"KA"] ||
				 [o equalToCstr:"KB"] ||
				 [o equalToCstr:"KC"]) {
				n += 1;
			}
		}
		if(n == 3) {
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_values{
	@autoreleasepool{
		OCdictionary* d0 = [OCdictionary dictWithObjectPairs:S("KA"), S("VA"), S("KB"), S("VB"), S("KC"), S("VC"), nil];
		OCarray* a = [d0 values];
		int n = 0;
		for(id o : *(a.p)) {
			if( [o equalToCstr:"VA"] ||
					[o equalToCstr:"VB"] ||
					[o equalToCstr:"VC"] ) {
				n += 1;
			}
		}
		if(n == 3) return YES;
		return NO;
	}
	return NO;
};
-(BOOL)		OCXUT_valueForKey:(id)key{
	@autoreleasepool{
		OCdictionary* d0 = [OCdictionary dictWithObjectPairs:S("KA"), S("VA"), S("KB"), S("VB"), S("KC"), S("VC"), nil];
		OCstring* v = [d0 valueForKey:S("KA")];
		if([v equalToCstr:"VA"]) {
			return YES;
		}
	}
	return NO;
};
-(BOOL)	OCXUT_removeValueForKey:(id)key{
	@autoreleasepool{
		OCdictionary* d0 = [OCdictionary dictWithObjectPairs:S("KA"), S("VA"), S("KB"), S("VB"), S("KC"), S("VC"), nil];
		[d0 removeValueForKey:S("KA")];
		if([d0 valueForKey:S("KA")] == nil) {
			return YES;
		}
	}
	return NO;
};
-(BOOL)		OCXUT_keyForValue:(id)value{
	@autoreleasepool{
		OCdictionary* d0 = [OCdictionary dictWithObjectPairs:S("KA"), S("VA"), S("KB"), S("VB"), S("KC"), S("VC"), nil];
		OCarray* a = [d0 keyForValue:S("VA")];
		for(OCstring* s : *(a.p)) {
			if([s equalToCstr:"KA"]) {
				return YES;
			}
		}
	}
	return NO;
};
-(BOOL) OCXUT_clearAll{
	@autoreleasepool{
		OCdictionary* d0 = [OCdictionary dictWithObjectPairs:S("KA"), S("VA"), S("KB"), S("VB"), S("KC"), S("VC"), nil];
		[d0 clearAll];
		if([d0 keyCount] == 0) {
			return YES;
		}
	};
	return NO;
};

-(BOOL) OCXUT_each_pair:(void(^)(id k, id v))cb{
	@autoreleasepool{
		__block int n = 0;
		OCdictionary* d0 = [OCdictionary dictWithObjectPairs:S("KA"), S("VA"), S("KB"), S("VB"), S("KC"), S("VC"), nil];
		[d0 each_pair:^(id k, id v) {
				if( ([k equalToCstr:"KA"] && [v equalToCstr:"VA"]) ||
						([k equalToCstr:"KB"] && [v equalToCstr:"VB"]) ||
						([k equalToCstr:"KC"] && [v equalToCstr:"VC"])) {
					n += 1;
				};
			}];
		if(n == 3) return YES;
	}
	return NO;
};
@end

