#pragma once
#include <stdlib.h>
#define OC_MODE_SHORTCIRCUTE 0
#define OC_MODE_ALL 1

@interface OCalgorithm

-(id) forEachDo:(id(^)(id obj))blk;

-(id) forBegin:(id)begin_locator
				 toEnd:(id)end_locator
			 odBlock:(id(^)(id obj)) blk;


-(id) onYES:(BOOL(^)(id obj))pred
		doBlock:(id(^)(id obj))act
			 mode:(int)m;

-(id) onNO:(BOOL(^)(id obj))pred
	 doBlock:(id(^)(id obj))act
			mode:(int)m;

-(id) onEqualTo:(id)value
			doBlock:(id(^)(id obj))act;

-(id) onNotEqualTo:(id)value
					 doBlock:(id(^)(id obj))act;

-(id) onLessThan:(id)value
				 doBlock:(id(^)(id obj))act;

-(id) onLessEqualThan:(id)value
				 doBlock:(id(^)(id obj))act;

-(id) onLargerThan:(id)value
				 doBlock:(id(^)(id obj))act;

-(id) onLargerThan:(id)value
				 doBlock:(id(^)(id obj))act;

-(id) onLargerEqualThan:(id)value
								doBlock:(id(^)(id obj))act;

-(void) actSequence:(OCarray*)act_ary
		withBitSwitches:(long)bits;

-(id) selectBlcok:((id)(^)());

-(id) collectUseBlock:((id)(^)());

-(id) mapUseBlock:((void)^(id obj))blk;

-(id) sortUseBlock:((void)^(id obj))blk;
-(id) qsortUseBlock:((void)^(id obj))blk;

@end
