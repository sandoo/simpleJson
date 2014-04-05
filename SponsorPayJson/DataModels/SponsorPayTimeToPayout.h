//
//  SponsorPayTimeToPayout.h
//
//  Created by davut kilinc on 3.04.2014
//  Copyright (c) 2014 tmob. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SponsorPayTimeToPayout : NSObject <NSCoding>

@property (nonatomic, strong) NSString *amount;
@property (nonatomic, strong) NSString *readable;

+ (SponsorPayTimeToPayout *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
