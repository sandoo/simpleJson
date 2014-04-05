//
//  SponsorPayThumbnail.h
//
//  Created by davut kilinc on 3.04.2014
//  Copyright (c) 2014 tmob. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SponsorPayThumbnail : NSObject <NSCoding>

@property (nonatomic, strong) NSString *lowres;
@property (nonatomic, strong) NSString *hires;

+ (SponsorPayThumbnail *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
