//
//  MappingManager.m
//  SponsorPayJson
//
//  Created by davut on 3.04.2014.
//  Copyright (c) 2014 davut. All rights reserved.
//

#import "MappingManager.h"

@implementation MappingManager



+(RKObjectMapping *)mapForItems
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[SponsorPayBaseClass class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"code" : @"code",
                                                  @"message" : @"message",
                                                  @"pages": @"pages",
                                                  @"count": @"count"
                                                  }];
    RKRelationshipMapping* relationShipMappingInformation = [RKRelationshipMapping relationshipMappingFromKeyPath:@"information"
                                                                                             toKeyPath:@"information"
                                                                                           withMapping:[[self class] mapForInformation]];
    
    [mapping addPropertyMapping:relationShipMappingInformation];
    
    RKRelationshipMapping* relationShipMappingForOffers = [RKRelationshipMapping relationshipMappingFromKeyPath:@"offers"
                                                                                                         toKeyPath:@"offers"
                                                                                                       withMapping:[[self class] mapForOffers]];
    
    [mapping addPropertyMapping:relationShipMappingForOffers];
    
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping
                                                                                            method:RKRequestMethodGET
                                                                                       pathPattern:nil
                                                                                           keyPath:nil
                                                                                       statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    [[RKObjectManager sharedManager] addResponseDescriptor:responseDescriptor];
    
    return mapping;
}


+(RKObjectMapping *)mapForInformation
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[SponsorPayInformation class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"language" : @"language",
                                                  @"appName": @"appName",
                                                  @"appid" : @"appid",
                                                  @"virtualCurrency" : @"virtualCurrency",
                                                  @"country": @"country",
                                                  @"supportUrl": @"supportUrl"
                                                  }];
    return mapping;
}



+(RKObjectMapping *)mapForOffers
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[SponsorPayOffers class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"payout" : @"payout",
                                                  @"offerId": @"offerId",
                                                  @"title" : @"title",
                                                  @"link" : @"link",
                                                  @"teaser": @"teaser",
                                                  @"requiredActions": @"requiredActions"
                                                  }];
    
    RKRelationshipMapping* relationShipMappingThumbnail = [RKRelationshipMapping relationshipMappingFromKeyPath:@"thumbnail"
                                                                                             toKeyPath:@"thumbnail"
                                                                                           withMapping:[[self class] mapForThumbnail]];
    
    [mapping addPropertyMapping:relationShipMappingThumbnail];
    
    RKRelationshipMapping* relationShipMappingTimeToPayout = [RKRelationshipMapping relationshipMappingFromKeyPath:@"timeToPayout"
                                                                                             toKeyPath:@"timeToPayout"
                                                                                           withMapping:[[self class] mapForTimeToPayout]];
    
    [mapping addPropertyMapping:relationShipMappingTimeToPayout];
    
    RKRelationshipMapping* relationShipMappingOfferTypes = [RKRelationshipMapping relationshipMappingFromKeyPath:@"offerTypes"
                                                                                             toKeyPath:@"offerTypes"
                                                                                           withMapping:[[self class] mapForOfferTypes]];
    
    [mapping addPropertyMapping:relationShipMappingOfferTypes];
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping
                                                                                            method:RKRequestMethodGET
                                                                                       pathPattern:nil
                                                                                           keyPath:nil
                                                                                       statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    [[RKObjectManager sharedManager] addResponseDescriptor:responseDescriptor];
    
    return mapping;
}
+(RKObjectMapping *)mapForThumbnail
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[SponsorPayThumbnail class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"lowres" : @"lowres",
                                                  @"hires": @"hires"
                                                  }];
    return mapping;
}
+(RKObjectMapping *)mapForTimeToPayout
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[SponsorPayTimeToPayout class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"amount" : @"amount",
                                                  @"readable": @"readable"
                                                  }];
    return mapping;
}
+(RKObjectMapping *)mapForOfferTypes
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[SponsorPayOfferTypes class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"offerTypeId" : @"offerTypeId",
                                                  @"readable": @"readable",
                                                  }];
    return mapping;
}
@end
