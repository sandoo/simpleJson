//
//  Groups.h
//
//  Created by   on 04/02/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Groups : NSObject <NSCoding>

@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *displayName;

+ (Groups *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
