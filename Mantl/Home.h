//
//  Home.h
//  Mantl
//
//  Created by Gitte Pittillion on 22/05/14.
//  Copyright (c) 2014 Mantelzorgers Groep 2. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HomeProtocol <NSObject>

- (void)itemsDownloaded:(NSArray *)items;

@end

@interface Home : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<HomeProtocol> delegate;

- (void)downloadItems;

@end