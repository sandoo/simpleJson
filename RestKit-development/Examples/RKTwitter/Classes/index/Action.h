//
//  Action.h
//
//  Created by   on 04/02/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Action : NSObject <NSCoding>

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *href;
@property (nonatomic, strong) NSString *productId;

+ (Action *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
