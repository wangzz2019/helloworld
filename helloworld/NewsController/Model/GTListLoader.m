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

- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock{
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

    __weak typeof(self) weakSelf=self;
    NSURLSessionDataTask *dataTask=[session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSError *jsonError;
        id jsonObj=[NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
#warning check data type
        NSArray *dataArray = [((NSDictionary *)jsonObj) objectForKey:@"key3"];
        NSMutableArray *listItemArray=@[].mutableCopy;
        for (NSDictionary *info in dataArray){
            GTListItem *listItem = [[GTListItem alloc] init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        [strongSelf _archiveListDataWithArray:listItemArray.copy];
        dispatch_async(dispatch_get_main_queue(),^{
            if (finishBlock){
                finishBlock(error==nil,listItemArray.copy);
            }
        });
        
        NSLog(@"");
    }];

    [dataTask resume];
//    [self _getSandBoxPath];
    NSLog(@"");
}

- (void)_archiveListDataWithArray:(NSArray<GTListItem *> *)array{
    NSArray *pathArray=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath=[pathArray firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //create directory
    NSString *dataPath= [cachePath stringByAppendingPathComponent:@"GTData"];
    NSError *creatError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&creatError];
    
    //create file
    NSString *listDataPath= [dataPath stringByAppendingPathComponent:@"list"];
//    NSData *listData = [@"abc" dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    
    NSData *readListData=[fileManager contentsAtPath:listDataPath];
    id unarchiveObj=[NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [GTListItem class], nil] fromData:readListData error:nil];
    
    NSLog(@"");
    //search file
//    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];
    
    //delete
//    if (fileExist){
//        [fileManager removeItemAtPath:listDataPath error:nil];
//    }
    
//    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
//    [fileHandler seekToEndOfFile];
//    [fileHandler writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
//    [fileHandler synchronizeFile];
//    [fileHandler closeFile];
//    NSLog(@"");
}

@end
