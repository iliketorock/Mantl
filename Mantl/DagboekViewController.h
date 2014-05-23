//
//  DagboekViewController.h
//  Mantl
//
//  Created by Brent Heynsmans on 21/05/14.
//  Copyright (c) 2014 Mantelzorgers Groep 2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface DagboekViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, HomeModelProtocol>
@property (weak, nonatomic) IBOutlet UITableView *listTableView;



@end
