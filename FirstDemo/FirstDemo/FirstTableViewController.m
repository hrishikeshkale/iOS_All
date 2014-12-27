//
//  FirstTableViewController.m
//  FirstDemo
//
//  Created by SourceKode-iOS on 16/11/14.
//  Copyright (c) 2014 SourceKode. All rights reserved.
//

#import "FirstTableViewController.h"
#import "ChoclateDetailViewController.h"

@interface FirstTableViewController ()

@property(strong,nonatomic) NSMutableArray *indianChoclates;

@property(strong,nonatomic) NSMutableArray *foreignChoclates;


@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    self.title = @"Choclates";
    
   // self.indianChoclates = @[@"Eclairs",@"Melody",@"Mangobite"];
    
  //  self.foreignChoclates= @[@"Snickers",@"Ferrero",@"Hershley"];
    
    self.indianChoclates = [[NSMutableArray alloc]initWithObjects:@"Eclairs",@"Melody",@"Mangobite", nil];
    
    self.foreignChoclates=[[NSMutableArray alloc]initWithObjects:@"Snickers",@"Ferrero",@"Hershley", nil];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    
    switch (section)
    {
        case 0:
            return self.indianChoclates.count;
            break;
            
            case 1:
            return self.foreignChoclates.count;
            break;
            
        default: 
          return 0;
            
    }
    
    
    

}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"Indian";
            break;
            
        case 1:
            return @"Foreign";
            break;
        default:
            return @"";
            break;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    
  //  cell.textLabel.text = [NSString stringWithFormat:@"%ld %ld",indexPath.section,indexPath.row];
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = self.indianChoclates[indexPath.row];
            break;
  
        case 1:
            cell.textLabel.text=self.foreignChoclates[indexPath.row];
            break;
            
        default:
            break;
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


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //Delete the row from the data source
       
        switch (indexPath.section) {
            case 0:
                [self.indianChoclates removeObjectAtIndex:indexPath.row];
                break;
            case 1:
                [self.foreignChoclates removeObjectAtIndex:indexPath.row];
                break;
            default:
                break;
        }
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
       
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    ChoclateDetailViewController *Dvc=[segue destinationViewController];
    NSIndexPath *selectedIP=[self.tableView indexPathForSelectedRow];
    UITableViewCell *cell=[self.tableView cellForRowAtIndexPath:selectedIP];
    Dvc.name=cell.textLabel.text;
}


@end
