//
//  MMSingleton.m
//  myMakeMoneyStudy
//
//  Created by mingxianwei on 2017/4/24.
//  Copyright © 2017年 Miricle. All rights reserved.
//

#import "MMSingleton.h"

static MMSingleton * _signleton = nil;

@interface MMSingleton ()<NSCopying>

@end

@implementation MMSingleton 

+ (instancetype)shareInstance {
    if(_signleton == nil) {
        static dispatch_once_t onceTocken;
        dispatch_once(&onceTocken, ^{
            _signleton = [[self alloc] init];
        });
    }
    return _signleton;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if(_signleton == nil){
        static dispatch_once_t onceTocken;
        dispatch_once(&onceTocken, ^{
            _signleton = [super allocWithZone:zone];
        });
    }
    return _signleton;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    return _signleton;
}

@end
