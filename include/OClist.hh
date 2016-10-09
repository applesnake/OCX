#pragma once
#import <objc/NSObject.h>
#include <list>
@class OCarray;

@interface OClist : NSObject
{
	std::list<id>* p;
}
@property (readonly, nonatomic) std::list<id>* p;
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

-(size_t) length;
-(id) headObject;
-(id) tailObject;
-(id) popHead;
-(id) popTail;
-(id) pushHead:(id)o,...;
-(id) pushBack:(id)o,...;
-(id) insertObject:(id)o
				afterIndex:(size_t)idx;
-(id) insertObject:(id)o
			 beforeIndex:(size_t)idx;

-(id)		removeObjectAtIndex:(size_t)idx;
-(int)	removeObjectFromIndex:(size_t)b
										withRange:(size_t)r;
-(int) removeObjectBeforeIndex:(size_t)b
										afterIndex:(size_t)e;
-(id) trimBeforeIndex:(size_t)i;
-(id) trimAfterIndex:(size_t)i;

-(int)	indexOfObject:(id)o;
-(id)		objectAtIndex:(size_t)idx;
-(id) setObject:(id)o
				atIndex:(size_t)idx;
-(id) removeAllObjects;
@end

