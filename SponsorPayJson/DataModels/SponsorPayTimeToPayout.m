//
//  SponsorPayTimeToPayout.m
//
//  Created by davut kilinc on 3.04.2014
//  Copyright (c) 2014 tmob. All rights reserved.
//

#import "SponsorPayTimeToPayout.h"


NSString *const kSponsorPayTimeToPayoutAmount = @"amount";
NSString *const kSponsorPayTimeToPayoutReadable = @"readable";


@interface SponsorPayTimeToPayout ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SponsorPayTimeToPayout

@synthesize amount = _amount;
@synthesize readable = _readable;


+ (SponsorPayTimeToPayout *)modelObjectWithDictionary:(NSDictionary *)dict
{
    SponsorPayTimeToPayout *instance = [[SponsorPayTimeToPayout alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.amount = [self objectOrNilForKey:kSponsorPayTimeToPayoutAmount fromDictionary:dict];
            self.readable = [self objectOrNilForKey:kSponsorPayTimeToPayoutReadable fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.amount forKey:kSponsorPayTimeToPayoutAmount];
    [mutableDict setValue:self.readable forKey:kSponsorPayTimeToPayoutReadable];

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

    self.amount = [aDecoder decodeObjectForKey:kSponsorPayTimeToPayoutAmount];
    self.readable = [aDecoder decodeObjectForKey:kSponsorPayTimeToPayoutReadable];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_amount forKey:kSponsorPayTimeToPayoutAmount];
    [aCoder encodeObject:_readable forKey:kSponsorPayTimeToPayoutReadable];
}


@end
