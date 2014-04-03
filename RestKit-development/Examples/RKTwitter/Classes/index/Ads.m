//
//  Ads.m
//
//  Created by   on 04/02/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Ads.h"
#import "Action.h"


NSString *const kAdsPicture = @"picture";
NSString *const kAdsDisplayName = @"displayName";
NSString *const kAdsImage = @"image";
NSString *const kAdsType = @"type";
NSString *const kAdsAction = @"action";


@interface Ads ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Ads

@synthesize picture = _picture;
@synthesize displayName = _displayName;
@synthesize image = _image;
@synthesize type = _type;
@synthesize action = _action;


+ (Ads *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Ads *instance = [[Ads alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.picture = [self objectOrNilForKey:kAdsPicture fromDictionary:dict];
            self.displayName = [self objectOrNilForKey:kAdsDisplayName fromDictionary:dict];
            self.image = [self objectOrNilForKey:kAdsImage fromDictionary:dict];
            self.type = [self objectOrNilForKey:kAdsType fromDictionary:dict];
            self.action = [Action modelObjectWithDictionary:[dict objectForKey:kAdsAction]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.picture forKey:kAdsPicture];
    [mutableDict setValue:self.displayName forKey:kAdsDisplayName];
    [mutableDict setValue:self.image forKey:kAdsImage];
    [mutableDict setValue:self.type forKey:kAdsType];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kAdsAction];

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

    self.picture = [aDecoder decodeObjectForKey:kAdsPicture];
    self.displayName = [aDecoder decodeObjectForKey:kAdsDisplayName];
    self.image = [aDecoder decodeObjectForKey:kAdsImage];
    self.type = [aDecoder decodeObjectForKey:kAdsType];
    self.action = [aDecoder decodeObjectForKey:kAdsAction];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_picture forKey:kAdsPicture];
    [aCoder encodeObject:_displayName forKey:kAdsDisplayName];
    [aCoder encodeObject:_image forKey:kAdsImage];
    [aCoder encodeObject:_type forKey:kAdsType];
    [aCoder encodeObject:_action forKey:kAdsAction];
}


@end
