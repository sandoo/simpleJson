//
//  SponsorPayOfferTypes.h
//
//  Created by davut kilinc on 3.04.2014
//  Copyright (c) 2014 tmob. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SponsorPayOfferTypes : NSObject <NSCoding>

@property (nonatomic, strong) NSString *offerTypeId;
@property (nonatomic, strong) NSString *readable;

+ (SponsorPayOfferTypes *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
