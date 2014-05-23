//
//  DetailDagboekViewController.h
//  Mantl
//
//  Created by Brent Heynsmans on 22/05/14.
//  Copyright (c) 2014 Mantelzorgers Groep 2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailDagboekViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *dagboekData;
@property (nonatomic, strong) NSString *dagboektekst;
@property (nonatomic, strong) NSString *datum;
@property (strong, nonatomic) IBOutlet UILabel *datumLabel;



@end
