//
//  ListPrice.m
//
//  Created by   on 04/02/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "ListPrice.h"


NSString *const kListPriceAmount = @"amount";
NSString *const kListPriceCurrency = @"currency";


@interface ListPrice ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ListPrice

@synthesize amount = _amount;
@synthesize currency = _currency;


+ (ListPrice *)modelObjectWithDictionary:(NSDictionary *)dict
{
    ListPrice *instance = [[ListPrice alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.amount = [[self objectOrNilForKey:kListPriceAmount fromDictionary:dict] doubleValue];
            self.currency = [self objectOrNilForKey:kListPriceCurrency fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amount] forKey:kListPriceAmount];
    [mutableDict setValue:self.currency forKey:kListPriceCurrency];

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

    self.amount = [aDecoder decodeDoubleForKey:kListPriceAmount];
    self.currency = [aDecoder decodeObjectForKey:kListPriceCurrency];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_amount forKey:kListPriceAmount];
    [aCoder encodeObject:_currency forKey:kListPriceCurrency];
}


@end
