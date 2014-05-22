//
//  plaatsenTableViewCell.m
//  Mantl
//
//  Created by Gitte Pittillion on 21/05/14.
//  Copyright (c) 2014 Mantelzorgers Groep 2. All rights reserved.
//

#import "plaatsenTableViewCell.h"

@implementation plaatsenTableViewCell

@synthesize plaatsTitel = _plaatsTitel;
@synthesize plaatsAdres = _plaatsAdres;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
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
