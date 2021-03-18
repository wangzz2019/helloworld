//
//  GTListLoader.m
//  helloworld
//
//  Created by Jack Wang on 3/2/21.
//

#import "GTListLoader.h"
#import <AFNetworking.h>
#import "GTListitem.h"

@implementation GTListLoader

- (void)loadListData{
    NSString *urlString=@"http://34.85.6.93:8080/samplejson";
    NSURL *listURL=[NSURL URLWithString:urlString];
    
//    __unused NSURLRequest *listRequest=[NSURLRequest requestWithURL:listURL];
    
//    [[AFHTTPSessionManager manager] GET:@"http://34.85.6.93:8080/samplejson" parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        NSLog(@"");
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"");
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"");
//    }];
    
    
    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *dataTask=[session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *jsonError;
        id jsonObj=[NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
#warning check data type
        NSArray *dataArray = [((NSDictionary *)jsonObj) objectForKey:@"key3"];
        NSMutableArray *listItemArray=@[].mutableCopy;
        for (NSDictionary *info in dataArray){
            GTListitem *listItem = [[GTListitem alloc] init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        
        NSLog(@"");
    }];

    [dataTask resume];
    NSLog(@"");
}

@end
