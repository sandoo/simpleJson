//
//  SponsorPayBaseClass.m
//
//  Created by davut kilinc on 3.04.2014
//  Copyright (c) 2014 tmob. All rights reserved.
//

#import "SponsorPayBaseClass.h"
#import "SponsorPayInformation.h"
#import "SponsorPayOffers.h"


NSString *const kSponsorPayBaseClassCode = @"code";
NSString *const kSponsorPayBaseClassMessage = @"message";
NSString *const kSponsorPayBaseClassPages = @"pages";
NSString *const kSponsorPayBaseClassCount = @"count";
NSString *const kSponsorPayBaseClassInformation = @"information";
NSString *const kSponsorPayBaseClassOffers = @"offers";


@interface SponsorPayBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SponsorPayBaseClass

@synthesize code = _code;
@synthesize message = _message;
@synthesize pages = _pages;
@synthesize count = _count;
@synthesize information = _information;
@synthesize offers = _offers;


+ (SponsorPayBaseClass *)modelObjectWithDictionary:(NSDictionary *)dict
{
    SponsorPayBaseClass *instance = [[SponsorPayBaseClass alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:kSponsorPayBaseClassCode fromDictionary:dict];
            self.message = [self objectOrNilForKey:kSponsorPayBaseClassMessage fromDictionary:dict];
            self.pages = [self objectOrNilForKey:kSponsorPayBaseClassPages fromDictionary:dict];
            self.count = [self objectOrNilForKey:kSponsorPayBaseClassCount fromDictionary:dict];
            self.information = [SponsorPayInformation modelObjectWithDictionary:[dict objectForKey:kSponsorPayBaseClassInformation]];
    NSObject *receivedSponsorPayOffers = [dict objectForKey:kSponsorPayBaseClassOffers];
    NSMutableArray *parsedSponsorPayOffers = [NSMutableArray array];
    if ([receivedSponsorPayOffers isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSponsorPayOffers) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSponsorPayOffers addObject:[SponsorPayOffers modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSponsorPayOffers isKindOfClass:[NSDictionary class]]) {
       [parsedSponsorPayOffers addObject:[SponsorPayOffers modelObjectWithDictionary:(NSDictionary *)receivedSponsorPayOffers]];
    }

    self.offers = [NSArray arrayWithArray:parsedSponsorPayOffers];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kSponsorPayBaseClassCode];
    [mutableDict setValue:self.message forKey:kSponsorPayBaseClassMessage];
    [mutableDict setValue:self.pages forKey:kSponsorPayBaseClassPages];
    [mutableDict setValue:self.count forKey:kSponsorPayBaseClassCount];
    [mutableDict setValue:[self.information dictionaryRepresentation] forKey:kSponsorPayBaseClassInformation];
NSMutableArray *tempArrayForOffers = [NSMutableArray array];
    for (NSObject *subArrayObject in self.offers) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForOffers addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForOffers addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOffers] forKey:@"kSponsorPayBaseClassOffers"];

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

    self.code = [aDecoder decodeObjectForKey:kSponsorPayBaseClassCode];
    self.message = [aDecoder decodeObjectForKey:kSponsorPayBaseClassMessage];
    self.pages = [aDecoder decodeObjectForKey:kSponsorPayBaseClassPages];
    self.count = [aDecoder decodeObjectForKey:kSponsorPayBaseClassCount];
    self.information = [aDecoder decodeObjectForKey:kSponsorPayBaseClassInformation];
    self.offers = [aDecoder decodeObjectForKey:kSponsorPayBaseClassOffers];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kSponsorPayBaseClassCode];
    [aCoder encodeObject:_message forKey:kSponsorPayBaseClassMessage];
    [aCoder encodeObject:_pages forKey:kSponsorPayBaseClassPages];
    [aCoder encodeObject:_count forKey:kSponsorPayBaseClassCount];
    [aCoder encodeObject:_information forKey:kSponsorPayBaseClassInformation];
    [aCoder encodeObject:_offers forKey:kSponsorPayBaseClassOffers];
}


@end
