//
//  CoreDataTableViewController.m
//  CoreData
//
//  Created by SourceKode-iOS on 14/12/14.
//  Copyright (c) 2014 iHrishikesh. All rights reserved.
//

#import "CoreDataTableViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Person.h"

@interface CoreDataTableViewController ()<NSFetchedResultsControllerDelegate>

@property(nonatomic,strong)NSFetchedResultsController *frc;
@property(nonatomic,strong) UIBarButtonItem *addPersonBarButton;

@end

@implementation CoreDataTableViewController



-(NSManagedObjectContext *)managedObjectContext {

    AppDelegate *ad = [[UIApplication sharedApplication]delegate];
    
    return ad.managedObjectContext;

}


- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView beginUpdates];
}



- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath{
    
    
    
    if (type==NSFetchedResultsChangeDelete) {
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    else if (type ==NSFetchedResultsChangeInsert){
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    }
    
    
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView endUpdates];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    self.title =@"Persons";
    
    self.addPersonBarButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewPerson:)];
    
    [self.navigationItem setRightBarButtonItem:self.addPersonBarButton animated:NO];
    
    
    
    
    
    
    
    
    NSFetchRequest *fetchrequest = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    
    NSSortDescriptor *firstNameSort = [NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES];
    
    fetchrequest.sortDescriptors=@[firstNameSort];
    
    self.frc = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchrequest managedObjectContext:[self managedObjectContext] sectionNameKeyPath:nil cacheName:nil];
    
    
    self.frc.delegate=self;
    
    
    
    NSError *fetchError = nil;
    
    if ([self.frc performFetch:&fetchError]) {
        
        NSLog(@"Successfully Fetched");
    }
    else
    {
        NSLog(@" Failed to Fetch");
    }
    
    
    
    
    
    
    
    
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
    
    id<NSFetchedResultsSectionInfo> sectionInfo = self.frc.sections[section];
    
    return [sectionInfo numberOfObjects];
    
    
    
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"personCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    Person *person = [self.frc objectAtIndexPath:indexPath];
    
    cell.textLabel.text = person.firstName;
    
    
    
    
    
    return cell;
}


-(void) addNewPerson:(id)sender{
    NSLog(@"Add New Person");
    
    [self performSegueWithIdentifier:@"addPersonSegue" sender:nil];
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
        // Delete the row from the data source
       // [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
        Person *personToDelete = [self.frc objectAtIndexPath:indexPath];
        
        [[self managedObjectContext] deleteObject:personToDelete];
        
        
        if ([personToDelete isDeleted]) {
            NSError *savingError = nil;
            
            if ([[self managedObjectContext] save:&savingError]) {
                NSLog(@"Successfully Deleted");
            }else
            {
                NSLog(@"Failed to save the context with error = %@",savingError);
            }
        }
        
        
        
        
        
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
