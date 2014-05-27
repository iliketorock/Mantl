//
//  Plaats.h
//  Mantl
//
//  Created by Gitte Pittillion on 22/05/14.
//  Copyright (c) 2014 Mantelzorgers Groep 2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Plaats : NSObject

@property (nonatomic, strong) NSString *titel;
@property (nonatomic, strong) NSString *adres;
@property (nonatomic, strong) NSString *soort;
@property (nonatomic, strong) NSString *beschrijving;
@property (nonatomic, strong) NSString *auteur;


//Voorzieningen
@property (nonatomic, strong) NSString *wc;
@property (nonatomic, strong) NSString *parking;
@property (nonatomic, strong) NSString *rolstoel;
@property (nonatomic, strong) NSString *eten;
@property (nonatomic, strong) NSString *drinken;


@end
