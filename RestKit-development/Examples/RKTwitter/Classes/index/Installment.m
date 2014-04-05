//
//  Installment.m
//
//  Created by   on 04/02/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Installment.h"


NSString *const kInstallmentMax = @"max";
NSString *const kInstallmentDisplayText = @"displayText";


@interface Installment ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Installment

@synthesize max = _max;
@synthesize displayText = _displayText;


+ (Installment *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Installment *instance = [[Installment alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.max = [[self objectOrNilForKey:kInstallmentMax fromDictionary:dict] doubleValue];
            self.displayText = [self objectOrNilForKey:kInstallmentDisplayText fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.max] forKey:kInstallmentMax];
    [mutableDict setValue:self.displayText forKey:kInstallmentDisplayText];

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

    self.max = [aDecoder decodeDoubleForKey:kInstallmentMax];
    self.displayText = [aDecoder decodeObjectForKey:kInstallmentDisplayText];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_max forKey:kInstallmentMax];
    [aCoder encodeObject:_displayText forKey:kInstallmentDisplayText];
}


@end
