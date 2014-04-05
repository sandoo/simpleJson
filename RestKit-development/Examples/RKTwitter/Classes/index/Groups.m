//
//  Groups.m
//
//  Created by   on 04/02/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Groups.h"
#import "Items.h"


NSString *const kGroupsImage = @"image";
NSString *const kGroupsItems = @"items";
NSString *const kGroupsDisplayName = @"displayName";


@interface Groups ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Groups

@synthesize image = _image;
@synthesize items = _items;
@synthesize displayName = _displayName;


+ (Groups *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Groups *instance = [[Groups alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.image = [self objectOrNilForKey:kGroupsImage fromDictionary:dict];
    NSObject *receivedItems = [dict objectForKey:kGroupsItems];
    NSMutableArray *parsedItems = [NSMutableArray array];
    if ([receivedItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedItems addObject:[Items modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedItems isKindOfClass:[NSDictionary class]]) {
       [parsedItems addObject:[Items modelObjectWithDictionary:(NSDictionary *)receivedItems]];
    }

    self.items = [NSArray arrayWithArray:parsedItems];
            self.displayName = [self objectOrNilForKey:kGroupsDisplayName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.image forKey:kGroupsImage];
NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:@"kGroupsItems"];
    [mutableDict setValue:self.displayName forKey:kGroupsDisplayName];

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

    self.image = [aDecoder decodeObjectForKey:kGroupsImage];
    self.items = [aDecoder decodeObjectForKey:kGroupsItems];
    self.displayName = [aDecoder decodeObjectForKey:kGroupsDisplayName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_image forKey:kGroupsImage];
    [aCoder encodeObject:_items forKey:kGroupsItems];
    [aCoder encodeObject:_displayName forKey:kGroupsDisplayName];
}


@end
