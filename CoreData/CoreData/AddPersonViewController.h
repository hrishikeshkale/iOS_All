//
//  AddPersonViewController.h
//  CoreData
//
//  Created by SourceKode-iOS on 20/12/14.
//  Copyright (c) 2014 iHrishikesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPersonViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *fName;
@property (weak, nonatomic) IBOutlet UITextField *lName;
@property (weak, nonatomic) IBOutlet UITextField *age;


- (IBAction)addPersonButton:(id)sender;



@end
