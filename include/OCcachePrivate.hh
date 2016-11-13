#pragma once
#import <objc/NSObject.h>
#include <stdlib.h>
#include <stdio.h>
#import "OCcache.hh"
@interface OCcache ()
{
	size_t	width;
	size_t	height;
	size_t	z;
};
-(void)empty;
@end
