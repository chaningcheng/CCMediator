//
//  CCWKViewController.m
//  CCMediator_Example
//
//  Created by SimonCheng on 2020/3/16.
//  Copyright © 2020 chaningcheng. All rights reserved.
//

#import "CCWKViewController.h"
#import <WebKit/WebKit.h>

@interface CCWKViewController ()

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation CCWKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.URL]];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"parameter"
                                                                   message:[NSString stringWithFormat:@"%@", self.parameter]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定"
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
    [alert addAction:action];
    [self presentViewController:alert
                       animated:YES
                     completion:nil];
}

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    }
    return _webView;
}

@end
