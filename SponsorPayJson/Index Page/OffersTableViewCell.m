//
//  OffersTableViewCell.m
//  SponsorPayJson
//
//  Created by davut on 4.04.2014.
//  Copyright (c) 2014 davut. All rights reserved.
//

#import "OffersTableViewCell.h"

@implementation OffersTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)setOffer:(SponsorPayOffers *)anOffer
{
    [self.lblTitle setText:anOffer.teaser];
    [self.lblDescription setText:[NSString stringWithFormat:@"%@ earn %@ VCS!",anOffer.teaser,anOffer.payout]];
    [Utility_Functions loadImage:anOffer.thumbnail.lowres place:self.imgThumbnail];
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
