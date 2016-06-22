//
//  Macro.h
//  myMakeMoneyStudy
//
//  Created by mingxianwei on 16/6/21.
//  Copyright © 2016年 Miricle. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

#pragma mark - ====系统版本及机型判断===

/** 获取系统版本 */
#define iOS_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])

/** 是否为iOS6 */
#define iOS6 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0) ? YES : NO)
/** 是否为iOS7 */
#define iOS7 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? YES : NO)
/** 是否为iOS8 */
#define iOS8 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) ? YES : NO)
/** 是否为iOS9 */
#define iOS9 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) ? YES : NO)
/** 是否为iOS10 */
#define iOS10 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) ? YES : NO)

//判断是否是iPhone5及其以上机型
#define IS_IPHONE4_SERIAL (fabs((double)[[UIScreen mainScreen] bounds].size.height-(double)480) < DBL_EPSILON)
#define IS_IPHONE5_SERIAL (fabs((double)[[UIScreen mainScreen] bounds].size.height-(double)568) < DBL_EPSILON)
#define IS_IPHONE6_SERIAL (fabs((double)[[UIScreen mainScreen] bounds].size.height-(double)667) < DBL_EPSILON)
#define IS_IPHONE6PLUS_SERIAL (fabs((double)[[UIScreen mainScreen] bounds].size.height-(double)736) < DBL_EPSILON)


#pragma mark - === UIColor定义的宏 ===

#undef    RGB
#define RGB(R,G,B)        [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f]

#undef    RGBA
#define RGBA(R,G,B,A)     [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]

#undef    HEX_RGB
#define HEX_RGB(V)        [UIColor fromHexValue:V]

#undef    HEX_RGBA
#define HEX_RGBA(V, A)    [UIColor fromHexValue:V alpha:A]

#undef    SHORT_RGB
#define SHORT_RGB(V)      [UIColor fromShortHexValue:V]


#pragma mark - ===常用语句宏定义===


#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf)  __strong strongSelf = weakSelf;

/** 快速查询一段代码的执行时间
 TICK
 do your work here
 TOCK
 */
#define TICK NSDate *startTime = [NSDate date];
#define TOCK NSLog(@"Time:%f", -[startTime timeIntervalSinceNow]);


#endif /* Macro_h */
