//
//  PresidentTableViewCell.h
//  usPresident
//
//  Created by Aeonz on 11/26/17.
//  Copyright © 2017 Aeonz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PresidentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellPresName;
@property (weak, nonatomic) IBOutlet UILabel *cellPresParty;
@property (weak, nonatomic) IBOutlet UILabel *cellOfficeTime;
@property (weak, nonatomic) IBOutlet UIImageView *cellPresImage;

@end
