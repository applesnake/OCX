#import "OCcache+file.hh"
#import "OCfile.hh"

@implementation OCcache(file)
+(OCcache*) OCcacheWithOCfile:(OCfile*)f{
	size_t bytes = [f fileBytes];
	OCcache* nocc = [[OCcache alloc] init];
	nocc->p = new char[bytes];
	nocc->bytes = bytes;
	nocc->elementBytes = 1;
	nocc->shadow = NO;
	long t = [f readBytes:bytes
						 withBuffer:nocc->p];
	return nocc;
};
+(OCcache*) OCcacheWithOCfile:(OCfile*)f
										 postProc:(void(^)(OCfile* ocf, OCcache* occ))cb
{
	OCcache* occ = [OCcache OCcaheWithOCfile:f];
	if(cb) {
		cb(f, occ);
	}
	return occ;
};
@end
