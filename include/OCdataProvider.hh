#import "OCdataProvider.hh"
#import "OCproviderProtocol.hh"
#import "OCcache.hh"
#import <objc/NSObject.h>

// Provider Always Not Keeps Ownership of OCcache object.
@interface OCdataProvider : NSObject<OCproviderProtocol>
{
	OCcache*	occ;
	size_t		dataPlacement;
}
@property (readwrite, nonatomic) size_t dataPlacement;
@property (readwrite, nonatomic) OCcache* occ;
-(id) initWithOCcache:(OCcache*)occ
						placement:(size_t)t;
+(id) OCdataProviderWithOCcache:(OCcache*)occ
											placement:(size_t)t;
@end

