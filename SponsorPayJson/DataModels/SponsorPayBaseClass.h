//
//  SponsorPayBaseClass.h
//
//  Created by davut kilinc on 3.04.2014
//  Copyright (c) 2014 tmob. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SponsorPayInformation;

@interface SponsorPayBaseClass : NSObject <NSCoding>

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *pages;
@property (nonatomic, strong) NSString *count;
@property (nonatomic, strong) SponsorPayInformation *information;
@property (nonatomic, strong) NSArray *offers;

+ (SponsorPayBaseClass *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
