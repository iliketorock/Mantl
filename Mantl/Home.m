//
//  Home.m
//  Mantl
//
//  Created by Gitte Pittillion on 22/05/14.
//  Copyright (c) 2014 Mantelzorgers Groep 2. All rights reserved.
//
//TUTORIAL: http://codewithchris.com/iphone-app-connect-to-mysql-database/#parsejson

#import "Home.h"
#import "Plaats.h"

@interface Home()
{
    NSMutableData *_downloadedData;
}
@end

@implementation Home

- (void)downloadItems
{
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:@"http://gandibleux.eu/PHP/jsonGetPlaatsen.php"];
    
    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
}

#pragma mark NSURLConnectionDataProtocol Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    _downloadedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [_downloadedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Create an array to store the locations
    NSMutableArray *_plaatsen = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    
    // Loop through Json objects, create question objects and add them to our questions array
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSDictionary *jsonElement = jsonArray[i];
        
        // Create a new location object and set its props to JsonElement properties
        Plaats *newPlaats = [[Plaats alloc] init];
        newPlaats.titel = jsonElement[@"Titel"];
        newPlaats.adres = jsonElement[@"adres"];
        newPlaats.soort = jsonElement[@"soort"];
        newPlaats.beschrijving = jsonElement[@"beschrijving"];
        newPlaats.auteur = jsonElement[@"ID_persoon"];
        
        //voorzieningen
        newPlaats.wc = jsonElement[@"wc"];
        newPlaats.parking = jsonElement[@"parking"];
        newPlaats.rolstoel = jsonElement[@"rolstoel"];
        newPlaats.eten = jsonElement[@"eten"];
        newPlaats.drinken = jsonElement[@"drinken"];
        
        // Add this question to the locations array
        [_plaatsen addObject:newPlaats];
    }
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate itemsDownloaded:_plaatsen];
    }
}

@end
