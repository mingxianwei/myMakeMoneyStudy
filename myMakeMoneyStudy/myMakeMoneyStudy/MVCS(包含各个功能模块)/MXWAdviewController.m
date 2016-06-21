//
//  MXWAdviewController.m
//  myMakeMoneyStudy
//
//  Created by 明先伟 on 16/6/21.
//  Copyright © 2016年 Miricle. All rights reserved.
//

#import "MXWAdviewController.h"
@interface MXWAdviewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *myWebView;

@end

@implementation MXWAdviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.myWebView];
    self.myWebView.delegate = self;
    [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.jumpUrl]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"开始加载");
    return YES;
}

@end
