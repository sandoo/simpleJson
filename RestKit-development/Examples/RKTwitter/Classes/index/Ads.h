//
//  Ads.h
//
//  Created by   on 04/02/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Action;

@interface Ads : NSObject <NSCoding>

@property (nonatomic, strong) NSString *picture;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) Action *action;

+ (Ads *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
