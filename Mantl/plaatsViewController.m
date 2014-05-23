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
    
    //VOORZIENINGEN EN RATING
    
    int rating = 0;
    
    
    
    UIImageView *plaatsWc = (UIImageView *)[myCell viewWithTag:101];
    if ( [item.wc  isEqual: @"ja"])
    {
        plaatsWc.image = [UIImage imageNamed:@"wc.png"];
        rating += 1;
    }
    
    UIImageView *plaatsParking = (UIImageView *)[myCell viewWithTag:102];
    if ( [item.parking  isEqual: @"ja"])
    {
        plaatsParking.image = [UIImage imageNamed:@"parking.png"];
        rating += 1;
    }
    
    UIImageView *plaatsRolstoel = (UIImageView *)[myCell viewWithTag:103];
    if ( [item.rolstoel  isEqual: @"ja"])
    {
        plaatsRolstoel.image = [UIImage imageNamed:@"rolstoel.png"];
        rating += 1;
    }
    
    UIImageView *plaatsEten = (UIImageView *)[myCell viewWithTag:104];
    if ( [item.eten  isEqual: @"ja"])
    {
        plaatsEten.image = [UIImage imageNamed:@"eten.png"];
        rating += 1;
    }
    
    UIImageView *plaatsDrinken = (UIImageView *)[myCell viewWithTag:105];
    if ( [item.drinken  isEqual: @"ja"])
    {
        plaatsDrinken.image = [UIImage imageNamed:@"drinken.png"];
        rating += 1;
    }
    
    
    //RATING
    NSLog(@"%i", rating);
    
    BOOL ster1 = 0;
    BOOL ster2 = 0;
    BOOL ster3 = 0;
    BOOL ster4 = 0;
    BOOL ster5 = 0;
    
    if( rating >= 1)
    {
        ster1 = 1;
    }
    
    if(rating >= 2){
        
        ster2 = 1;
    }
    
    if (rating >= 3){
        
        ster3 = 1;
    }
    
    if(rating >= 4)
    {
        ster4 = 1;
    }
    
    if(rating >= 5)
    {
        ster5 = 1;
    }
    
    if( ster1 == 0){
        
        UIImageView *ImgSter1 = (UIImageView *)[myCell viewWithTag:51];
        ImgSter1.image = [UIImage imageNamed:@"leeg.png"];
        
    }else{
        
        UIImageView *ImgSter1 = (UIImageView *)[myCell viewWithTag:51];
        ImgSter1.image = [UIImage imageNamed:@"vol.png"];
    }
    
    if( ster2 == 0){
        
        UIImageView *ImgSter2 = (UIImageView *)[myCell viewWithTag:52];
        ImgSter2.image = [UIImage imageNamed:@"leeg.png"];
        
    }else{
        
        UIImageView *ImgSter2 = (UIImageView *)[myCell viewWithTag:52];
        ImgSter2.image = [UIImage imageNamed:@"vol.png"];
    }
    
    if( ster3 == 0){
        
        UIImageView *ImgSter3 = (UIImageView *)[myCell viewWithTag:53];
        ImgSter3.image = [UIImage imageNamed:@"leeg.png"];
        
    }else{
        
        UIImageView *ImgSter3 = (UIImageView *)[myCell viewWithTag:53];
        ImgSter3.image = [UIImage imageNamed:@"vol.png"];
    }
    
    if( ster4 == 0){
        
        UIImageView *ImgSter4 = (UIImageView *)[myCell viewWithTag:54];
        ImgSter4.image = [UIImage imageNamed:@"leeg.png"];
        
    }else{
        
        UIImageView *ImgSter4 = (UIImageView *)[myCell viewWithTag:54];
        ImgSter4.image = [UIImage imageNamed:@"vol.png"];
    }
    
    if( ster5 == 0){
        
        UIImageView *ImgSter5 = (UIImageView *)[myCell viewWithTag:55];
        ImgSter5.image = [UIImage imageNamed:@"leeg.png"];
        
    }else{
        
        UIImageView *ImgSter5 = (UIImageView *)[myCell viewWithTag:55];
        ImgSter5.image = [UIImage imageNamed:@"vol.png"];
    }
   
    
    //Cell returnen
    return myCell;
}



@end
