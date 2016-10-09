#pragma once
#include <stdlib.h>

@protocol OCproviderProtocol
-(size_t) byteCount;
-(size_t) writeOffset;
-(void*)	dataPtr;
-(size_t) elementSizeInByte;
-(size_t) elementCount;
@end
