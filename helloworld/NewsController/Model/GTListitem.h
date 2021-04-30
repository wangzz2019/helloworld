//
//  GTListitem.h
//  helloworld
//
//  Created by Jack Wang on 3/18/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 
 */
@interface GTListItem : NSObject

@property(nonatomic,copy,readwrite) NSString *v4;
@property(nonatomic,copy,readwrite) NSString *v5;

- (void)configWithDictionary:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
