#import "OCcache+3DAcc.hh"
@implementation OCcache(_3DAcc)
-(id) initWithWith:(size_t)w
						height:(size_t)h{
	width = w;
	height = h;
	z = 0;
	return self;
};
-(id) initWithWith:(size_t)w
						height:(size_t)h
								 z:(size_t)Z{
	width = w;
	height = h;
	z = Z;
    return self;
};

-(void*) elementAtColum:(int)col
										row:(int)row{
	return NULL;
};
-(void*) elementAtColum:(int)col
										row:(int)row
											z:(int)z{
	return NULL;
};
-(void*) direct2DArray{
	return NULL;
};
	
-(void*) direct3DArray{
	return NULL;
};

-(size_t) width{
	return width;
};
-(size_t) height{
	return height;
};
-(size_t) z{
	return self.z;
};
@end
