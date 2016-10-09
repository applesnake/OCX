#import "OCcache.hh"
@class OCfile;

@interface OCcache(file)
+(OCcache*) OCcacheWithOCfile:(OCfile*)f;
+(OCcache*) OCcacheWithOCfile:(OCfile*)f
										 postProc:(void(^)(OCfile*, OCcache*))cb;
@end
