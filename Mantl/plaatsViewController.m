//
//  plaatsViewController.m
//  Mantl
//
//  Created by Gitte Pittillion on 22/05/14.
//  Copyright (c) 2014 Mantelzorgers Groep 2. All rights reserved.
//
//Met behulp van tutorial: http://codewithchris.com/iphone-app-connect-to-mysql-database/#parsejson

#import "plaatsViewController.h"
#import "Plaats.h"
#import "DetailPlaatsViewController.h"

@interface plaatsViewController ()
{
    Home *_home;
    NSArray *_feedItems;
}
@end

@implementation plaatsViewController

NSArray *voorzieningen;


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
    NSString* linkImg = [NSString stringWithFormat:@"%@.png", item.soort];
    
    UIImageView *plaatsImg = (UIImageView *)[myCell viewWithTag:3];
    plaatsImg.image = [UIImage imageNamed:linkImg];
    
    //VOORZIENINGEN EN RATING
    
    //ImageViews van voorzieningen vullen met lege sterren
    UIImageView *plaatsWc = (UIImageView *)[myCell viewWithTag:101];
    plaatsWc.image = [UIImage imageNamed:@"wcLeeg.png"];
    UIImageView *plaatsParking = (UIImageView *)[myCell viewWithTag:102];
    plaatsParking.image = [UIImage imageNamed:@"parkingLeeg.png"];
    UIImageView *plaatsRolstoel = (UIImageView *)[myCell viewWithTag:103];
    plaatsRolstoel.image = [UIImage imageNamed:@"rolstoelLeeg.png"];
    UIImageView *plaatsEten = (UIImageView *)[myCell viewWithTag:104];
    plaatsEten.image = [UIImage imageNamed:@"etenLeeg.png"];
    UIImageView *plaatsDrinken = (UIImageView *)[myCell viewWithTag:105];
    plaatsDrinken.image = [UIImage imageNamed:@"drinkenLeeg.png"];

    //Variabele om rating bij te houden wanneer er een voorziening aanwezig is
    int rating = 0;

    if ( [item.wc  isEqual: @"ja"])
    {
        plaatsWc.image = [UIImage imageNamed:@"wc.png"];
        rating += 1;
    }
    
    if ( [item.parking  isEqual: @"ja"])
    {
        plaatsParking.image = [UIImage imageNamed:@"parking.png"];
        rating += 1;
    }
    
    if ( [item.rolstoel  isEqual: @"ja"])
    {
        plaatsRolstoel.image = [UIImage imageNamed:@"rolstoel.png"];
        rating += 1;
    }
    
    if ( [item.eten  isEqual: @"ja"])
    {
        plaatsEten.image = [UIImage imageNamed:@"eten.png"];
        rating += 1;
    }
    
    if ( [item.drinken  isEqual: @"ja"])
    {
        plaatsDrinken.image = [UIImage imageNamed:@"drinken.png"];
        rating += 1;
    }
    
    
    //ImageViews van rating vullen met lege sterren
    UIImageView *ImgSter1 = (UIImageView *)[myCell viewWithTag:51];
    ImgSter1.image = [UIImage imageNamed:@"leeg.png"];
    UIImageView *ImgSter2 = (UIImageView *)[myCell viewWithTag:52];
    ImgSter2.image = [UIImage imageNamed:@"leeg.png"];
    UIImageView *ImgSter3 = (UIImageView *)[myCell viewWithTag:53];
    ImgSter3.image = [UIImage imageNamed:@"leeg.png"];
    UIImageView *ImgSter4 = (UIImageView *)[myCell viewWithTag:54];
    ImgSter4.image = [UIImage imageNamed:@"leeg.png"];
    UIImageView *ImgSter5 = (UIImageView *)[myCell viewWithTag:55];
    ImgSter5.image = [UIImage imageNamed:@"leeg.png"];
    
    
    // Aan de hand van de rating de imageViews vullen met volle sterren
    switch (rating) {
        case 5:
            //
            ImgSter5.image = [UIImage imageNamed:@"vol.png"];
        case 4:
            //
            ImgSter4.image = [UIImage imageNamed:@"vol.png"];
        case 3:
            //
            ImgSter3.image = [UIImage imageNamed:@"vol.png"];
        case 2:
            //
            ImgSter2.image = [UIImage imageNamed:@"vol.png"];
        case 1:
            //
            ImgSter1.image = [UIImage imageNamed:@"vol.png"];
            
        default:
            break;
    }
    
    //Cell returnen
    return myCell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"plaatsDetail"]) {
        NSIndexPath *indexPath = [self.plaatsTableView indexPathForSelectedRow];
        DetailPlaatsViewController *destViewController = segue.destinationViewController;
        Plaats *temp = [_feedItems objectAtIndex:indexPath.row];
        //Algemeen
        destViewController.titelTekst = temp.titel;
        destViewController.adresTekst = temp.adres;
        destViewController.soortTekst = temp.soort;
        destViewController.beschrijvingTekst = temp.beschrijving;
        destViewController.auteurTekst = temp.auteur;
        //Voorzieningen
        destViewController.wcTekst = temp.wc;
        destViewController.parkingTekst = temp.parking;
        destViewController.rolstoelTekst = temp.rolstoel;
        destViewController.etenTekst = temp.eten;
        destViewController.drinkenTekst = temp.drinken;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_home downloadItems];
    [self.plaatsTableView reloadData];
    
    //  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tableReload) name:@"tableReload" object:nil];
    
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //  [[NSNotificationCenter defaultCenter] removeObserver:self name:@"tableReload" object:nil];
}

-(void)tableReload
{
    [self.plaatsTableView reloadData];
    
}


@end
