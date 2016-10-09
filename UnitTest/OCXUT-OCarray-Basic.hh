#pragma once 
#import "OCXUnitTestObject.hh"
#import "OCarray.hh"
#import "OCstring.hh"

@interface OCXUT_OCarray_Basic : OCXUnitTestObject
-(BOOL) OCXUT_initWithObjects:(id)o, ...;
-(BOOL) OCXUT_initWithOCarray:(OCarray*)oca;
-(BOOL) OCXUT_initWithStdVector:(const std::vector<id>*)v;
-(BOOL) OCXUT_initWithObjectsNoCopy:(id)o, ...;
-(BOOL) OCXUT_initWithOCarrayNoCopy:(OCarray*)oca;
-(BOOL) OCXUT_initWithStdVectorNoCopy:(const std::vector<id>*)v;

-(BOOL) OCXUT_arrayWithObjects:(id)o, ...;
-(BOOL) OCXUT_arrayWithOCarray:(OCarray*)oca;
-(BOOL) OCXUT_arrayWithStdVector:(const std::vector<id>*)v;

-(BOOL) OCXUT_length;
-(BOOL) OCXUT_pop; // Tail ONLY
-(BOOL) OCXUT_push:(id)o,...; // Tail ONLY
-(BOOL) OCXUT_resize:(size_t) newsize;
-(BOOL) OCXUT_objectAtIndex:(int)idx;
-(BOOL) OCXUT_indexOfObject:(id)obj;
-(BOOL) OCXUT_setObject:(id) obj
				atIndex:(int) idx;
-(BOOL) OCXUT_removeAllObjects;
-(BOOL) OCXUT_forward_each:(void(^)(id obj)) cb;
-(BOOL) OCXUT_backward_each:(void(^)(id obj)) cb;

@end
