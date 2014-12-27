//
//  BrowserViewController.m
//  FirstDemo
//
//  Created by SourceKode-iOS on 15/11/14.
//  Copyright (c) 2014 SourceKode. All rights reserved.
//

#import "BrowserViewController.h"

@interface BrowserViewController ()

@end

@implementation BrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = @"Browser";
    
    
    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    NSURLRequest *request= [NSURLRequest requestWithURL:url];
    
    [self.bWebView loadRequest:request];
    
    
    
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

- (IBAction)goButton:(UIBarButtonItem *)sender {
    
    NSURL *url = [NSURL URLWithString:self.textUrl.text];
    
    NSURLRequest *request = [NSURLRequest
                             requestWithURL:url];
    
    [self.bWebView loadRequest:request];
    
    
}

- (IBAction)goForward:(UIBarButtonItem *)sender
{
    if (self.bWebView.canGoForward == YES) {
        
        self.goFwdButton.enabled = YES;
        [self.bWebView goForward];
    }
    
    else if (self.bWebView.canGoBack == YES)
    {
        self.goBackbutton.enabled=YES;
        self.goFwdButton.enabled = NO;
        
    }
    
    
}


- (IBAction)goBack:(UIBarButtonItem *)sender
{
    
    if (self.bWebView.canGoBack == YES) {
        self.goBackbutton.enabled =YES;
        [self.bWebView goBack];
    }
    
    else if (self.bWebView.canGoForward == YES)
    {
        self.goFwdButton.enabled = YES;
        self.goBackbutton.enabled = NO;
    }
    
    
}

- (IBAction)refreshButton:(UIBarButtonItem *)sender
{
    
    [self.bWebView reload];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textUrl resignFirstResponder];
    return YES;
}



@end
