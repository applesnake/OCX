#pragma once

#import "OClist.hh"

@interface OClist (Printer)
-(void) print;
-(void) printWithSeperator:(const char*)sp;
@end
