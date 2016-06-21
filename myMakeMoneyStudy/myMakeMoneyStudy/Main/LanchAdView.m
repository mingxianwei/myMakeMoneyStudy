//
//  LanchAdView.m
//  myMakeMoneyStudy
//
//  Created by 明先伟 on 16/6/21.
//  Copyright © 2016年 Miricle. All rights reserved.
//

#import "LanchAdView.h"
#import "Macro.h"


@interface LanchAdView()

@property (nonatomic,strong) UIImageView * myImageView;
@property (nonatomic,strong) UIButton * igonoreButton;
@property (nonatomic,strong) NSString * imageUrl;
@property (nonatomic,strong) UIImageView * defaltImageView;
@property (nonatomic,assign) NSTimeInterval duration;
@property (nonatomic,copy) lanchImageClicked block;
@end

@implementation LanchAdView

#pragma mark - LifeClice

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame  = CGRectMake(0, 0,SCREEN_WIDTH ,SCREEN_HEIGHT);
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.defaltImageView];
        [self.defaltImageView addSubview:self.myImageView];
        [self addSubview:self.igonoreButton];
        [self bringSubviewToFront:self.igonoreButton];
    }
    return self;
}

#pragma  mark - Plublic

-(void)showDuration:(NSTimeInterval)duration completionBlock:(lanchImageClicked)click{
    self.duration = duration;
    self.block = click;
    [self show];
}

- (void)show{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window addSubview:self];
    [window bringSubviewToFront:self];
    [self performSelector:@selector(dissmiss) withObject:nil afterDelay:self.duration];
}

- (void)dissmiss {
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - Pravite

- (UIImageView *)myImageView{
    if (!_myImageView) {
        _myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH ,SCREEN_HEIGHT - 150)];
        NSString* imageSource =@"http://img1.126.net/channel6/2015/020002/2.jpg?dpi=6401136";
       [_myImageView sd_setImageWithURL:[NSURL URLWithString:imageSource]];
    }
    return _myImageView;
}

- (UIButton *)igonoreButton{
    if (!_igonoreButton) {
        _igonoreButton = [[UIButton alloc] initWithFrame:CGRectMake(self.bounds.size.width-70, 40, 50, 25)];
        _igonoreButton.layer.cornerRadius = 2;
        _igonoreButton.backgroundColor = [UIColor whiteColor];
        [_igonoreButton setTitle:@"跳过" forState:UIControlStateNormal];
        [_igonoreButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _igonoreButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [_igonoreButton addTarget:self action:@selector(igonoreButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _igonoreButton;
}

- (UIImageView *)defaltImageView {
    if (!_defaltImageView) {
        _defaltImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _defaltImageView.image = [self getLanchImage];
    }
    return _defaltImageView;
}

- (UIImage *)getLanchImage{
    UIImage *img = nil;
    if (IS_IPHONE4_SERIAL) {
        img = [UIImage imageNamed:@"LaunchImage-700"];
    } else if(IS_IPHONE5_SERIAL){
        img = [UIImage imageNamed:@"LaunchImage-700-568h"];
    } else if (IS_IPHONE6){
        img = [UIImage imageNamed:@"LaunchImage-800-667h"];
    } else if (IS_IPHONE6PLUS){
        img = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h"];
    }
    return img;
}

- (void)igonoreButtonClicked{
    [self dissmiss];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    //取得当前位置
    CGPoint current=[touch locationInView:self];
    if (CGRectContainsPoint(self.myImageView.frame, current)) {
        [self dissmiss];
        if (self.block) {
            self.block(@"http://www.baidu.com");
        }
    }
    
}



@end
