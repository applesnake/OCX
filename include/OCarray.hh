#pragma once
#import <objc/NSObject.h>
#include <vector>
@class OClist;

@interface OCarray : NSObject
{
	std::vector<id>* p;
}
@property (readonly, nonatomic) std::vector<id>* p;
-(id) init;
-(void) dealloc;
-(id) initWithObjects:(id)o, ...;
-(id) initWithOCarray:(OCarray*)oca;
-(id) initWithStdVector:(const std::vector<id>*)v;
-(id) initWithObjectsNoCopy:(id)o, ...;
-(id) initWithOCarrayNoCopy:(OCarray*)oca;
-(id) initWithStdVectorNoCopy:(const std::vector<id>*)v;

+(id) arrayWithObjects:(id)o, ...;
+(id) arrayWithOCarray:(OCarray*)oca;
+(id) arrayWithStdVector:(const std::vector<id>*)v;
+(id) arrayWithObjectsNoCopy:(id)o, ...;
+(id) arrayWithOCarrayNoCopy:(OCarray*)oca;
+(id) arrayWithStdVectorNoCopy:(const std::vector<id>*)v;

-(size_t) length;
-(id) pop; // Tail ONLY
-(id) push:(id)o,...; // Tail ONLY
-(void) resize:(size_t) new_size;
-(id) objectAtIndex:(int)idx;
-(int) indexOfObject:(id)obj;
-(id) setObject:(id) obj
				atIndex:(int) idx;
-(void) removeAllObjects;
-(void) forward_each:(void(^)(id obj)) cb;
-(void) backward_each:(void(^)(id obj)) cb;

-(id)			insert:(id)o
afterObjectIndex:(size_t)i;
-(id)			insert:(id)o
beforeObjectIndex:(size_t)i;

-(id)			insert:(id)o
		 afterObject:(id)t;

-(id)			insert:(id)o
		beforeObject:(id)t;

@end

