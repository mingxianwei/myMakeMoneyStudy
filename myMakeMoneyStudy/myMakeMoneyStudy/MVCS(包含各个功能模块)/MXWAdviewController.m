//
//  MXWAdviewController.m
//  myMakeMoneyStudy
//
//  Created by 明先伟 on 16/6/21.
//  Copyright © 2016年 Miricle. All rights reserved.
//

#import "MXWAdviewController.h"
#import "NJKWebViewProgress.h"
@interface MXWAdviewController () < UIWebViewDelegate,NJKWebViewProgressDelegate>
@property (nonatomic,copy)NSString * jumpUrl;
@property (nonatomic,strong) NJKWebViewProgress * progress;
@property (nonatomic,strong) UIWebView *myWebView;
@property (nonatomic,strong) UIProgressView * progressView;
@end

@implementation MXWAdviewController

#pragma mark - LifeClice

- (instancetype)initWithUrlString:(NSString *)urlString{
    self = [super init];
    if (self) {
        self.jumpUrl = urlString;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDataAndView];
    [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.jumpUrl]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Pravite

- (void)initDataAndView{
    self.myWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.myWebView];
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 62, SCREEN_WIDTH, 1)];
    self.progressView.backgroundColor = [UIColor clearColor];
    self.progressView.trackTintColor = [UIColor clearColor];
    self.progressView.tintColor = [UIColor redColor];
    [self.navigationController.view addSubview:self.progressView];
    
    self.progress = [[NJKWebViewProgress alloc] init];
    self.progress.webViewProxyDelegate = self;
    self.progress.progressDelegate = self;
    WEAKSELF;
    self.progress.progressBlock = ^(float progress) {
        STRONGSELF;
        [strongSelf.progressView setProgress:progress animated:NO];
        if(progress >= 1.0) {
            [strongSelf.progressView removeFromSuperview];
        }
    };
    
    self.myWebView.delegate = self.progress;
}


#pragma mark - Publick



#pragma mark Delegete

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"开始加载");
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    self.navigationItem.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}


- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress{
    [self.progressView setProgress:progress animated:NO];
}

@end
