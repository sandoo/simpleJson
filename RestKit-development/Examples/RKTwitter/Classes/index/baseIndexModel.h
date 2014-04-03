//
//  baseIndexModel.h
//
//  Created by   on 04/02/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface baseIndexModel : NSObject <NSCoding>

@property (nonatomic, strong) NSArray *ads;
@property (nonatomic, strong) NSArray *groups;

+ (baseIndexModel *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
