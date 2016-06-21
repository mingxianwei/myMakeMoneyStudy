//
//  LanchAdView.h
//  myMakeMoneyStudy
//
//  Created by 明先伟 on 16/6/21.
//  Copyright © 2016年 Miricle. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^lanchImageClicked)(NSString * urlString);
@interface LanchAdView : UIView

-(void)showDuration:(NSTimeInterval)duration completionBlock:(lanchImageClicked)click;

@end
