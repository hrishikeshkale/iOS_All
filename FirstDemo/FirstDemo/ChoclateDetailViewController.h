//
//  ChoclateDetailViewController.h
//  FirstDemo
//
//  Created by SourceKode-iOS on 16/11/14.
//  Copyright (c) 2014 SourceKode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoclateDetailViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong,nonatomic)NSString *name;


- (IBAction)swipeUp:(UISwipeGestureRecognizer *)sender;

@end
