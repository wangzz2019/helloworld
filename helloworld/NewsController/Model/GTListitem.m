//
//  GTListitem.m
//  helloworld
//
//  Created by Jack Wang on 3/18/21.
//

#import "GTListitem.h"

@implementation GTListItem

#pragma mark - NSSecureCoding
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.v4 forKey:@"v4"];
    [aCoder encodeObject:self.v5 forKey:@"v5"];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self=[super init];
    if (self){
        self.v4 = [aDecoder decodeObjectForKey:@"v4"];
        self.v5 = [aDecoder decodeObjectForKey:@"v5"];
    }
    return self;
} // NS_DESIGNATED_INITIALIZER

+ (BOOL) supportsSecureCoding{
    return YES;
}

#pragma mark - public method

- (void)configWithDictionary:(NSDictionary *)dictionary {

#warning message
	self.v4=[dictionary objectForKey:@"key31"];
	self.v5=[dictionary objectForKey:@"key32"];
}

@end
