//
//  SponsorPayOffers.m
//
//  Created by davut kilinc on 3.04.2014
//  Copyright (c) 2014 tmob. All rights reserved.
//

#import "SponsorPayOffers.h"
#import "SponsorPayTimeToPayout.h"
#import "SponsorPayThumbnail.h"
#import "SponsorPayOfferTypes.h"


NSString *const kSponsorPayOffersPayout = @"payout";
NSString *const kSponsorPayOffersTimeToPayout = @"time_to_payout";
NSString *const kSponsorPayOffersThumbnail = @"thumbnail";
NSString *const kSponsorPayOffersOfferTypes = @"offer_types";
NSString *const kSponsorPayOffersOfferId = @"offer_id";
NSString *const kSponsorPayOffersTitle = @"title";
NSString *const kSponsorPayOffersLink = @"link";
NSString *const kSponsorPayOffersTeaser = @" teaser ";
NSString *const kSponsorPayOffersRequiredActions = @" required _actions ";


@interface SponsorPayOffers ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SponsorPayOffers

@synthesize payout = _payout;
@synthesize timeToPayout = _timeToPayout;
@synthesize thumbnail = _thumbnail;
@synthesize offerTypes = _offerTypes;
@synthesize offerId = _offerId;
@synthesize title = _title;
@synthesize link = _link;
@synthesize teaser = _teaser;
@synthesize requiredActions = _requiredActions;


+ (SponsorPayOffers *)modelObjectWithDictionary:(NSDictionary *)dict
{
    SponsorPayOffers *instance = [[SponsorPayOffers alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.payout = [self objectOrNilForKey:kSponsorPayOffersPayout fromDictionary:dict];
            self.timeToPayout = [SponsorPayTimeToPayout modelObjectWithDictionary:[dict objectForKey:kSponsorPayOffersTimeToPayout]];
            self.thumbnail = [SponsorPayThumbnail modelObjectWithDictionary:[dict objectForKey:kSponsorPayOffersThumbnail]];
    NSObject *receivedSponsorPayOfferTypes = [dict objectForKey:kSponsorPayOffersOfferTypes];
    NSMutableArray *parsedSponsorPayOfferTypes = [NSMutableArray array];
    if ([receivedSponsorPayOfferTypes isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSponsorPayOfferTypes) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSponsorPayOfferTypes addObject:[SponsorPayOfferTypes modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSponsorPayOfferTypes isKindOfClass:[NSDictionary class]]) {
       [parsedSponsorPayOfferTypes addObject:[SponsorPayOfferTypes modelObjectWithDictionary:(NSDictionary *)receivedSponsorPayOfferTypes]];
    }

    self.offerTypes = [NSArray arrayWithArray:parsedSponsorPayOfferTypes];
            self.offerId = [self objectOrNilForKey:kSponsorPayOffersOfferId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kSponsorPayOffersTitle fromDictionary:dict];
            self.link = [self objectOrNilForKey:kSponsorPayOffersLink fromDictionary:dict];
            self.teaser = [self objectOrNilForKey:kSponsorPayOffersTeaser fromDictionary:dict];
            self.requiredActions = [self objectOrNilForKey:kSponsorPayOffersRequiredActions fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.payout forKey:kSponsorPayOffersPayout];
    [mutableDict setValue:[self.timeToPayout dictionaryRepresentation] forKey:kSponsorPayOffersTimeToPayout];
    [mutableDict setValue:[self.thumbnail dictionaryRepresentation] forKey:kSponsorPayOffersThumbnail];
NSMutableArray *tempArrayForOfferTypes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.offerTypes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForOfferTypes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForOfferTypes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOfferTypes] forKey:@"kSponsorPayOffersOfferTypes"];
    [mutableDict setValue:self.offerId forKey:kSponsorPayOffersOfferId];
    [mutableDict setValue:self.title forKey:kSponsorPayOffersTitle];
    [mutableDict setValue:self.link forKey:kSponsorPayOffersLink];
    [mutableDict setValue:self.teaser forKey:kSponsorPayOffersTeaser];
    [mutableDict setValue:self.requiredActions forKey:kSponsorPayOffersRequiredActions];

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

    self.payout = [aDecoder decodeObjectForKey:kSponsorPayOffersPayout];
    self.timeToPayout = [aDecoder decodeObjectForKey:kSponsorPayOffersTimeToPayout];
    self.thumbnail = [aDecoder decodeObjectForKey:kSponsorPayOffersThumbnail];
    self.offerTypes = [aDecoder decodeObjectForKey:kSponsorPayOffersOfferTypes];
    self.offerId = [aDecoder decodeObjectForKey:kSponsorPayOffersOfferId];
    self.title = [aDecoder decodeObjectForKey:kSponsorPayOffersTitle];
    self.link = [aDecoder decodeObjectForKey:kSponsorPayOffersLink];
    self.teaser = [aDecoder decodeObjectForKey:kSponsorPayOffersTeaser];
    self.requiredActions = [aDecoder decodeObjectForKey:kSponsorPayOffersRequiredActions];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_payout forKey:kSponsorPayOffersPayout];
    [aCoder encodeObject:_timeToPayout forKey:kSponsorPayOffersTimeToPayout];
    [aCoder encodeObject:_thumbnail forKey:kSponsorPayOffersThumbnail];
    [aCoder encodeObject:_offerTypes forKey:kSponsorPayOffersOfferTypes];
    [aCoder encodeObject:_offerId forKey:kSponsorPayOffersOfferId];
    [aCoder encodeObject:_title forKey:kSponsorPayOffersTitle];
    [aCoder encodeObject:_link forKey:kSponsorPayOffersLink];
    [aCoder encodeObject:_teaser forKey:kSponsorPayOffersTeaser];
    [aCoder encodeObject:_requiredActions forKey:kSponsorPayOffersRequiredActions];
}


@end
