//
//  PresidentTableViewController.m
//  usPresident
//
//  Created by Aeonz on 11/26/17.
//  Copyright © 2017 Aeonz. All rights reserved.
//

#import "PresidentTableViewController.h"
#import "PresidentDetailViewController.h"
#import "presidentHelper.h"
#import "PresidentTableViewCell.h"

@interface PresidentTableViewController () <UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong , nonatomic) NSMutableArray *filteredPres;
@property (nonatomic) BOOL isFiltered;

@end

@implementation PresidentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isFiltered = false ;
    self.searchBar.delegate = self;
    self.pListPath = [[NSBundle mainBundle]pathForResource:@"presidentList" ofType:@"plist"];
    self.presidentList = [[NSDictionary alloc]initWithContentsOfFile:self.pListPath];
    self.keys = [[self.presidentList allKeys]sortedArrayUsingSelector:@selector(compare:)];
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"PresBG"]];
    
   // NSLog(@"%@" , self.presidentList[@"Barrock Obama"]);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.isFiltered) {
        return [self.filteredPres count];
    }
    else{
        return [self.presidentList count];
    }
    
    
    //return [self.presidentList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PresidentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"presidentCell" forIndexPath:indexPath];
    NSString *key = [self.keys objectAtIndex:indexPath.row];
    
    // Configure the cell...
    [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"presCellBG"]]];
    
    if (self.isFiltered) {
      //  cell.textLabel.text = self.filteredPres[indexPath.row];
     //   NSLog(@"%@" , self.filteredPres[indexPath.row]);
        cell.cellPresName.text = NULL;
       // cell.cellPresName.text = self.presidentList[key][@"Name"];
        cell.cellPresParty.text = self.filteredPres[indexPath.row];
        cell.cellOfficeTime.text = NULL;
        cell.cellPresImage.image = NULL;
        
        cell.cellPresName.backgroundColor = [UIColor clearColor];
        cell.cellOfficeTime.backgroundColor = [UIColor clearColor];
      
    }
    else{
          cell.cellPresName.text   = self.presidentList[key][@"Name"];
          cell.cellPresParty.text  = self.presidentList[key][@"Party Affilation"];
          cell.cellOfficeTime.text = self.presidentList[key][@"Term Served"];
          cell.cellPresImage.image = [UIImage imageNamed:self.presidentList[key][@"Image"]];
        
        
        cell.cellPresName.backgroundColor = [UIColor blueColor];
        cell.cellOfficeTime.backgroundColor = [UIColor blueColor];
        cell.cellPresParty.backgroundColor = [UIColor blueColor];
      
    }
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    PresidentDetailViewController *detailVC = [segue destinationViewController];
    NSIndexPath *myIndex = [self.tableView indexPathForSelectedRow];
    presidentHelper *item = [[presidentHelper alloc]init];
    NSString *key = [self.keys objectAtIndex:myIndex.row];
    
    item.presBorn = self.presidentList[key][@"Born"];
    item.presPoB =  self.presidentList[key][@"Place of Birth"];
    item.presDeath = self.presidentList[key][@"Death"];
    item.presPoD = self.presidentList[key][@"Place of Death"];
    item.presTookOffice = self.presidentList[key][@"Took Office"];
    item.presAffilation = self.presidentList[key][@"Party Affilation"];
    item.presOccupation = self.presidentList[key][@"Before Office"];
    item.presVice = self.presidentList[key][@"Vice"];
    item.presImage = [UIImage imageNamed:self.presidentList[key][@"Image"]];
    item.presViceImage = [UIImage imageNamed:self.presidentList[key][@"Vice image"]];

    
    detailVC.myPresident = item;
}

#pragma - search bar delegate method
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchText.length == 0) {
        self.isFiltered = false;
    }
    else{
        self.isFiltered = true;
        self.filteredPres = [[NSMutableArray alloc]init];
        for (NSString *pres in self.presidentList){
        NSRange nameRange = [pres rangeOfString:searchText options:NSCaseInsensitiveSearch];
           if ( nameRange.location != NSNotFound) {
              [self.filteredPres addObject:pres];
               
               NSLog(@"%@" , self.filteredPres);
            }
        }
    }
  [self.tableView reloadData];
  
}



@end
