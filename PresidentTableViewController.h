//
//  PresidentTableViewController.h
//  usPresident
//
//  Created by Aeonz on 11/26/17.
//  Copyright © 2017 Aeonz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PresidentTableViewController : UITableViewController
@property (strong , nonatomic) NSDictionary *presidentList;
@property (strong , nonatomic) NSString *pListPath;
@property (strong , nonatomic) NSArray *keys;

@end
