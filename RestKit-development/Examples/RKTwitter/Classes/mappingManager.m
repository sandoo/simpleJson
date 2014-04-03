//
//  mappingManager.m
//  RKTwitter
//
//  Created by tmob on 04/02/14.
//
//

#import "mappingManager.h"
#import "DataModels.h"
@implementation mappingManager

+(RKObjectMapping *)mapForUser
{
    
    RKObjectMapping *userMapping = [RKObjectMapping mappingForClass:[baseIndexModel class]];
    [userMapping addAttributeMappingsFromDictionary:@{
                                                      @"ads" : @"ads"
                                                      }];
    RKRelationshipMapping* relationShipMapping = [RKRelationshipMapping relationshipMappingFromKeyPath:@"groups"
                                                                                             toKeyPath:@"groups"
                                                                                           withMapping:[[self class] mapForGroups]];

    [userMapping addPropertyMapping:relationShipMapping];
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:userMapping
                                                                                            method:RKRequestMethodGET
                                                                                       pathPattern:nil
                                                                                           keyPath:nil
                                                                                       statusCodes:[NSIndexSet indexSetWithIndex:200]];
    [[RKObjectManager sharedManager] removeResponseDescriptor:responseDescriptor];  // remove first then add one
    [[RKObjectManager sharedManager] addResponseDescriptor:responseDescriptor];
    
    
    return userMapping;
}

+(RKObjectMapping *)mapForGroups
{
        RKObjectMapping *groupsMapping = [RKObjectMapping mappingForClass:[Groups class]];
        [groupsMapping addAttributeMappingsFromDictionary:@{
                                                      @"image" : @"image",
                                                      @"displayName": @"displayName"
                                                      }];
    
    RKRelationshipMapping* relationShipMapping = [RKRelationshipMapping relationshipMappingFromKeyPath:@"items"
                                                                                             toKeyPath:@"items"
                                                                                           withMapping:[[self class] mapForItems]];
    
    [groupsMapping addPropertyMapping:relationShipMapping];
    
    return groupsMapping;
}
+(RKObjectMapping *)mapForItems
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[Items class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                        @"type" : @"type",
                                                        @"productId" : @"productId",
                                                        @"headline": @"headline",
                                                        @"productName": @"productName",
                                                        @"picture": @"picture",
                                                        @"comments": @"comments",
                                                        @"points": @"points"
                                                        }];
    RKRelationshipMapping* relationShipMapping = [RKRelationshipMapping relationshipMappingFromKeyPath:@"strikeoutPrice"
                                                                                             toKeyPath:@"strikeoutPrice"
                                                                                           withMapping:[[self class] mapForStrikeOutPrice]];
    
    [mapping addPropertyMapping:relationShipMapping];
    
    RKRelationshipMapping* relationShipMappingForListPrice = [RKRelationshipMapping relationshipMappingFromKeyPath:@"listPrice"
                                                                                             toKeyPath:@"listPrice"
                                                                                           withMapping:[[self class] mapForListPrice]];
    
    [mapping addPropertyMapping:relationShipMappingForListPrice];
    
    RKRelationshipMapping* relationShipMappingForInstallment = [RKRelationshipMapping relationshipMappingFromKeyPath:@"installment"
                                                                                             toKeyPath:@"installment"
                                                                                           withMapping:[[self class] mapForInstallments]];
    
    [mapping addPropertyMapping:relationShipMappingForInstallment];
    return mapping;
}
+(RKObjectMapping *)mapForStrikeOutPrice
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[StrikeoutPrice class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                        @"amount" : @"amount",
                                                        @"currency" : @"currency"
                                                        }];
    return mapping;
}
+(RKObjectMapping *)mapForListPrice
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[ListPrice class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"amount" : @"amount",
                                                  @"currency" : @"currency"
                                                  }];
    return mapping;
}
+(RKObjectMapping *)mapForInstallments
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[Installment class]];
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"max" : @"max",
                                                  @"displayText" : @"displayText"
                                                  }];
    return mapping;
}

@end
