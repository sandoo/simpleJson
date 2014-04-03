//
//  StrikeoutPrice.m
//
//  Created by   on 04/02/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "StrikeoutPrice.h"


NSString *const kStrikeoutPriceAmount = @"amount";
NSString *const kStrikeoutPriceCurrency = @"currency";


@interface StrikeoutPrice ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation StrikeoutPrice

@synthesize amount = _amount;
@synthesize currency = _currency;


+ (StrikeoutPrice *)modelObjectWithDictionary:(NSDictionary *)dict
{
    StrikeoutPrice *instance = [[StrikeoutPrice alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.amount = [[self objectOrNilForKey:kStrikeoutPriceAmount fromDictionary:dict] doubleValue];
            self.currency = [self objectOrNilForKey:kStrikeoutPriceCurrency fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amount] forKey:kStrikeoutPriceAmount];
    [mutableDict setValue:self.currency forKey:kStrikeoutPriceCurrency];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.amount = [aDecoder decodeDoubleForKey:kStrikeoutPriceAmount];
    self.currency = [aDecoder decodeObjectForKey:kStrikeoutPriceCurrency];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_amount forKey:kStrikeoutPriceAmount];
    [aCoder encodeObject:_currency forKey:kStrikeoutPriceCurrency];
}


@end
