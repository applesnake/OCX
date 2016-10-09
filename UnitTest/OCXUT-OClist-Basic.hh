#pragma once

#import "OCXUnitTestObject.hh"
#import "OClist.hh"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-method-access"

@interface OCXUT_OClist_Basic : OCXUnitTestObject
-(BOOL) OCXUT_initWithObjects:(BOOL)o, ...;
-(BOOL) OCXUT_initWithOClist:(OClist*)ocl;
-(BOOL) OCXUT_initWithOCarray:(OCarray*)oca;
-(BOOL) OCXUT_initWithStdList:(const std::list<id>*)l;
-(BOOL) OCXUT_initWithObjectsNoCopy:(BOOL)o, ...;
-(BOOL) OCXUT_initWithOClistNoCopy:(OClist*)ocl;
-(BOOL) OCXUT_initWithOCarrayNoCopy:(OCarray*)oca;
-(BOOL) OCXUT_initWithStdListNoCopy:(const std::list<id>*)l;

-(BOOL) OCXUT_listWithObjects:(BOOL)o,...;
-(BOOL) OCXUT_listWithOClist:(OClist*)ocl;
-(BOOL) OCXUT_listWithOCarray:(OCarray*)oca;
-(BOOL) OCXUT_listWithStdList:(const std::list<id>*)l;

-(BOOL) OCXUT_listWithObjectsNoCopy:(BOOL)o,...;
-(BOOL) OCXUT_listWithOClistNoCopy:(OClist*)ocl;
-(BOOL) OCXUT_listWithOCarrayNoCopy:(OCarray*)oca;
-(BOOL) OCXUT_listWithStdListNoCopy:(const std::list<id>*)l;

-(BOOL) OCXUT_length;
-(BOOL) OCXUT_headObject;
-(BOOL) OCXUT_tailObject;
-(BOOL) OCXUT_popHead;
-(BOOL) OCXUT_popTail;
-(BOOL) OCXUT_pushHead:(id)o,...;
-(BOOL) OCXUT_pushBack:(id)o,...;
-(BOOL) OCXUT_insertObject:(id)o
				afterIndex:(size_t)idx;
-(BOOL) OCXUT_insertObject:(id)o
			 beforeIndex:(size_t)idx;

-(BOOL)	OCXUT_removeObjectAtIndex:(size_t)idx;
-(BOOL) OCXUT_removeObjectFromIndex:(size_t)b
										withRange:(size_t)r;
-(BOOL) OCXUT_removeObjectBeforeIndex:(size_t)b
										afterIndex:(size_t)e;
-(BOOL) OCXUT_trimBeforeIndex:(size_t)i;
-(BOOL) OCXUT_trimAfterIndex:(size_t)i;

-(BOOL)	OCXUT_indexOfObject:(id)o;
-(BOOL)	OCXUT_objectAtIndex:(size_t)idx;
-(BOOL) OCXUT_setObject:(id)o
								atIndex:(size_t)idx;
-(BOOL) OCXUT_removeAllObjects;
@end
#pragma clang diagnostic pop
