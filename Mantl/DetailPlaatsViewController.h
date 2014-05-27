//
//  DetailPlaatsViewController.h
//  Mantl
//
//  Created by Gitte Pittillion on 23/05/14.
//  Copyright (c) 2014 Mantelzorgers Groep 2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailPlaatsViewController : UIViewController

//Labels Algemeen
@property (strong, nonatomic) IBOutlet UILabel *titel;
@property (strong, nonatomic) IBOutlet UILabel *adres;
@property (weak, nonatomic) IBOutlet UIImageView *afbeelding;
@property (weak, nonatomic) IBOutlet UITextView *beschrijving;
@property (weak, nonatomic) IBOutlet UILabel *auteur;

//Labels Sterren
@property (weak, nonatomic) IBOutlet UIImageView *ster1;
@property (weak, nonatomic) IBOutlet UIImageView *ster2;
@property (weak, nonatomic) IBOutlet UIImageView *ster3;
@property (weak, nonatomic) IBOutlet UIImageView *ster4;
@property (weak, nonatomic) IBOutlet UIImageView *ster5;

//Labels Voorzieningen
@property (weak, nonatomic) IBOutlet UIImageView *wc;
@property (weak, nonatomic) IBOutlet UIImageView *parking;
@property (weak, nonatomic) IBOutlet UIImageView *rolstoel;
@property (weak, nonatomic) IBOutlet UIImageView *eten;
@property (weak, nonatomic) IBOutlet UIImageView *drinken;


//Tekst algemeen
@property (strong, nonatomic) NSString* titelTekst;
@property (strong, nonatomic) NSString* adresTekst;
@property (strong, nonatomic) NSString* soortTekst;
@property (strong, nonatomic) NSString* beschrijvingTekst;
@property (strong, nonatomic) NSString* auteurTekst;

//Tekst voorzieningen
@property (strong, nonatomic) NSString* wcTekst;
@property (strong, nonatomic) NSString* parkingTekst;
@property (strong, nonatomic) NSString* rolstoelTekst;
@property (strong, nonatomic) NSString* etenTekst;
@property (strong, nonatomic) NSString* drinkenTekst;






@end
