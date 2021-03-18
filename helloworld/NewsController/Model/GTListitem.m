//
//  GTListitem.m
//  helloworld
//
//  Created by Jack Wang on 3/18/21.
//

#import "GTListitem.h"

@implementation GTListitem

- (void)configWithDictionary:(NSDictionary *)dictionary {

#warning message
	self.v4=[dictionary objectForKey:@"key31"];
	self.v5=[dictionary objectForKey:@"key32"];
}

@end
