//
//  plaatsViewController.h
//  Mantl
//
//  Created by Gitte Pittillion on 22/05/14.
//  Copyright (c) 2014 Mantelzorgers Groep 2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Home.h"

@interface plaatsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, HomeProtocol>

@property (weak, nonatomic) IBOutlet UITableView *plaatsTableView;

@end
