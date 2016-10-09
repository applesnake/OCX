#pragma once

#import "OCarray.hh"

@interface OCarray (Printer)
-(void) print;
-(void) printWithSeperator:(const char*)sp;
@end
