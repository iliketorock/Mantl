//
//  SchrijfViewController.h
//  Mantl
//
//  Created by Brent Heynsmans on 21/05/14.
//  Copyright (c) 2014 Mantelzorgers Groep 2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SchrijfViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *tekstveld;
- (IBAction)opslaan:(id)sender;

@end
