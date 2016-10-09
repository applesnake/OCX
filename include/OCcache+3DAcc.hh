#import "OCcachePrivate.hh"
@interface OCcache(_3DAcc)
-(id) initWithWith:(size_t)w
						height:(size_t)h;
-(id) initWithWith:(size_t)w
						height:(size_t)h
								 z:(size_t)z;

-(void*) elementAtColum:(int)col
										row:(int)row;
-(void*) elementAtColum:(int)col
										row:(int)row
											z:(int)z;
-(void*) direct2DArray;
-(void*) direct3DArray;

-(size_t) width;
-(size_t) height;
-(size_t) z;
@end
