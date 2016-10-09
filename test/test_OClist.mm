#import "OCstring+Printer.hh"
#import "OClist+Printer.hh"

int main(int argc, char* argv[]) {
	@autoreleasepool{
		{
			OClist* l = [[OClist alloc] init];
			OCstring* s = [[OCstring alloc] init];
			[s retain];
			[l pushBack:s, s, s, s,nil];
			[l retain];
			printf("%d\n", [l length]);
			[l release];
		}
		{
			OCstring* s = [OCstring stringWithCString:"ABC"];
			OCstring* s1 = [OCstring stringWithCString:"123"];
			OCstring* s2 = [OCstring stringWithCString:"DEF"];
			OClist* l = [OClist listWithObjectsNoCopy:s, s1, s2, nil];
			[l printWithSeperator:","];
			[l popHead];
			[l printWithSeperator:","];
			[l popTail];
			[l printWithSeperator:","];
			[l popHead];
			[l printWithSeperator:","];
			
			[l pushBack:[OCstring stringWithCString:"PushBack"],nil];
			[l printWithSeperator:","];
			[l pushHead:[OCstring stringWithCString:"PushFront"],nil];
			[l printWithSeperator:","];
			[l insertObject:[OCstring stringWithCString:"Insert1"]
					 afterIndex:1];
			[l insertObject:[OCstring stringWithCString:"Insert5"]
					 afterIndex:5];
			[l printWithSeperator:","];
			[l setObject:[OCstring stringWithCString:"Set0"]
					 atIndex: 3];
			[l printWithSeperator:","];
			[l insertObject:[OCstring stringWithCString:"Insert0"]
					beforeIndex:2];
			[l printWithSeperator:","];
			[l insertObject:[OCstring stringWithCString:"InsertX"]
					beforeIndex:10];
			[l printWithSeperator:","];

			[l removeObjectAtIndex:0];
			[l printWithSeperator:","];
			[l removeObjectFromIndex:1
										 withRange:2];
			[l printWithSeperator:","];
			[l removeObjectBeforeIndex:1
											afterIndex:6];
			[l printWithSeperator:","];
			[l trimBeforeIndex:1];
			[l trimAfterIndex:-2];
			[l printWithSeperator:","];

			[l removeObjectFromIndex:0
										 withRange:100];
			[l printWithSeperator:","];
		}
	}
	return 0;
};
