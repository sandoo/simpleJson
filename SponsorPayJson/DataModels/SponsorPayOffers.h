//
//  SponsorPayOffers.h
//
//  Created by davut kilinc on 3.04.2014
//  Copyright (c) 2014 tmob. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SponsorPayTimeToPayout, SponsorPayThumbnail;

@interface SponsorPayOffers : NSObject <NSCoding>

@property (nonatomic, strong) NSString *payout;
@property (nonatomic, strong) SponsorPayTimeToPayout *timeToPayout;
@property (nonatomic, strong) SponsorPayThumbnail *thumbnail;
@property (nonatomic, strong) NSArray *offerTypes;
@property (nonatomic, strong) NSString *offerId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *teaser;
@property (nonatomic, strong) NSString *requiredActions;

+ (SponsorPayOffers *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
