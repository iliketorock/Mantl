//
//  Vraag.h
//  Mantl
//
//  Created by Sammi Fux on 21/05/14.
//  Copyright (c) 2014 Mantelzorgers Groep 2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vraag : NSObject

@property (nonatomic) NSString *titel;
@property (nonatomic) NSString *vraag;

- (id)initMetTitelEnVraag:(NSString *) titel :(NSString *) vraag;

@end
