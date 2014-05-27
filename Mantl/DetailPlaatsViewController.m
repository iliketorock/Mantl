//
//  DetailPlaatsViewController.m
//  Mantl
//
//  Created by Gitte Pittillion on 23/05/14.
//  Copyright (c) 2014 Mantelzorgers Groep 2. All rights reserved.
//

#import "DetailPlaatsViewController.h"

@interface DetailPlaatsViewController ()

@end

@implementation DetailPlaatsViewController

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
    
    //ALGEMEEN
    
    _titel.text = _titelTekst;
    _adres.text = _adresTekst;
    
    NSString* linkImg = [NSString stringWithFormat:@"%@.png", _soortTekst];
    _afbeelding.image = [UIImage imageNamed:linkImg];
    
    _beschrijving.text = _beschrijvingTekst;
    
    _auteur.text = [NSString stringWithFormat:@"Auteur: %@", _auteurTekst];
    
    //VOORZIENINGEN
    
    //ImageViews van voorzieningen vullen met lege sterren
    _wc.image = [UIImage imageNamed:@"wcLeeg.png"];
    _parking.image = [UIImage imageNamed:@"parkingLeeg.png"];
    _rolstoel.image = [UIImage imageNamed:@"rolstoelLeeg.png"];
    _eten.image = [UIImage imageNamed:@"etenLeeg.png"];
    _drinken.image = [UIImage imageNamed:@"drinkenLeeg.png"];
    
    //Variabele om rating bij te houden wanneer er een voorziening aanwezig is
    int rating = 0;
    
    if ( [_wcTekst isEqual: @"ja"])
    {
        _wc.image = [UIImage imageNamed:@"wc.png"];
        rating += 1;
    }
    
    if ( [_parkingTekst  isEqual: @"ja"])
    {
        _parking.image = [UIImage imageNamed:@"parking.png"];
        rating += 1;
    }
    
    if ( [_rolstoelTekst  isEqual: @"ja"])
    {
        _rolstoel.image = [UIImage imageNamed:@"rolstoel.png"];
        rating += 1;
    }
    
    if ( [_etenTekst  isEqual: @"ja"])
    {
        _eten.image = [UIImage imageNamed:@"eten.png"];
        rating += 1;
    }
    
    if ( [_drinkenTekst  isEqual: @"ja"])
    {
        _drinken.image = [UIImage imageNamed:@"drinken.png"];
        rating += 1;
    }
    
    //RATING
    
    //ImageViews van rating vullen met lege sterren
    _ster1.image = [UIImage imageNamed:@"leeg.png"];
    _ster2.image = [UIImage imageNamed:@"leeg.png"];
    _ster3.image = [UIImage imageNamed:@"leeg.png"];
    _ster4.image = [UIImage imageNamed:@"leeg.png"];
    _ster5.image = [UIImage imageNamed:@"leeg.png"];
    
    
    // Aan de hand van de rating de imageViews vullen met volle sterren
    switch (rating) {
        case 5:
            _ster5.image = [UIImage imageNamed:@"vol.png"];
        case 4:
            _ster4.image = [UIImage imageNamed:@"vol.png"];
        case 3:
            _ster3.image = [UIImage imageNamed:@"vol.png"];
        case 2:
            _ster2.image = [UIImage imageNamed:@"vol.png"];
        case 1:
            _ster1.image = [UIImage imageNamed:@"vol.png"];
            
        default:
            break;
    }

    

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

@end
