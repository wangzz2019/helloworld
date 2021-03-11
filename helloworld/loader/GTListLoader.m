//
//  GTListLoader.m
//  helloworld
//
//  Created by Jack Wang on 3/2/21.
//

#import "GTListLoader.h"
#import <AFNetworking.h>


@implementation GTListLoader

- (void)loadListData{
    NSString *urlString=@"http://www.yahoo.co.jp";
    __unused NSURL *listURL=[NSURL URLWithString:urlString];
    
//    __unused NSURLRequest *listRequest=[NSURLRequest requestWithURL:listURL];
    
    [[AFHTTPSessionManager manager] GET:@"http://www.yahoo.co.jp" parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"");
    }];
    
//    [[AFHTTPSessionManager manager] GET:@"www.yahoo.co.jp"
//                             parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        NSLog(@"");
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"");
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"");
//    }];
    
//    NSURLSession *session = [NSURLSession sharedSession];
//
//    NSURLSessionDataTask *dataTask=[session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"");
//    }];
//
//    [dataTask resume];
//    NSLog(@"");
}

@end
