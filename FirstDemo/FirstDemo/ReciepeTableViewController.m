//
//  ReciepeTableViewController.m
//  FirstDemo
//
//  Created by SourceKode-iOS on 22/11/14.
//  Copyright (c) 2014 SourceKode. All rights reserved.
//

#import "ReciepeTableViewController.h"
#import "ReciepeDetailViewController.h"
#import "ReciepeTableViewCell.h"
#import "CommunicationHandler.h"


@interface ReciepeTableViewController ()


@property(strong,nonatomic)NSMutableArray *reciepeArray;

@end

@implementation ReciepeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    /*
    
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"ReciepeList" ofType:@"plist"];
    
   // self.reciepeArray = [NSArray arrayWithContentsOfFile:plistPath];
    
    self.reciepeArray = [[NSArray alloc]initWithContentsOfFile:plistPath];
    
    NSLog(@"%@",self.reciepeArray);
    
    */
    
    NSArray *sandBoxPathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentPath = [sandBoxPathArray firstObject];
    NSLog(@"%@",documentPath);
    
    NSString *plistDocumentPath = [documentPath stringByAppendingPathComponent:@"ReciepeList.plist"];
    
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:plistDocumentPath]) {
        self.reciepeArray = [[NSMutableArray alloc]initWithContentsOfFile:plistDocumentPath];
        
    }
    
    else
    {
        self.reciepeArray = [[NSMutableArray alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ReciepeList" ofType:@"plist"]];
    }
    
    [self.reciepeArray addObject:@{@"imageName":@"iTandoori.png",@"name":@"Tandoori",@"ingredients":@"asdfhjh",@"procedure":@"qwert"}];
    
    [self.reciepeArray writeToFile:plistDocumentPath atomically:YES];
    
  //  [CommunicationHandler makeNetworkRequestForUrlString:@"http://api.feedzilla.com/v1/categories/26/articles.json"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.reciepeArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReciepeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reciepeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
  //  cell.textLabel.text = self.reciepeArray[indexPath.row][@"name"];
  //  cell.imageView.image = [UIImage imageNamed:self.reciepeArray[indexPath.row][@"imageName"]];
    
    cell.nameLabel.text = self.reciepeArray[indexPath.row][@"name"];
    cell.reciepeImageView.image = [UIImage imageNamed:self.reciepeArray[indexPath.row][@"imageName"]];
    
    
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
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    ReciepeDetailViewController *dvc = [segue destinationViewController];
    
    NSIndexPath *selectedIp = [self.tableView indexPathForSelectedRow];
    
    NSDictionary *reciepeDictionary = self.reciepeArray[selectedIp.row];
    
    dvc.reciepeDictionary = reciepeDictionary;
    
    
    
    
    
    
}


@end
