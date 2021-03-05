//
//  GTListLoader.m
//  helloworld
//
//  Created by Jack Wang on 3/2/21.
//

#import "GTListLoader.h"

@implementation GTListLoader

- (void)loadListData{
    NSString *urlString=@"http://www.yahoo.co.jp";
    NSURL *listURL=[NSURL URLWithString:urlString];
    
//    __unused NSURLRequest *listRequest=[NSURLRequest requestWithURL:listURL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask=[session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"");
    }];
    
    [dataTask resume];
    NSLog(@"");
}

@end
