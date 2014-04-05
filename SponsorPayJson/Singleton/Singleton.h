//
//  Singleton.h
//  SponsorPayJson
//
//  Created by davut on 4.04.2014.
//  Copyright (c) 2014 davut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject
@property (strong, nonatomic) NSCache *imageCache;
@property (strong, nonatomic) IBOutlet UIView *viewLoading;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activity;
+ (Singleton*) sharedInstance;

@end
