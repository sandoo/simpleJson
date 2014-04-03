//
//  SponsorPayInformation.h
//
//  Created by davut kilinc on 3.04.2014
//  Copyright (c) 2014 tmob. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SponsorPayInformation : NSObject <NSCoding>

@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *appName;
@property (nonatomic, strong) NSString *appid;
@property (nonatomic, strong) NSString *virtualCurrency;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *supportUrl;

+ (SponsorPayInformation *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
