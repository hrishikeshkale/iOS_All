//
//  NewsFeedTableViewController.m
//  FirstDemo
//
//  Created by SourceKode-iOS on 23/11/14.
//  Copyright (c) 2014 SourceKode. All rights reserved.
//

#import "NewsFeedTableViewController.h"
#import "CommunicationHandler.h"

@interface NewsFeedTableViewController ()<CommunicationHandlerDelegate>

@property(strong,nonatomic) NSArray *articlesArray;

@end

@implementation NewsFeedTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
    
 //   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataRecieved:) name:@"dataRecieved" object:nil];
    
   // [CommunicationHandler makeNetworkRequestForUrlString:@"http://api.feedzilla.com/v1/categories/26/articles.json"];
    
    
    
    
    CommunicationHandler *ch = [[CommunicationHandler alloc]init];
    
    ch.delegate = self;
    
    [ch makeNetworkRequestForUrlString:@"http://api.feedzilla.com/v1/categories/26/articles.json"];
    
}





-(void)dataRecieved:(NSNotification *)notification
{
    NSLog(@"%@",notification.userInfo);
    
    self.articlesArray = notification.userInfo[@"articles"];
    
    dispatch_async(dispatch_get_main_queue(), ^{
    
        [self.tableView reloadData];
    });
}



/// user delegate /////

-(void)recievedData:(NSDictionary*)dataDictionary
{
    self.articlesArray = dataDictionary[@"articles"];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.tableView reloadData];
    });
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.articlesArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsId" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text =self.articlesArray[indexPath.row][@"title"];
    
    
    
    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
