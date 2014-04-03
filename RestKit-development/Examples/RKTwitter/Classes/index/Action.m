//
//  Action.m
//
//  Created by   on 04/02/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Action.h"


NSString *const kActionType = @"type";
NSString *const kActionHref = @"href";
NSString *const kActionProductId = @"productId";


@interface Action ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Action

@synthesize type = _type;
@synthesize href = _href;
@synthesize productId = _productId;


+ (Action *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Action *instance = [[Action alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.type = [self objectOrNilForKey:kActionType fromDictionary:dict];
            self.href = [self objectOrNilForKey:kActionHref fromDictionary:dict];
            self.productId = [self objectOrNilForKey:kActionProductId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.type forKey:kActionType];
    [mutableDict setValue:self.href forKey:kActionHref];
    [mutableDict setValue:self.productId forKey:kActionProductId];

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

    self.type = [aDecoder decodeObjectForKey:kActionType];
    self.href = [aDecoder decodeObjectForKey:kActionHref];
    self.productId = [aDecoder decodeObjectForKey:kActionProductId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_type forKey:kActionType];
    [aCoder encodeObject:_href forKey:kActionHref];
    [aCoder encodeObject:_productId forKey:kActionProductId];
}


@end
