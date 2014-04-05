//
//  ListPrice.h
//
//  Created by   on 04/02/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ListPrice : NSObject <NSCoding>

@property (nonatomic, assign) double amount;
@property (nonatomic, strong) NSString *currency;

+ (ListPrice *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
