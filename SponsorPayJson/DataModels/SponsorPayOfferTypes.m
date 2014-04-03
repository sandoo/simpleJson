//
//  SponsorPayOfferTypes.m
//
//  Created by davut kilinc on 3.04.2014
//  Copyright (c) 2014 tmob. All rights reserved.
//

#import "SponsorPayOfferTypes.h"


NSString *const kSponsorPayOfferTypesOfferTypeId = @"offer_type_id";
NSString *const kSponsorPayOfferTypesReadable = @"readable";


@interface SponsorPayOfferTypes ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SponsorPayOfferTypes

@synthesize offerTypeId = _offerTypeId;
@synthesize readable = _readable;


+ (SponsorPayOfferTypes *)modelObjectWithDictionary:(NSDictionary *)dict
{
    SponsorPayOfferTypes *instance = [[SponsorPayOfferTypes alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.offerTypeId = [self objectOrNilForKey:kSponsorPayOfferTypesOfferTypeId fromDictionary:dict];
            self.readable = [self objectOrNilForKey:kSponsorPayOfferTypesReadable fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.offerTypeId forKey:kSponsorPayOfferTypesOfferTypeId];
    [mutableDict setValue:self.readable forKey:kSponsorPayOfferTypesReadable];

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

    self.offerTypeId = [aDecoder decodeObjectForKey:kSponsorPayOfferTypesOfferTypeId];
    self.readable = [aDecoder decodeObjectForKey:kSponsorPayOfferTypesReadable];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_offerTypeId forKey:kSponsorPayOfferTypesOfferTypeId];
    [aCoder encodeObject:_readable forKey:kSponsorPayOfferTypesReadable];
}


@end
