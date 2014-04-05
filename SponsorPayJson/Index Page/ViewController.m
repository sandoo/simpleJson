//
//  ViewController.m
//  SponsorPayJson
//
//  Created by davut on 3.04.2014.
//  Copyright (c) 2014 davut. All rights reserved.
//

#import "ViewController.h"
#import "WebService.h"
#import "OffersTableViewCell.h"
#import "OfferDetailViewController.h"
@interface ViewController ()
@property (strong, nonatomic) WebService *service;
@property (strong, nonatomic) IBOutlet UIView *viewNoOffer;

@property (strong, nonatomic) NSMutableArray *offers;
@property (strong, nonatomic) IBOutlet UITableView *tblOffers;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    


    UIImageView *navBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sponsorpay-logo-paymentobserver.jpg"]];
    [navBG setBounds:CGRectMake(0, 0, 100, 34)];
    navBG.contentMode = UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView = navBG;

    
    _tblOffers.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.service = [[WebService alloc]init];
    
    //Service call with blocks
    
    [self.service GetDataWithsuccess:^(RKObjectRequestOperation *op, RKMappingResult *result) {
        
        _offers = [[NSMutableArray alloc]init];
        NSMutableArray *indexes = [[NSMutableArray alloc]init];
        
        int index = 0;
        for (SponsorPayOffers * obj in ((SponsorPayBaseClass *)[result firstObject]).offers) {
            [_offers addObject:obj];
            [indexes addObject:[NSIndexPath indexPathForRow:index inSection:0]];
            index++;
        }
        // table reloads with animation
        [self.tblOffers insertRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationTop];
        
        
    } failure:^(RKObjectRequestOperation *op, NSError *error) {
        //Fail case
        [_viewNoOffer setHidden:NO];
        
    }];
}



#pragma mark -TableView


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OffersTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"OffersTableViewCell" ];
    if(cell==nil)
        cell = [[OffersTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UserBasketCell"];
    
    [cell setOffer:[_offers objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _offers.count;
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    ((OfferDetailViewController *)segue.destinationViewController).anOffer = [_offers objectAtIndex:[_tblOffers indexPathForSelectedRow].row];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
