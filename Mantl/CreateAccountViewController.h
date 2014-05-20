//
//  CreateAccountViewController.h
//  Mantl
//
//  Created by Arnaud Gandibleux on 20/05/14.
//  Copyright (c) 2014 Mantelzorgers Groep 2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateAccountViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtWachtwoord;
@property (weak, nonatomic) IBOutlet UITextField *txtWachtwoord2;

- (IBAction)Registreer:(id)sender;
@end
