//
//  Vraag.m
//  Mantl
//
//  Created by Sammi Fux on 21/05/14.
//  Copyright (c) 2014 Mantelzorgers Groep 2. All rights reserved.
//

#import "Vraag.h"

@implementation Vraag

- (id)initMetTitelEnVraag:(NSString *)titel :(NSString *)vraag {
    if (self = [super init]) {
        self.titel = titel;
        self.vraag = vraag;
    }
    return self;
}

@end
