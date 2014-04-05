//
//  Items.h
//
//  Created by   on 04/02/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListPrice, StrikeoutPrice, Installment;

@interface Items : NSObject <NSCoding>

@property (nonatomic, assign) double points;
@property (nonatomic, strong) ListPrice *listPrice;
@property (nonatomic, assign) double comments;
@property (nonatomic, strong) NSString *productId;
@property (nonatomic, strong) NSString *productName;
@property (nonatomic, strong) StrikeoutPrice *strikeoutPrice;
@property (nonatomic, strong) NSString *picture;
@property (nonatomic, strong) Installment *installment;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *headline;

+ (Items *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
