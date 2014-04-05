//
//  OffersTableViewCell.h
//  SponsorPayJson
//
//  Created by davut on 4.04.2014.
//  Copyright (c) 2014 davut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OffersTableViewCell : UITableViewCell
{}
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UIImageView *imgThumbnail;

@property (strong, nonatomic) IBOutlet UILabel *lblDescription;


-(void)setOffer:(SponsorPayOffers *)anOffer;
@end
