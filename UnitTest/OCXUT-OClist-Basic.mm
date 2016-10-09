#import "OCXUT-OClist-Basic.hh"
#import "OCarray.hh"
#import "OCstring.hh"
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-method-access"

@implementation OCXUT_OClist_Basic
-(BOOL) OCXUT_initWithObjects:(BOOL)o, ...{
	@autoreleasepool{
		OClist* ocl = [[OClist alloc] initWithObjects:S("A"), S("B"), S("C"), nil];
		int n = 0;
		for(OCstring* o : *(ocl.p)) {
			if(*(o.p) == "A") n += 1;
			if(*(o.p) == "B") n += 1;
			if(*(o.p) == "C") n += 1;
		}
		if(n == 3) return YES;
		return NO;
	}
};
-(BOOL) OCXUT_initWithOClist:(OClist*)ocl{
	@autoreleasepool{
		OClist* ocl = [[OClist alloc] initWithObjects:S("A"), S("B"), S("C"), nil];
		OClist* ocl2 = [[OClist alloc] initWithOClist:ocl];
		int n = 0;
		for(OCstring* o : *(ocl2.p)) {
			if(*(o.p) == "A") n += 1;
			if(*(o.p) == "B") n += 1;
			if(*(o.p) == "C") n += 1;
		}
		if(n == 3) return YES;
		return NO;
	}
};
-(BOOL) OCXUT_initWithOCarray:(OCarray*)oca{
	@autoreleasepool{
		OCarray* a = [[OCarray alloc] initWithObjects:S("A"), S("B"), S("C"), nil];
		OClist* ocl = [[OClist alloc] initWithOCarray:a];
		int n = 0;
		for(OCstring* o : *(ocl.p)) {
			if(*(o.p) == "A") n += 1;
			if(*(o.p) == "B") n += 1;
			if(*(o.p) == "C") n += 1;
		}
		if(n == 3) return YES;
		return NO;
	}
};
-(BOOL) OCXUT_initWithStdList:(const std::list<id>*)l{
	@autoreleasepool{
		std::list<id> ll = {S("A"), S("B"), S("C")};
		OClist* ocl = [[OClist alloc] initWithStdList:&ll];
		int n = 0;
		for(OCstring* o : *(ocl.p)) {
			if(*(o.p) == "A") n += 1;
			if(*(o.p) == "B") n += 1;
			if(*(o.p) == "C") n += 1;
		}
		if(n == 3) return YES;
		return NO;
	}
};
-(BOOL) OCXUT_initWithObjectsNoCopy:(BOOL)o, ...{
	@autoreleasepool{
		OClist* ocl = [[OClist alloc] initWithObjectsNoCopy:S("A"), S("B"), S("C"), nil];
		int n = 0;
		for(OCstring* o : *(ocl.p)) {
			if(*(o.p) == "A") n += 1;
			if(*(o.p) == "B") n += 1;
			if(*(o.p) == "C") n += 1;
		}
		if(n == 3) return YES;
		return NO;
	}
};
-(BOOL) OCXUT_initWithOClistNoCopy:(OClist*)ocl{
	@autoreleasepool{
		OClist* ocl2 = [[OClist alloc] initWithObjectsNoCopy:S("A"), S("B"), S("C"), nil];
		int n = 0;
		OClist* ocl =[[OClist alloc] initWithOClistNoCopy:ocl2];
		for(OCstring* o : *(ocl.p)) {
			if(*(o.p) == "A") n += 1;
			if(*(o.p) == "B") n += 1;
			if(*(o.p) == "C") n += 1;
		}
		if(n == 3) return YES;
		return NO;
	};
};
-(BOOL) OCXUT_initWithOCarrayNoCopy:(OCarray*)oca{
	@autoreleasepool{
		OCarray* a = [[OCarray alloc] initWithObjectsNoCopy:S("A"), S("B"), S("C"), nil];
		OClist* ocl = [[OClist alloc] initWithOCarrayNoCopy:a];
		int n = 0;
		for(OCstring* o : *(ocl.p)) {
			if(*(o.p) == "A") n += 1;
			if(*(o.p) == "B") n += 1;
			if(*(o.p) == "C") n += 1;
		}
		if(n == 3) return YES;
		return NO;
	}
};
-(BOOL) OCXUT_initWithStdListNoCopy:(const std::list<id>*)l{
	@autoreleasepool{
		std::list<id> ll = {S("A"), S("B"), S("C")};
		OClist* ocl = [[OClist alloc] initWithStdListNoCopy:&ll];
		int n = 0;
		for(OCstring* o : *(ocl.p)) {
			if(*(o.p) == "A") n += 1;
			if(*(o.p) == "B") n += 1;
			if(*(o.p) == "C") n += 1;
		}
		if(n == 3) return YES;
		return NO;
	}
};

-(BOOL) OCXUT_listWithObjects:(BOOL)o,...{
	@autoreleasepool{
		OClist* ocl = [OClist listWithObjects:S("A"), S("B"), S("C"), nil];
		int n = 0;
		for(OCstring* o : *(ocl.p)) {
			if(*(o.p) == "A") n += 1;
			if(*(o.p) == "B") n += 1;
			if(*(o.p) == "C") n += 1;
		}
		if(n == 3) return YES;
		return NO;
	}
};
-(BOOL) OCXUT_listWithOClist:(OClist*)ocl{
	@autoreleasepool{
		OClist* ocl2 = [OClist listWithObjects:S("A"), S("B"), S("C"), nil];
		OClist* ocl = [OClist listWithOClist:ocl2];
		int n = 0;
		for(OCstring* o : *(ocl.p)) {
			if(*(o.p) == "A") n += 1;
			if(*(o.p) == "B") n += 1;
			if(*(o.p) == "C") n += 1;
		}
		if(n == 3) return YES;
		return NO;
	}
};
-(BOOL) OCXUT_listWithOCarray:(OCarray*)oca{
	@autoreleasepool{
		OCarray* a = [OCarray arrayWithObjects:S("A"), S("B"), S("C"), nil];
		OClist* ocl = [OClist listWithOCarray:a];
		int n = 0;
		for(OCstring* o : *(ocl.p)) {
			if(*(o.p) == "A") n += 1;
			if(*(o.p) == "B") n += 1;
			if(*(o.p) == "C") n += 1;
		}
		if(n == 3) return YES;
		return NO;
	}
};
-(BOOL) OCXUT_listWithStdList:(const std::list<id>*)l{
	@autoreleasepool{
		std::list<id> ll = {S("A"), S("B"), S("C")};
		OClist* ocl = [OClist listWithStdList:&ll];
		int n = 0;
		for(OCstring* o : *(ocl.p)) {
			if(*(o.p) == "A") n += 1;
			if(*(o.p) == "B") n += 1;
			if(*(o.p) == "C") n += 1;
		}
		if(n == 3) return YES;
		return NO;
	}
};

-(BOOL) OCXUT_listWithObjectsNoCopy:(BOOL)o,...{
	@autoreleasepool{
		OClist* ocl = [OClist listWithObjectsNoCopy:S("A"),S("B"), S("C"), nil];
		int n = 0;
		for(OCstring* o : *(ocl.p)) {
			if(*(o.p) == "A") n += 1;
			if(*(o.p) == "B") n += 1;
			if(*(o.p) == "C") n += 1;
		}
		if(n == 3) return YES;
		return NO;
	}
};
-(BOOL) OCXUT_listWithOClistNoCopy:(OClist*)ocl{
	@autoreleasepool{
		OClist* ocl2 = [OClist listWithObjectsNoCopy:S("A"), S("B"), S("C"), nil];
		OClist* ocl = [OClist listWithOClistNoCopy:ocl2];
		int n = 0;
		for(OCstring* o : *(ocl.p)) {
			if(*(o.p) == "A") n += 1;
			if(*(o.p) == "B") n += 1;
			if(*(o.p) == "C") n += 1;
		}
		if(n == 3) return YES;
		return NO;
	}
};
-(BOOL) OCXUT_listWithOCarrayNoCopy:(OCarray*)oca{
	@autoreleasepool{
		OCarray* a = [OCarray arrayWithObjectsNoCopy:S("A"), S("B"), S("C"), nil];
		OClist* ocl = [OClist listWithOCarrayNoCopy:a];
		int n = 0;
		for(OCstring* o : *(ocl.p)) {
			if(*(o.p) == "A") n += 1;
			if(*(o.p) == "B") n += 1;
			if(*(o.p) == "C") n += 1;
		}
		if(n == 3) return YES;
		return NO;
	}
};
-(BOOL) OCXUT_listWithStdListNoCopy:(const std::list<id>*)l{
	@autoreleasepool{
		std::list<id> ll = {S("A"), S("B"), S("C")};
		OClist* ocl = [OClist listWithStdListNoCopy:&ll];
		int n = 0;
		for(OCstring* o : *(ocl.p)) {
			if(*(o.p) == "A") n += 1;
			if(*(o.p) == "B") n += 1;
			if(*(o.p) == "C") n += 1;
		}
		if(n == 3) return YES;
		return NO;
	}
};

-(BOOL) OCXUT_length{
	@autoreleasepool{
		OClist* ocl = [OClist listWithObjectsNoCopy:S("A"), S("B"), S("C"),nil];
		if([ocl length] == 3)  {
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_headObject{
	@autoreleasepool{
		OClist* ocl = [OClist listWithObjectsNoCopy:S("A"), S("B"), S("C"),nil];
		OCstring* ocs = [ocl headObject];
		if((*(ocs.p)) == "A"){
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_tailObject{
	@autoreleasepool{
		OClist* ocl = [OClist listWithObjectsNoCopy:S("A"), S("B"), S("C"),nil];
		OCstring* ocs = [ocl tailObject];
		if((*(ocs.p)) == "C"){
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_popHead{
	@autoreleasepool{
		OClist* ocl = [OClist listWithObjectsNoCopy:S("A"), S("B"), S("C"),nil];
		[ocl popHead];
		OCstring* ocs = [ocl headObject];
		if((*(ocs.p)) == "B"){
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_popTail{
	@autoreleasepool{
		OClist* ocl = [OClist listWithObjectsNoCopy:S("A"), S("B"), S("C"),nil];
		[ocl popTail];
		OCstring* ocs = [ocl tailObject];
		if((*(ocs.p)) == "B"){
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_pushHead:(id)o,...{
	@autoreleasepool{
		OClist* ocl = [[OClist alloc] init];
		[ocl pushHead:S("A"), S("B"), S("C"), nil];
		if([[ocl objectAtIndex:0] equalToCstr:"C"] &&
			 [[ocl objectAtIndex:1] equalToCstr:"B"] &&
			 [[ocl objectAtIndex:2] equalToCstr:"A"] ) {
			return YES;
		}else {
			return NO;
		}
	}
};
-(BOOL) OCXUT_pushBack:(id)o,...{
	@autoreleasepool{
		OClist* ocl = [[OClist alloc] init];
		[ocl pushBack:S("A"), S("B"), S("C"), nil];
		if([[ocl objectAtIndex:2] equalToCstr:"C"] &&
			 [[ocl objectAtIndex:1] equalToCstr:"B"] &&
			 [[ocl objectAtIndex:0] equalToCstr:"A"] ) {
			return YES;
		}else {
			return NO;
		}
	}
};
-(BOOL) OCXUT_insertObject:(id)o
								afterIndex:(size_t)idx{
	@autoreleasepool{
		OClist* ocl = [OClist listWithObjectsNoCopy:S("A"),S("B"), S("C"), nil];
		[ocl insertObject:S("D")
					 afterIndex:0];
		if([[ocl objectAtIndex:1] equalToCstr:"D"]) {
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_insertObject:(id)o
							 beforeIndex:(size_t)idx{
	@autoreleasepool{
		OClist* ocl = [OClist listWithObjectsNoCopy:S("A"),S("B"), S("C"), nil];
		[ocl insertObject:S("D")
					beforeIndex:0];
		if([[ocl objectAtIndex:0] equalToCstr:"D"]) {
			return YES;
		}
		return NO;
	}
};

-(BOOL)	OCXUT_removeObjectAtIndex:(size_t)idx{
	@autoreleasepool{
		OClist* ocl = [OClist listWithObjectsNoCopy:S("A"), S("B"), S("C"), nil];
		[ocl removeObjectAtIndex:0];
		if([[ocl headObject] equalToCstr:"B"]) {
			return YES;
		}
		return NO;
	}
};
-(BOOL) OCXUT_removeObjectFromIndex:(size_t)b
													withRange:(size_t)r{
	@autoreleasepool{
		OClist* ocl = [OClist listWithObjectsNoCopy:S("A"), S("B"), S("C"), nil];
		[ocl removeObjectFromIndex:1
										 withRange:2];
		if( ([ocl length] == 1) &&
				([[ocl headObject] equalToCstr:"A"]) ) {
			return YES;
		}
		return NO;
	};
};
-(BOOL) OCXUT_removeObjectBeforeIndex:(size_t)b
													 afterIndex:(size_t)e{
	@autoreleasepool{
		OClist* ocl = [OClist listWithObjectsNoCopy:S("A"), S("B"), S("C"), S("D"), S("E"), S("F"),nil];
		[ocl removeObjectBeforeIndex:1
											afterIndex:4];
		if( ([ocl length] == 4) ) {
			if( [[ocl objectAtIndex:0] equalToCstr:"B"] &&
					[[ocl objectAtIndex:1] equalToCstr:"C"] &&
					[[ocl objectAtIndex:2] equalToCstr:"D"] &&
					[[ocl objectAtIndex:3] equalToCstr:"E"] ) {
				return YES;
			}
		}
		return NO;
	}
};
-(BOOL) OCXUT_trimBeforeIndex:(size_t)i{
	@autoreleasepool{
		OClist* ocl = [OClist listWithObjectsNoCopy:S("A"), S("B"), S("C"), S("D"), S("E"), S("F"),nil];
		[ocl trimBeforeIndex:3];
		if([ocl length] == 3) {
			if([[ocl objectAtIndex:0] equalToCstr:"D"] &&
				 [[ocl objectAtIndex:1] equalToCstr:"E"] &&
				 [[ocl objectAtIndex:2] equalToCstr:"F"] ) {
				return YES;
			}
		}
		return NO;
	}
};
-(BOOL) OCXUT_trimAfterIndex:(size_t)i{
	@autoreleasepool{
		OClist* ocl = [OClist listWithObjectsNoCopy:S("A"), S("B"), S("C"), S("D"), S("E"), S("F"),nil];
		[ocl trimAfterIndex:2];
		if([ocl length] == 3) {
			if([[ocl objectAtIndex:0] equalToCstr:"A"] &&
				 [[ocl objectAtIndex:1] equalToCstr:"B"] &&
				 [[ocl objectAtIndex:2] equalToCstr:"C"] ) {
				return YES;
			}
		}
		return NO;
	}
};

-(BOOL)	OCXUT_indexOfObject:(id)o{
	@autoreleasepool{
		OClist* ocl = [OClist listWithObjectsNoCopy:S("A"), S("B"), S("C"), S("D"), S("E"), S("F"),nil];
		if([ocl indexOfObject:S("A")] == 0 &&
			 [ocl indexOfObject:S("F")] == 5) {
			return YES;
		}
		return NO;
	}
};
-(BOOL)		OCXUT_objectAtIndex:(size_t)idx{
	@autoreleasepool{
		OClist* ocl = [OClist listWithObjectsNoCopy:S("A"), S("B"), S("C"), S("D"), S("E"), S("F"),nil];
		id o0 = [ocl objectAtIndex:0];
		id o1 = [ocl objectAtIndex:5];
		if([o0 equalToCstr:"A"] &&
			 [o1 equalToCstr:"F"] ) {
			return YES;
		}
		return NO;
	}	
};
-(BOOL) OCXUT_setObject:(id)o
								atIndex:(size_t)idx{
	@autoreleasepool{
		OClist* ocl = [OClist listWithObjectsNoCopy:S("A"), S("B"), S("C"), S("D"), S("E"), S("F"),nil];
		[ocl setObject:S("X")
					 atIndex:5];
		if([[ocl objectAtIndex:5] equalToCstr:"X"]) {
			return YES;
		}
		return NO;
	}	
};
-(BOOL) OCXUT_removeAllObjects{
	@autoreleasepool{
		OClist* ocl = [OClist listWithObjectsNoCopy:S("A"), S("B"), S("C"), S("D"), S("E"), S("F"),nil];
		[ocl removeAllObjects];
		if([ocl length] == 0) {
			return YES;
		}
		return NO;
	}	
};
@end
#pragma clang diagnostic pop
