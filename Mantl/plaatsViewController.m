//
//  plaatsViewController.m
//  Mantl
//
//  Created by Gitte Pittillion on 22/05/14.
//  Copyright (c) 2014 Mantelzorgers Groep 2. All rights reserved.
//

#import "plaatsViewController.h"
#import "Plaats.h"

@interface plaatsViewController ()
{
    Home *_home;
    NSArray *_feedItems;
}
@end

@implementation plaatsViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set this view controller object as the delegate and data source for the table view
    self.plaatsTableView.delegate = self;
    self.plaatsTableView.dataSource = self;
    
    // Create array object and assign it to _feedItems variable
    _feedItems = [[NSArray alloc] init];
    
    // Create new HomeModel object and assign it to _homeModel variable
    _home = [[Home alloc] init];
    
    // Set this view controller object as the delegate for the home model object
    _home.delegate = self;
    
    // Call the download items method of the home model object
    [_home downloadItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)itemsDownloaded:(NSArray *)items
{
    // This delegate method will get called when the items are finished downloading
    
    // Set the downloaded items to the array
    _feedItems = items;
    
    // Reload the table view
    [self.plaatsTableView reloadData];
}

#pragma mark Table View Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of feed items (initially 0)
    return _feedItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Retrieve cell
    NSString *cellIdentifier = @"BasicCell";
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Get the location to be shown
    Plaats *item = _feedItems[indexPath.row];
    
    // Get references to labels of cell
    
    //TITEL
    UILabel *plaatsTitel = (UILabel *)[myCell viewWithTag:1];
    plaatsTitel.text = item.titel;
    
    //ADRES
    UILabel *plaatsAdres = (UILabel *)[myCell viewWithTag:2];
    plaatsAdres.text = item.adres;
    
    // AFBEELDING DAT SOORT PLAATS WEERGEEFT
    NSString* linkImg = [NSString stringWithFormat:@"%@.jpg", item.soort];
    
    UIImageView *plaatsImg = (UIImageView *)[myCell viewWithTag:3];
    plaatsImg.image = [UIImage imageNamed:linkImg];
    
    //VOORZIENINGEN
    UIImageView *plaatsWc = (UIImageView *)[myCell viewWithTag:101];
    
    
    if ( [item.wc  isEqual: @"ja"])
    {
        plaatsWc.image = [UIImage imageNamed:@"wc.jpg"];
    }
   
    
    
    //Cell returnen
    return myCell;
}



@end
