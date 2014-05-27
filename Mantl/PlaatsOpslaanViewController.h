//
//  PlaatsOpslaanViewController.h
//  Mantl
//
//  Created by Gitte Pittillion on 26/05/14.
//  Copyright (c) 2014 Mantelzorgers Groep 2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaatsOpslaanViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    //PICKER
    IBOutlet UIPickerView *soortPicker;
    NSMutableArray *soorten;
    int selectedRow;
}

@property (weak, nonatomic) IBOutlet UIView *pickerViewContainer;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *hideButton;
@property (weak, nonatomic) IBOutlet UILabel *soortTekst;



@property (weak, nonatomic) IBOutlet UITextField *titel;
@property (weak, nonatomic) IBOutlet UITextField *adres;
@property (weak, nonatomic) IBOutlet UITextView *beschrijving;



@property (weak, nonatomic) IBOutlet UISwitch *wcButton;
@property (weak, nonatomic) IBOutlet UISwitch *parkingButton;
@property (weak, nonatomic) IBOutlet UISwitch *rolstoelButton;
@property (weak, nonatomic) IBOutlet UISwitch *etenButton;
@property (weak, nonatomic) IBOutlet UISwitch *drinkenButton;

@property (weak, nonatomic) NSString *wcTekst;
@property (weak, nonatomic) NSString *parkingTekst;
@property (weak, nonatomic) NSString *rolstoelTekst;
@property (weak, nonatomic) NSString *etenTekst;
@property (weak, nonatomic) NSString *drinkenTekst;

@property (weak, nonatomic) IBOutlet UIButton *opslaanBtn;
@property (weak, nonatomic) IBOutlet UIButton *annulerenBtn;

//ACTIONS

//Algemeen
- (IBAction)opslaan:(id)sender;
- (IBAction)backgroundClicker:(id)sender;
- (IBAction)annuleren:(id)sender;

//Voorzieningen
- (IBAction)wc:(id)sender;
- (IBAction)parking:(id)sender;
- (IBAction)rolstoel:(id)sender;
- (IBAction)eten:(id)sender;
- (IBAction)drinken:(id)sender;

//Picker
- (IBAction)kiesBtn:(id)sender;
- (IBAction)hideBtn:(id)sender;

@end
