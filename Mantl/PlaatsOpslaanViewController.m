//
//  PlaatsOpslaanViewController.m
//  Mantl
//
//  Created by Gitte Pittillion on 26/05/14.
//  Copyright (c) 2014 Mantelzorgers Groep 2. All rights reserved.
//

#import "PlaatsOpslaanViewController.h"
#import "SBJson.h"

@interface PlaatsOpslaanViewController ()

@end

@implementation PlaatsOpslaanViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    soorten = [NSMutableArray arrayWithObjects:@"Museum", @"Amusement", @"Muziek", @"Natuur", @"Monument", @"Shopping", nil];
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

- (IBAction)annuleren:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void) alertStatus:(NSString *)msg :(NSString *)title
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    
    [alertView show];
}


- (IBAction)opslaan:(id)sender {

    @try {
        
        if([[_titel text] isEqualToString:@""] || [[_adres text] isEqualToString:@""] || [[_beschrijving text] isEqualToString:@""] || [[_soortTekst text] isEqualToString:@"Soort"]){
            [self alertStatus:@"Probeer opnieuw aub" :@"Opslaan mislukt!"];
        } else {
            NSString *post =[[NSString alloc] initWithFormat:@"titel=%@&adres=%@&beschrijving=%@&wc=%@&parking=%@&rolstoel=%@&eten=%@&drinken=%@&soort=%@",[_titel text], [_adres text], [_beschrijving text],_wcTekst,_parkingTekst,_rolstoelTekst,_etenTekst,_drinkenTekst, [_soortTekst text] ];
            
            NSURL *url=[NSURL URLWithString:@"http://gandibleux.eu/PHP/VoegPlaatsToe.php"];
            
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            
            NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setURL:url];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
            //[NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
            
            NSError *error = [[NSError alloc] init];
            NSHTTPURLResponse *response = nil;
            NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            
            NSLog(@"Response code: %d", [response statusCode]);
            if ([response statusCode] >=200 && [response statusCode] <300)
            {
                NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
                NSLog(@"Response ==> %@", responseData);
                
                SBJsonParser *jsonParser = [SBJsonParser new];
                NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:responseData error:nil];
                NSLog(@"%@",jsonData);
                NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
                NSLog(@"%d",success);
                if(success == 1)
                {
                    NSLog(@"Register SUCCESS");
                    [self alertStatus:@"Je activiteit is opgeslagen." :@"Opgeslagen!"];
                    
                    
                } else {
                    
                    NSString *error_msg = (NSString *) [jsonData objectForKey:@"error_message"];
                    [self alertStatus:error_msg :@"Opslaan mislukt!"];
                }
                
            } else {
                if (error) NSLog(@"Error: %@", error);
                [self alertStatus:@"Connection Failed" :@"Opslaan mislukt!"];
            }
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Opslaan mislukt." :@"Opslaan mislukt!"];
    }

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == 0) {
        // from YES button
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
    else if (alertView.tag == 1) {
        // from NO button
    }
}


- (IBAction)backgroundClicker:(id)sender {
    [_titel resignFirstResponder];
    [_adres resignFirstResponder];
    [_beschrijving resignFirstResponder];
}



//PICKERVIEW

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    // This method provides the data for a specific row in a specific component.
    
    return [soorten objectAtIndex:row];
    
}

#pragma mark Picker Data Source Methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    // This method returns the number of components we want in our Picker.
    // The components are the colums.
    
    return 1;
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    // This returns the number of rows in each component. We use the count of our array to determine the number of rows.
    
    return [soorten count];
    
}

//ACTIONS

//Voorzieningen
- (IBAction)wc:(id)sender {
    
    if(_wcButton.on){
        _wcTekst = @"ja";
    }else{
        _wcTekst = @"nee";
    }
}

- (IBAction)parking:(id)sender {
    
    if(_parkingButton.on){
        _parkingTekst = @"ja";
    }else{
        _wcTekst = @"nee";
    }
}

- (IBAction)rolstoel:(id)sender {
    
    if(_rolstoelButton.on){
        _rolstoelTekst = @"ja";
    }else{
        _rolstoelTekst = @"nee";
    }
}

- (IBAction)eten:(id)sender {
    
    if(_etenButton.on){
        _etenTekst = @"ja";
    }else{
        _etenTekst = @"nee";
    }
}

- (IBAction)drinken:(id)sender {
    
    if(_drinkenButton.on){
        _drinkenTekst = @"ja";
    }else{
        _drinkenTekst = @"nee";
    }
}

//Pickerview
- (IBAction)kiesBtn:(id)sender {
    [_pickerViewContainer setHidden:0];
    [_opslaanBtn setHidden:1];
    [_annulerenBtn setHidden:1];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    _pickerViewContainer.frame = CGRectMake(0, 311, 320, 187);
    [UIView commitAnimations];
    
}

- (IBAction)hideBtn:(id)sender {
    [_opslaanBtn setHidden:0];
    [_annulerenBtn setHidden:0];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    _pickerViewContainer.frame = CGRectMake(0, 660, 320, 187);
    [UIView commitAnimations];
    [_pickerViewContainer setHidden:1];

    
    NSString *select = [soorten objectAtIndex:[soortPicker selectedRowInComponent:0]]; // Asks the Picker what is currently selected.
 
    _soortTekst.text = select;;
}


@end
