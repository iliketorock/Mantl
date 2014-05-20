//
//  LoginControllerViewController.h
//  Mantl
//
//  Created by Arnaud Gandibleux on 20/05/14.
//  Copyright (c) 2014 Mantelzorgers Groep 2. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoginControllerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTxt;
@property (weak, nonatomic) IBOutlet UITextField *paswoordTxt;
- (IBAction)LoginButton:(id)sender;

@end
