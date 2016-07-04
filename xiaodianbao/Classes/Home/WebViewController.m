//
//  WebViewController.m
//  xiaodianbao
//
//  Created by 尹成 on 16/7/1.
//  Copyright © 2016年 尹成. All rights reserved.
//

typedef enum : NSUInteger {
    WebTypeNone,
    WebTypeYuyue,
    WebTypeChakan,
    WebTypeShare
} WebType;

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong) MBProgressHUD *hud;
@property (weak, nonatomic) IBOutlet UIView *tabbar;
@property (weak, nonatomic) IBOutlet UIButton *payAttentionButton;


@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.payAttentionButton.layer.masksToBounds = YES;
    self.payAttentionButton.layer.cornerRadius = 2;
    self.payAttentionButton.layer.borderWidth = 0.8;
    self.payAttentionButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.webView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated{
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
    [self.webView loadRequest:request];
    [self showHUD];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hiddenHUD];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    //TODO: 加载失败页面
    NSLog(@"error:\n%@",error);
}

- (IBAction)yuyueAction:(id)sender {
}
- (IBAction)payAttentionAction:(id)sender {
}

- (MBProgressHUD *)hud{
    if (!_hud) {
        UIView *view = [[UIApplication sharedApplication].windows lastObject];
        _hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    return _hud;
}


- (void)showHUD{
    [self hud];
}

- (void)hiddenHUD{
    [self.hud removeFromSuperview];
    self.hud = nil;
}

@end
