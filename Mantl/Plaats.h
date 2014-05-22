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
@property (nonatomic, strong) NSString *afbeelding;
@property (nonatomic, strong) NSString *soort;

//Voorzieningen
@property (nonatomic, strong) NSString *wc;
@property (nonatomic, strong) NSString *parking;
@property (nonatomic, strong) NSString *rolstoel;
@property (nonatomic, strong) NSString *eten;
@property (nonatomic, strong) NSString *drinken;

//Ratings
@property (nonatomic, strong) NSString *ster1;
@property (nonatomic, strong) NSString *ster2;
@property (nonatomic, strong) NSString *ster3;
@property (nonatomic, strong) NSString *ster4;
@property (nonatomic, strong) NSString *ster5;

@end
