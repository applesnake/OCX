#pragma once 
#import "OCXUnitTestObject.hh"
#import "OCstring.hh"

@interface OCXUT_OCstring_Basic : OCXUnitTestObject
{
}
-(BOOL) OCXUT_initWithCstring;
-(BOOL) OCXUT_initWithOCstring;
-(BOOL) OCXUT_initWithStdstring;
-(BOOL) OCXUT_stringWithCstring;
-(BOOL) OCXUT_stringWithOCstring;
-(BOOL) OCXUT_stringWithStdstring;
-(BOOL) OCXUT_length;
-(BOOL) OCXUT_equalTo;
-(BOOL) OCXUT_lessThan;
-(BOOL) OCXUT_UTF8String;
-(BOOL) OCXUT_clone;

@end
