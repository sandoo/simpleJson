//
//  Installment.h
//
//  Created by   on 04/02/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Installment : NSObject <NSCoding>

@property (nonatomic, assign) double max;
@property (nonatomic, strong) NSString *displayText;

+ (Installment *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
