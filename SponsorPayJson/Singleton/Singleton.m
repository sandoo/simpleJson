//
//  Singleton.m
//  SponsorPayJson
//
//  Created by davut on 4.04.2014.
//  Copyright (c) 2014 davut. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

//Simple shared instance to keep global data
+ (Singleton*)sharedInstance
{
    static Singleton *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.imageCache = [[NSCache alloc]init];
        instance.viewLoading =[[UIView alloc]initWithFrame:CGRectMake(80, 200, 160, 160)];
        instance.activity = [[UIActivityIndicatorView alloc]init];
    });
    return instance;
}

@end
