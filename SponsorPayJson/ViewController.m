//
//  ViewController.m
//  SponsorPayJson
//
//  Created by davut on 3.04.2014.
//  Copyright (c) 2014 davut. All rights reserved.
//

#import "ViewController.h"
#import "WebService.h"
@interface ViewController ()
@property (strong, nonatomic) WebService *service;
@property (strong, nonatomic) IBOutlet UIView *viewNoOffer;
@property (strong, nonatomic) IBOutlet UIView *viewLoading;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activity;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _viewLoading.layer.cornerRadius = 6;
    [self startActivity];
    self.service = [[WebService alloc]init];
    [self.service GetDataWithsuccess:^(RKObjectRequestOperation *op, RKMappingResult *result) {
        [self stopAnimating];
        
    } failure:^(RKObjectRequestOperation *op, NSError *error) {
        [self stopAnimating];
        [_viewNoOffer setHidden:NO];
        
    }];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)startActivity
{
    [_activity startAnimating];
    [_viewLoading setHidden:NO];
}

-(void)stopAnimating
{
    
    [_activity stopAnimating];
    [UIView animateWithDuration:0.4 animations:^{
        [_viewLoading setAlpha:0];
    } completion:^(BOOL finished) {
        [_viewLoading setHidden:YES];
    }];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
