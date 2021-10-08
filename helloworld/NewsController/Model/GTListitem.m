//
//  GTListitem.m
//  helloworld
//
//  Created by Jack Wang on 3/18/21.
//

#import "GTListitem.h"

@implementation GTListItem

#pragma mark - NSSecureCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
//    [aCoder encodeObject:self.v4 forKey:@"v4"];
//    [aCoder encodeObject:self.v5 forKey:@"v5"];
	[aCoder encodeObject:self.category forKey:@"category"];
	[aCoder encodeObject:self.picUrl forKey:@"picUrl"];
	[aCoder encodeObject:self.uniqueKey forKey:@"uniqueKey"];
	[aCoder encodeObject:self.title forKey:@"title"];
	[aCoder encodeObject:self.date forKey:@"date"];
	[aCoder encodeObject:self.authorName forKey:@"authorName"];
	[aCoder encodeObject:self.articleUrl forKey:@"articleUrl"];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
	self=[super init];
	if (self) {
//        self.v4 = [aDecoder decodeObjectForKey:@"v4"];
//        self.v5 = [aDecoder decodeObjectForKey:@"v5"];
		self.category = [aDecoder decodeObjectForKey:@"category"];
		self.picUrl = [aDecoder decodeObjectForKey:@"picUrl"];
		self.uniqueKey = [aDecoder decodeObjectForKey:@"uniqueKey"];
		self.title = [aDecoder decodeObjectForKey:@"title"];
		self.date = [aDecoder decodeObjectForKey:@"date"];
		self.authorName = [aDecoder decodeObjectForKey:@"authorName"];
		self.articleUrl = [aDecoder decodeObjectForKey:@"articleUrl"];
	}
	return self;
} // NS_DESIGNATED_INITIALIZER

+ (BOOL) supportsSecureCoding {
	return YES;
}

#pragma mark - public method

- (void)configWithDictionary:(NSDictionary *)dictionary {

#warning message
//	self.v4=[dictionary objectForKey:@"key31"];
//	self.v5=[dictionary objectForKey:@"key32"];
	self.category = [dictionary objectForKey:@"category"];
	self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
	self.uniqueKey = [dictionary objectForKey:@"uniquekey"];
	self.title = [dictionary objectForKey:@"title"];
	self.date = [dictionary objectForKey:@"date"];
	self.authorName = [dictionary objectForKey:@"author_name"];
	self.articleUrl = [dictionary objectForKey:@"url"];
}

@end
