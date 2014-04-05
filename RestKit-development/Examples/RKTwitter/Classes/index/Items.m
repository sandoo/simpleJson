//
//  Items.m
//
//  Created by   on 04/02/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Items.h"
#import "ListPrice.h"
#import "StrikeoutPrice.h"
#import "Installment.h"


NSString *const kItemsPoints = @"points";
NSString *const kItemsListPrice = @"listPrice";
NSString *const kItemsComments = @"comments";
NSString *const kItemsProductId = @"productId";
NSString *const kItemsProductName = @"productName";
NSString *const kItemsStrikeoutPrice = @"strikeoutPrice";
NSString *const kItemsPicture = @"picture";
NSString *const kItemsInstallment = @"installment";
NSString *const kItemsType = @"type";
NSString *const kItemsHeadline = @"headline";


@interface Items ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Items

@synthesize points = _points;
@synthesize listPrice = _listPrice;
@synthesize comments = _comments;
@synthesize productId = _productId;
@synthesize productName = _productName;
@synthesize strikeoutPrice = _strikeoutPrice;
@synthesize picture = _picture;
@synthesize installment = _installment;
@synthesize type = _type;
@synthesize headline = _headline;


+ (Items *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Items *instance = [[Items alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.points = [[self objectOrNilForKey:kItemsPoints fromDictionary:dict] doubleValue];
            self.listPrice = [ListPrice modelObjectWithDictionary:[dict objectForKey:kItemsListPrice]];
            self.comments = [[self objectOrNilForKey:kItemsComments fromDictionary:dict] doubleValue];
            self.productId = [self objectOrNilForKey:kItemsProductId fromDictionary:dict];
            self.productName = [self objectOrNilForKey:kItemsProductName fromDictionary:dict];
            self.strikeoutPrice = [StrikeoutPrice modelObjectWithDictionary:[dict objectForKey:kItemsStrikeoutPrice]];
            self.picture = [self objectOrNilForKey:kItemsPicture fromDictionary:dict];
            self.installment = [Installment modelObjectWithDictionary:[dict objectForKey:kItemsInstallment]];
            self.type = [self objectOrNilForKey:kItemsType fromDictionary:dict];
            self.headline = [self objectOrNilForKey:kItemsHeadline fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.points] forKey:kItemsPoints];
    [mutableDict setValue:[self.listPrice dictionaryRepresentation] forKey:kItemsListPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.comments] forKey:kItemsComments];
    [mutableDict setValue:self.productId forKey:kItemsProductId];
    [mutableDict setValue:self.productName forKey:kItemsProductName];
    [mutableDict setValue:[self.strikeoutPrice dictionaryRepresentation] forKey:kItemsStrikeoutPrice];
    [mutableDict setValue:self.picture forKey:kItemsPicture];
    [mutableDict setValue:[self.installment dictionaryRepresentation] forKey:kItemsInstallment];
    [mutableDict setValue:self.type forKey:kItemsType];
    [mutableDict setValue:self.headline forKey:kItemsHeadline];

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

    self.points = [aDecoder decodeDoubleForKey:kItemsPoints];
    self.listPrice = [aDecoder decodeObjectForKey:kItemsListPrice];
    self.comments = [aDecoder decodeDoubleForKey:kItemsComments];
    self.productId = [aDecoder decodeObjectForKey:kItemsProductId];
    self.productName = [aDecoder decodeObjectForKey:kItemsProductName];
    self.strikeoutPrice = [aDecoder decodeObjectForKey:kItemsStrikeoutPrice];
    self.picture = [aDecoder decodeObjectForKey:kItemsPicture];
    self.installment = [aDecoder decodeObjectForKey:kItemsInstallment];
    self.type = [aDecoder decodeObjectForKey:kItemsType];
    self.headline = [aDecoder decodeObjectForKey:kItemsHeadline];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_points forKey:kItemsPoints];
    [aCoder encodeObject:_listPrice forKey:kItemsListPrice];
    [aCoder encodeDouble:_comments forKey:kItemsComments];
    [aCoder encodeObject:_productId forKey:kItemsProductId];
    [aCoder encodeObject:_productName forKey:kItemsProductName];
    [aCoder encodeObject:_strikeoutPrice forKey:kItemsStrikeoutPrice];
    [aCoder encodeObject:_picture forKey:kItemsPicture];
    [aCoder encodeObject:_installment forKey:kItemsInstallment];
    [aCoder encodeObject:_type forKey:kItemsType];
    [aCoder encodeObject:_headline forKey:kItemsHeadline];
}


@end
