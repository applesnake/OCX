#import "OCXUT-OCarray-Basic.hh"
#import "OCstring.hh"
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-method-access"

@implementation OCXUT_OCarray_Basic
-(BOOL) OCXUT_initWithObjects:(id)o, ...{
	@autoreleasepool{
		OCarray* a = [[OCarray alloc] initWithObjects:S("A"), S("B"), S("C"),S("D"), nil];
		if( ([a length] == 4) &&
				[[a objectAtIndex:0] equalToCstr:"A"] &&
				[[a objectAtIndex:1] equalToCstr:"B"] &&
				[[a objectAtIndex:2] equalToCstr:"C"] &&
				[[a objectAtIndex:3] equalToCstr:"D"]) {
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_initWithOCarray:(OCarray*)oca{
	@autoreleasepool{
		OCarray* b = [[OCarray alloc] initWithObjects:S("A"), S("B"), S("C"),S("D"), nil];
		OCarray* a = [[OCarray alloc] initWithOCarray:b];
		if( ([a length] == 4) &&
				[[a objectAtIndex:0] equalToCstr:"A"] &&
				[[a objectAtIndex:1] equalToCstr:"B"] &&
				[[a objectAtIndex:2] equalToCstr:"C"] &&
				[[a objectAtIndex:3] equalToCstr:"D"]) {
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_initWithStdVector:(const std::vector<id>*)v{
	@autoreleasepool{
		std::vector<id> v = {
			S("A"), S("B"), S("C"), S("D")
		};
		OCarray* a = [[OCarray alloc] initWithStdVector:&v];
		if( ([a length] == 4) &&
				[[a objectAtIndex:0] equalToCstr:"A"] &&
				[[a objectAtIndex:1] equalToCstr:"B"] &&
				[[a objectAtIndex:2] equalToCstr:"C"] &&
				[[a objectAtIndex:3] equalToCstr:"D"]) {
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_initWithObjectsNoCopy:(id)o, ...{
	@autoreleasepool{
		OCstring* ocs[] = {
			S("A"), S("B"), S("C"), S("D")
		};
		OCarray* a = [[OCarray alloc] initWithObjectsNoCopy:ocs[0], ocs[1], ocs[2], ocs[3], nil];
		if( ([a length] == 4) &&
				[[a objectAtIndex:0] equalToCstr:"A"] &&
				[[a objectAtIndex:1] equalToCstr:"B"] &&
				[[a objectAtIndex:2] equalToCstr:"C"] &&
				[[a objectAtIndex:3] equalToCstr:"D"]) {
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_initWithOCarrayNoCopy:(OCarray*)oca{
	@autoreleasepool{
		OCarray* b = [[OCarray alloc] initWithObjects:S("A"),S("B"),S("C"),S("D"),nil];
		OCarray* a = [[OCarray alloc] initWithOCarrayNoCopy:b];
		
		if( ([a length] == 4) &&
				[[a objectAtIndex:0] equalToCstr:"A"] &&
				[[a objectAtIndex:1] equalToCstr:"B"] &&
				[[a objectAtIndex:2] equalToCstr:"C"] &&
				[[a objectAtIndex:3] equalToCstr:"D"]) {
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_initWithStdVectorNoCopy:(const std::vector<id>*)v{
	@autoreleasepool{
		std::vector<id> v = {
			S("A"), S("B"), S("C"), S("D")
		};
		OCarray* a = [[OCarray alloc] initWithStdVectorNoCopy:&v];
		if( ([a length] == 4) &&
				[[a objectAtIndex:0] equalToCstr:"A"] &&
				[[a objectAtIndex:1] equalToCstr:"B"] &&
				[[a objectAtIndex:2] equalToCstr:"C"] &&
				[[a objectAtIndex:3] equalToCstr:"D"]) {
			return YES;
		}
	}
	return NO;
};

-(BOOL) OCXUT_arrayWithObjects:(id)o, ...{
	@autoreleasepool{
		OCstring* b[] = {
			S("A"), S("B"), S("C"), S("D")};
		OCarray* a = [OCarray arrayWithObjects:b[0],b[1],b[2],b[3],nil];
		if( ([a length] == 4) &&
				[[a objectAtIndex:0] equalToCstr:"A"] &&
				[[a objectAtIndex:1] equalToCstr:"B"] &&
				[[a objectAtIndex:2] equalToCstr:"C"] &&
				[[a objectAtIndex:3] equalToCstr:"D"]) {
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_arrayWithOCarray:(OCarray*)oca{
	@autoreleasepool{
		OCarray* b = [[OCarray alloc] initWithObjects:	S("A"), S("B"), S("C"), S("D"), nil];
		OCarray* a = [OCarray arrayWithOCarray:b];
		if( ([a length] == 4) &&
				[[a objectAtIndex:0] equalToCstr:"A"] &&
				[[a objectAtIndex:1] equalToCstr:"B"] &&
				[[a objectAtIndex:2] equalToCstr:"C"] &&
				[[a objectAtIndex:3] equalToCstr:"D"]) {
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_arrayWithStdVector:(const std::vector<id>*)v{
	@autoreleasepool{
		std::vector<id> v = {
			S("A"), S("B"), S("C"), S("D")
		};
		OCarray* a = [OCarray arrayWithStdVector:&v];
		if( ([a length] == 4) &&
				[[a objectAtIndex:0] equalToCstr:"A"] &&
				[[a objectAtIndex:1] equalToCstr:"B"] &&
				[[a objectAtIndex:2] equalToCstr:"C"] &&
				[[a objectAtIndex:3] equalToCstr:"D"]) {
			return YES;
		}
	}
	return NO;
};

-(BOOL) OCXUT_length{
	@autoreleasepool{
		OCarray* a = [[OCarray alloc] initWithObjects:S("A"), S("B"), S("C"), S("D"),nil];
		if([a length] == 4){
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_pop{
	@autoreleasepool{
		OCarray* a = [[OCarray alloc] initWithObjects:S("A"), S("B"), S("C"), S("D"),nil];
		BOOL t0 = [[a objectAtIndex:3] equalToCstr:"D"];
		[a pop];
		BOOL t1 = [[a objectAtIndex:2] equalToCstr:"C"];
		if(([a length] == 3) and t1 and t0) {
			return YES;
		}
		return NO;
	}
}; // Tail ONLY
-(BOOL) OCXUT_push:(id)o,...{// Tail ONLY
	@autoreleasepool{
		OCarray* a = [[OCarray alloc] initWithObjects:S("A"), S("B"), S("C"), S("D"),nil];
		BOOL t0 = [[a objectAtIndex:3] equalToCstr:"D"];
		[a push:S("E"), S("F"), nil];
		BOOL t1 = [[a objectAtIndex:4] equalToCstr:"E"] && [[a objectAtIndex:5] equalToCstr:"F"];
		if(([a length] == 6) and t1 and t0) {
			return YES;
		}
		return NO;
	}
}; 
-(BOOL) OCXUT_resize:(size_t)new_size{
	@autoreleasepool{
		OCarray* a = [[OCarray alloc] initWithObjects:S("A"), S("B"), S("C"), S("D"), nil];
		[a resize:3];
		if( ([a length] == 3) &&
				([[a objectAtIndex:2] equalToCstr:"C"]) ) {
			[a resize:6];
			if([a length] == 6) {
				return YES;
			}
		}
		else {
			return NO;
		}
	}
};
-(BOOL) OCXUT_objectAtIndex:(int)idx{
	@autoreleasepool{
		OCarray* a = [[OCarray alloc] initWithObjects:S("A"), S("B"), S("C"), S("D"), nil];
		if([[a objectAtIndex:0] equalToCstr:"A"] &&
			 [[a objectAtIndex:3] equalToCstr:"D"]) {
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_indexOfObject:(id)obj{
	@autoreleasepool{
		OCarray* a = [[OCarray alloc] initWithObjects:S("A"), S("B"), S("C"), S("D"), nil];
		if( ([a indexOfObject:S("A")] == 0) &&
				([a indexOfObject:S("B")] == 1) &&
				([a indexOfObject:S("C")] == 2) &&
				([a indexOfObject:S("D")] == 3) ) {
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_setObject:(id) obj
								atIndex:(int) idx{
	@autoreleasepool{
		OCarray* a = [[OCarray alloc] initWithObjects:S("A"), S("B"), S("X"), S("D"), nil];
		[a setObject:S("C")
				 atIndex:2];
		if([[a objectAtIndex:2] equalToCstr:"C"]) {
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_removeAllObjects{
	@autoreleasepool{
		OCarray* a = [[OCarray alloc] initWithObjects:S("A"), S("B"), S("C"), S("D"), nil];
		[a removeAllObjects];
		if([a length] == 0) {
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_forward_each:(void(^)(id obj)) cb{
	@autoreleasepool{
		OCarray* a = [[OCarray alloc] initWithObjects:S("A"), S("B"), S("C"), S("D"), nil];
		__block int n = 0;
		[a forward_each:^(id obj) {
				if([obj equalToCstr:"A"]) n += 1;
				if([obj equalToCstr:"B"]) n += 1;
				if([obj equalToCstr:"C"]) n += 1;
				if([obj equalToCstr:"D"]) n += 1;
			}];
		if(n == 4) {
			return YES;
		}
	}
	return NO;
};
-(BOOL) OCXUT_backward_each:(void(^)(id obj)) cb{
	@autoreleasepool{
		OCarray* a = [[OCarray alloc] initWithObjects:S("A"), S("B"), S("C"), S("D"), nil];
		__block int n = 0;
		[a backward_each:^(id obj) {
				if([obj equalToCstr:"D"]) n += 1;
				if([obj equalToCstr:"C"]) n += 1;
				if([obj equalToCstr:"B"]) n += 1;
				if([obj equalToCstr:"A"]) n += 1;
			}];
		if(n == 4) {
			return YES;
		}
	}
	return NO;
};

@end

#pragma clang diagnostic pop
