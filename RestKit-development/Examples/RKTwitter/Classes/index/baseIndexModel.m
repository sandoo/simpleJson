//
//  baseIndexModel.m
//
//  Created by   on 04/02/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "baseIndexModel.h"
#import "Ads.h"
#import "Groups.h"


NSString *const kbaseIndexModelAds = @"ads";
NSString *const kbaseIndexModelGroups = @"groups";


@interface baseIndexModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation baseIndexModel

@synthesize ads = _ads;
@synthesize groups = _groups;


+ (baseIndexModel *)modelObjectWithDictionary:(NSDictionary *)dict
{
    baseIndexModel *instance = [[baseIndexModel alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedAds = [dict objectForKey:kbaseIndexModelAds];
    NSMutableArray *parsedAds = [NSMutableArray array];
    if ([receivedAds isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAds) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAds addObject:[Ads modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAds isKindOfClass:[NSDictionary class]]) {
       [parsedAds addObject:[Ads modelObjectWithDictionary:(NSDictionary *)receivedAds]];
    }

    self.ads = [NSArray arrayWithArray:parsedAds];
    NSObject *receivedGroups = [dict objectForKey:kbaseIndexModelGroups];
    NSMutableArray *parsedGroups = [NSMutableArray array];
    if ([receivedGroups isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGroups) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGroups addObject:[Groups modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGroups isKindOfClass:[NSDictionary class]]) {
       [parsedGroups addObject:[Groups modelObjectWithDictionary:(NSDictionary *)receivedGroups]];
    }

    self.groups = [NSArray arrayWithArray:parsedGroups];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
NSMutableArray *tempArrayForAds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.ads) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAds] forKey:@"kbaseIndexModelAds"];
NSMutableArray *tempArrayForGroups = [NSMutableArray array];
    for (NSObject *subArrayObject in self.groups) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGroups addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGroups addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGroups] forKey:@"kbaseIndexModelGroups"];

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

    self.ads = [aDecoder decodeObjectForKey:kbaseIndexModelAds];
    self.groups = [aDecoder decodeObjectForKey:kbaseIndexModelGroups];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ads forKey:kbaseIndexModelAds];
    [aCoder encodeObject:_groups forKey:kbaseIndexModelGroups];
}


@end
