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
@interface GTListItem : NSObject<NSSecureCoding>

//@property(nonatomic,copy,readwrite) NSString *v4;
//@property(nonatomic,copy,readwrite) NSString *v5;

@property(nonatomic, copy, readwrite) NSString *category;
@property(nonatomic, copy, readwrite) NSString *picUrl;
@property(nonatomic, copy, readwrite) NSString *uniqueKey;
@property(nonatomic, copy, readwrite) NSString *title;
@property(nonatomic, copy, readwrite) NSString *date;
@property(nonatomic, copy, readwrite) NSString *authorName;
@property(nonatomic, copy, readwrite) NSString *articleUrl;

- (void)configWithDictionary:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
