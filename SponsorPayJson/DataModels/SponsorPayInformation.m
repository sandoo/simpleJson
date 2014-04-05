//
//  SponsorPayInformation.m
//
//  Created by davut kilinc on 3.04.2014
//  Copyright (c) 2014 tmob. All rights reserved.
//

#import "SponsorPayInformation.h"


NSString *const kSponsorPayInformationLanguage = @"language";
NSString *const kSponsorPayInformationAppName = @"app_name";
NSString *const kSponsorPayInformationAppid = @"appid";
NSString *const kSponsorPayInformationVirtualCurrency = @" virtual_ currency";
NSString *const kSponsorPayInformationCountry = @"country";
NSString *const kSponsorPayInformationSupportUrl = @"support_url";


@interface SponsorPayInformation ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SponsorPayInformation

@synthesize language = _language;
@synthesize appName = _appName;
@synthesize appid = _appid;
@synthesize virtualCurrency = _virtualCurrency;
@synthesize country = _country;
@synthesize supportUrl = _supportUrl;


+ (SponsorPayInformation *)modelObjectWithDictionary:(NSDictionary *)dict
{
    SponsorPayInformation *instance = [[SponsorPayInformation alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.language = [self objectOrNilForKey:kSponsorPayInformationLanguage fromDictionary:dict];
            self.appName = [self objectOrNilForKey:kSponsorPayInformationAppName fromDictionary:dict];
            self.appid = [self objectOrNilForKey:kSponsorPayInformationAppid fromDictionary:dict];
            self.virtualCurrency = [self objectOrNilForKey:kSponsorPayInformationVirtualCurrency fromDictionary:dict];
            self.country = [self objectOrNilForKey:kSponsorPayInformationCountry fromDictionary:dict];
            self.supportUrl = [self objectOrNilForKey:kSponsorPayInformationSupportUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.language forKey:kSponsorPayInformationLanguage];
    [mutableDict setValue:self.appName forKey:kSponsorPayInformationAppName];
    [mutableDict setValue:self.appid forKey:kSponsorPayInformationAppid];
    [mutableDict setValue:self.virtualCurrency forKey:kSponsorPayInformationVirtualCurrency];
    [mutableDict setValue:self.country forKey:kSponsorPayInformationCountry];
    [mutableDict setValue:self.supportUrl forKey:kSponsorPayInformationSupportUrl];

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

    self.language = [aDecoder decodeObjectForKey:kSponsorPayInformationLanguage];
    self.appName = [aDecoder decodeObjectForKey:kSponsorPayInformationAppName];
    self.appid = [aDecoder decodeObjectForKey:kSponsorPayInformationAppid];
    self.virtualCurrency = [aDecoder decodeObjectForKey:kSponsorPayInformationVirtualCurrency];
    self.country = [aDecoder decodeObjectForKey:kSponsorPayInformationCountry];
    self.supportUrl = [aDecoder decodeObjectForKey:kSponsorPayInformationSupportUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_language forKey:kSponsorPayInformationLanguage];
    [aCoder encodeObject:_appName forKey:kSponsorPayInformationAppName];
    [aCoder encodeObject:_appid forKey:kSponsorPayInformationAppid];
    [aCoder encodeObject:_virtualCurrency forKey:kSponsorPayInformationVirtualCurrency];
    [aCoder encodeObject:_country forKey:kSponsorPayInformationCountry];
    [aCoder encodeObject:_supportUrl forKey:kSponsorPayInformationSupportUrl];
}


@end
