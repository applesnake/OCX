#pragma once
#import <objc/NSObject.h>
#include <list>
@class OCarray;

@interface OClist : NSObject
{
	std::list<id>* p;
}
-(id) init;
-(void) dealloc;
-(id) initWithObjects:(id)o, ...;
-(id) initWithOClist:(OClist*)ocl;
-(id) initWithOCarray:(OCarray*)oca;
-(id) initWithStdList:(const std::list<id>*)l;
-(id) initWithObjectsNoCopy:(id)o, ...;
-(id) initWithOClistNoCopy:(OClist*)ocl;
-(id) initWithOCarrayNoCopy:(OCarray*)oca;
-(id) initWithStdListNoCopy:(const std::list<id>*)l;

+(id) listWithObjects:(id)o,...;
+(id) listWithOClist:(OClist*)ocl;
+(id) listWithOCarray:(OCarray*)oca;
+(id) listWithStdList:(const std::list<id>*)l;

+(id) listWithObjectsNoCopy:(id)o,...;
+(id) listWithOClistNoCopy:(OClist*)ocl;
+(id) listWithOCarrayNoCopy:(OCarray*)oca;
+(id) listWithStdListNoCopy:(const std::list<id>*)l;

-(int) length;
-(id) headObject;
-(id) tailObject;
-(id) popHead;
-(id) popTail;
-(id) pushHead:(id)o,...;
-(id) pushBack:(id)o,...;
-(id) insertObject:(id)o
				afterIndex:(int)idx;
-(id) insertObject:(id)o
			 beforeIndex:(int)idx;

-(id)		removeObjectAtIndex:(int)idx;
-(int)	removeObjectFromIndex:(int)b
										withRange:(int)r;
-(int) removeObjectBeforeIndex:(int)b
										afterIndex:(int)e;
-(id) trimBeforeIndex:(int)i;
-(id) trimAfterIndex:(int)i;

-(int)	indexOfObject:(id)o;
-(id)		objectAtIndex:(int)idx;
-(id) setObject:(id)o
				atIndex:(int)idx;
-(id) removeAllObjects;
@end

