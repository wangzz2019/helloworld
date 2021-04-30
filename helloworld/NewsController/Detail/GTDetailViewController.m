//
//  GTDetailViewController.m
//  helloworld
//
//  Created by Jack Wang on 1/4/21.
//

#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>

@interface GTDetailViewController ()<WKNavigationDelegate>
@property(nonatomic,strong,readwrite) WKWebView *webView;
@property(nonatomic,strong,readwrite) UIProgressView *progressView;
@end

@implementation GTDetailViewController

- (void)dealloc {
	[self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	[self.view addSubview:({
		self.webView=[[WKWebView alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, self.view.frame.size.height-88)];
		self.webView.navigationDelegate=self;
		self.webView;
	})];
	[self.view addSubview:({
		self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width,20)];
		self.progressView;
	})];
	[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://time.geekbang.org"]]];

	[self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];


//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://time.geekbang.org"]]];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
	NSLog(@"load finished");
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//    NSLog(@"");
	decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context {
	NSLog(@"");
	self.progressView.progress=self.webView.estimatedProgress;
}

@end
