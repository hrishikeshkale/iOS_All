//
//  BrowserViewController.h
//  FirstDemo
//
//  Created by SourceKode-iOS on 15/11/14.
//  Copyright (c) 2014 SourceKode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowserViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *bWebView;

@property (weak, nonatomic) IBOutlet UITextField *textUrl;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *goBackbutton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *goFwdButton;


- (IBAction)goButton:(UIBarButtonItem *)sender;

- (IBAction)goForward:(UIBarButtonItem *)sender;

- (IBAction)goBack:(UIBarButtonItem *)sender;

- (IBAction)refreshButton:(UIBarButtonItem *)sender;

@end
