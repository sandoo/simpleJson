//
//  Utility_Functions.m
//  SponsorPayJson
//
//  Created by davut on 4.04.2014.
//  Copyright (c) 2014 davut. All rights reserved.
//

#import "Utility_Functions.h"

@implementation Utility_Functions

#pragma mark - Image Loader
// Keeps objects in cache for further use
+(void)loadImage:(NSString *)urlStr place:(UIImageView *)place
{
    place.image = [UIImage imageNamed:@""];
    UIActivityIndicatorView *act = [[UIActivityIndicatorView alloc]initWithFrame:place.frame];
    act.color = [UIColor grayColor];
    [place.superview addSubview:act];
    [act startAnimating];
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        
        NSURL* urlnn = [NSURL URLWithString:urlStr];
        NSCache *imageCache =  [Singleton sharedInstance].imageCache;
        NSData *imgData  = [imageCache objectForKey:urlnn];
        
        BOOL fromCache = YES;
        
        if(imgData == nil){
            
            fromCache = NO;
            NSURLRequest *request =   [NSURLRequest requestWithURL:urlnn cachePolicy:NSURLRequestReloadRevalidatingCacheData timeoutInterval:30.0];
            NSURLResponse  *response = nil;
            imgData =  [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:NULL];
            
        }
        if ( imgData == nil )
            return;
        [imageCache setObject:imgData forKey:urlnn];
        dispatch_async(dispatch_get_main_queue(), ^{
            [act stopAnimating];
            [act removeFromSuperview];
            UIImage *img = [UIImage imageWithData:imgData];
            place.image = img;

            if(fromCache){
                [act stopAnimating];
                [act removeFromSuperview];
                place.alpha = 0;
                
                [UIView animateWithDuration:0.8  delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    place.alpha = 1;
                }completion:^ (BOOL finished) {if (finished) {
                    
                }}];
            }
        });
    });
}

#pragma mark - Loading Activity

+(void)startActivity
{
    [[[UIApplication sharedApplication].windows[0] rootViewController].view addSubview:[Singleton sharedInstance].viewLoading];
    [[Singleton sharedInstance].activity startAnimating];
}

+(void)stopAnimating
{
    
    [[Singleton sharedInstance].activity stopAnimating];
    [UIView animateWithDuration:0.4 animations:^{
        [[Singleton sharedInstance].viewLoading setAlpha:0];
    } completion:^(BOOL finished) {
        [[Singleton sharedInstance].viewLoading removeFromSuperview];
    }];
    
}

@end
