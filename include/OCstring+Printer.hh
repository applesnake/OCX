#pragma once
#include "OCstring.hh"
@interface OCstring(Printer)
-(void) puts;
-(void) print;
-(void) putsWithFormat:(const char*)fmt;
@end
