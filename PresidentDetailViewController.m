//
//  PresidentDetailViewController.m
//  usPresident
//
//  Created by Aeonz on 11/26/17.
//  Copyright © 2017 Aeonz. All rights reserved.
//

#import "PresidentDetailViewController.h"

@interface PresidentDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblPresidentBirth;
@property (weak, nonatomic) IBOutlet UILabel *lblPresidentPoB;
@property (weak, nonatomic) IBOutlet UILabel *lblPresidentDoD;
@property (weak, nonatomic) IBOutlet UILabel *lblPresidentPoD;
@property (weak, nonatomic) IBOutlet UILabel *lblPresidency;
@property (weak, nonatomic) IBOutlet UILabel *lblPresidentParty;
@property (weak, nonatomic) IBOutlet UILabel *lblPresidentOccupation;
@property (weak, nonatomic) IBOutlet UILabel *lblPresidentVice;
@property (weak, nonatomic) IBOutlet UIImageView *presidentImage;
@property (weak, nonatomic) IBOutlet UIImageView *presidentViceImage;

@end

@implementation PresidentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"stuff"]];
    
    self.lblPresidentBirth.text = self.myPresident.presBorn;
    self.lblPresidentPoB.text = self.myPresident.presPoB;
    self.lblPresidentDoD.text = self.myPresident.presDeath;
    self.lblPresidentPoD.text = self.myPresident.presPoD;
    self.lblPresidency.text = self.myPresident.presTookOffice;
    self.lblPresidentParty.text = self.myPresident.presAffilation;
    self.lblPresidentOccupation.text = self.myPresident.presOccupation;
    self.lblPresidentVice.text = self.myPresident.presVice;
    self.presidentImage.image = self.myPresident.presImage;
    self.presidentViceImage.image = self.myPresident.presViceImage;
    
    self.lblPresidentBirth.textColor = [UIColor cyanColor];
    self.lblPresidentPoB.textColor = [UIColor cyanColor];
    self.lblPresidentDoD.textColor = [UIColor cyanColor];
    self.lblPresidentPoD.textColor = [UIColor cyanColor];
    self.lblPresidency.textColor = [UIColor cyanColor];
    self.lblPresidentParty.textColor = [UIColor cyanColor];
    self.lblPresidentOccupation.textColor = [UIColor cyanColor];
    self.lblPresidentVice.textColor = [UIColor cyanColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
