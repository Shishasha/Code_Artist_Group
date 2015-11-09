//
//  ViewController.m
//  66666
//
//  Created by lanou3g on 15/10/26.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property(nonatomic,retain)UIWebView *webView;
@property(nonatomic,retain)UIActivityIndicatorView *activeView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView=[[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    自适应界面大小
    _webView.scalesPageToFit=YES;
    [self .view addSubview:_webView];
    self.webView.delegate=self;
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.acfun.tv"]];
//    加载内容
    [_webView loadRequest:request];
}
#pragma mark----代理实现
-(void)webViewDidStartLoad:(UIWebView *)webView{
     UIView *aView=[[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    aView.backgroundColor=[UIColor blackColor];
    aView.alpha=0.5;
    aView.tag=1001;
    [self.view addSubview:aView];
    self.activeView=[[UIActivityIndicatorView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    使中心点重合
    _activeView.center=aView.center;
    [_activeView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [aView addSubview:_activeView];
//    动画开始
    [_activeView startAnimating];
    NSLog(@"开始加载");
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
//    停止动画
    [_activeView stopAnimating];
//通过tag值，调用背景
    UIView *view=(UIView *)[self.view viewWithTag:1001];
    [view removeFromSuperview];
    NSLog(@"加载完成");
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [_activeView stopAnimating];
    //通过tag值，调用背景
    UIView *view=(UIView *)[self.view viewWithTag:1001];
    [view removeFromSuperview];

    NSLog(@"加载错误%@",error);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
