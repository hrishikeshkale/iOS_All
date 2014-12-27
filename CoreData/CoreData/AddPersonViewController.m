//
//  AddPersonViewController.m
//  CoreData
//
//  Created by SourceKode-iOS on 20/12/14.
//  Copyright (c) 2014 iHrishikesh. All rights reserved.
//

#import "AddPersonViewController.h"
#import "Person.h"
#import "AppDelegate.h"

@interface AddPersonViewController ()

@end

@implementation AddPersonViewController

-(NSManagedObjectContext *)managedObjectContext {
    
    AppDelegate *ad = [[UIApplication sharedApplication]delegate];
    
    return ad.managedObjectContext;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)addPersonButton:(id)sender {
    
    NSLog(@"ADD button Clicked");
    
    NSLog(@"%@",self.fName.text);
    NSLog(@"%@",self.lName.text);
    NSLog(@"%@",self.age.text);
    
    
    NSNumber *numberedAge = [NSNumber numberWithInt:(int)self.age.text.integerValue];
    
    /////////////////////////////////
    
   // BOOL result = NO;
    
    if ([self.fName.text length] == 0 || [self.lName.text length]==0) {
        
        NSLog(@"COMPULSORY");
       // return NO;
    }
    
    
    Person *newPerson = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.managedObjectContext];
    
    if (newPerson == nil) {
        NSLog(@"failed To crreate Person");
      //  return NO;
    }
    
    // newPerson.firstName = @"Steve";
    //  newPerson.lastName=@"Jobs";
    //  newPerson.age=@56;
    
    
    
    newPerson.firstName = self.fName.text;
    newPerson.lastName=self.lName.text;
    newPerson.age=numberedAge;
   
    
    
    NSError *savingError=nil;
    if ([self.managedObjectContext save:&savingError]) {
        
        NSLog(@"Saved Successfully");
        
       // return YES;
    }
    else{
        NSLog(@"FAILed with Error : %@",savingError);
        
    }
    
  //  return result;
    
    
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}


@end
