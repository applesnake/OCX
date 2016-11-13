#pragma once
#pragma once 
#import "OCXUnitTestObject.hh"
#import "OCdictionary.hh"

@interface OCXUT_OCdictionary_Basic : OCXUnitTestObject
-(BOOL) OCXUT_init;
-(BOOL) OCXUT_dealloc;

-(BOOL) OCXUT_dictWithObjectPairs:(id)k0, ...;
-(BOOL) OCXUT_dictWithObjectPairsNoCopy:(id)k0, ...;

-(BOOL) OCXUT_dictWithKeys:(OCarray*)kary
						values:(OCarray*)vary;

-(BOOL) OCXUT_dictWithOCdictionary:(OCdictionary*)d;

-(BOOL) OCXUT_dictWithMap:(map<OCMKey,id>*) OCXUT_m;

-(BOOL) OCXUT_initWithObjectPairs:(id)k0, ...;

-(BOOL) OCXUT_initWithKeys:(OCarray*)kary
						values:(OCarray*)vary;

-(BOOL) OCXUT_initWithOCdictionary:(OCdictionary*)d;
-(BOOL) OCXUT_initWithMap:(map<OCMKey,id>*) OCXUT_m;

-(BOOL) OCXUT_keyCount;
-(BOOL) OCXUT_keys;
-(BOOL) OCXUT_values;
-(BOOL)		OCXUT_valueForKey:(id)key;
-(BOOL)	OCXUT_removeValueForKey:(id)key;
-(BOOL)		OCXUT_keyForValue:(id)value;
-(BOOL) OCXUT_clearAll;

-(BOOL) OCXUT_each_pair:(void(^)(id k, id v))cb;
@end
