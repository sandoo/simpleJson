//
//  OfferDetailViewController.m
//  SponsorPayJson
//
//  Created by davut on 4.04.2014.
//  Copyright (c) 2014 davut. All rights reserved.
//

#import "OfferDetailViewController.h"

@interface OfferDetailViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imgThumbnail;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;
@property (strong, nonatomic) IBOutlet UILabel *lblComments;

@end

@implementation OfferDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)goToPage:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_anOffer.link]]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *navBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sponsorpay-logo-paymentobserver.jpg"]];
    [navBG setBounds:CGRectMake(0, 0, 100, 44)];
    navBG.contentMode = UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView = navBG;
    
    [self.lblTitle setText:_anOffer.teaser];
    [self.lblDescription setText:[NSString stringWithFormat:@"%@ earn %@ VCS!",_anOffer.teaser,_anOffer.payout]];
    [self.lblComments setText:[NSString stringWithFormat:@"Use application for %@ and earn %@ VCS!",_anOffer.timeToPayout.readable,_anOffer.payout]];
    [Utility_Functions loadImage:_anOffer.thumbnail.hires place:self.imgThumbnail];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
