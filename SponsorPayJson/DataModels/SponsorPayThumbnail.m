//
//  SponsorPayThumbnail.m
//
//  Created by davut kilinc on 3.04.2014
//  Copyright (c) 2014 tmob. All rights reserved.
//

#import "SponsorPayThumbnail.h"


NSString *const kSponsorPayThumbnailLowres = @"lowres";
NSString *const kSponsorPayThumbnailHires = @"hires";


@interface SponsorPayThumbnail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SponsorPayThumbnail

@synthesize lowres = _lowres;
@synthesize hires = _hires;


+ (SponsorPayThumbnail *)modelObjectWithDictionary:(NSDictionary *)dict
{
    SponsorPayThumbnail *instance = [[SponsorPayThumbnail alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.lowres = [self objectOrNilForKey:kSponsorPayThumbnailLowres fromDictionary:dict];
            self.hires = [self objectOrNilForKey:kSponsorPayThumbnailHires fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.lowres forKey:kSponsorPayThumbnailLowres];
    [mutableDict setValue:self.hires forKey:kSponsorPayThumbnailHires];

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

    self.lowres = [aDecoder decodeObjectForKey:kSponsorPayThumbnailLowres];
    self.hires = [aDecoder decodeObjectForKey:kSponsorPayThumbnailHires];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_lowres forKey:kSponsorPayThumbnailLowres];
    [aCoder encodeObject:_hires forKey:kSponsorPayThumbnailHires];
}


@end
