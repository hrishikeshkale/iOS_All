//
//  ReciepeDetailViewController.m
//  FirstDemo
//
//  Created by SourceKode-iOS on 22/11/14.
//  Copyright (c) 2014 SourceKode. All rights reserved.
//

#import "ReciepeDetailViewController.h"
#import <Social/Social.h>
#import <MessageUI/MessageUI.h>

@interface ReciepeDetailViewController ()<UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *ingredientLabel;

@property (weak, nonatomic) IBOutlet UILabel *procedureLabel;


@end

@implementation ReciepeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    self.title = self.reciepeDictionary[@"name"];
    
    
    
    
    self.imageView.image =[UIImage imageNamed:self.reciepeDictionary[@"imageName"]];
    
    self.nameLabel.text = self.reciepeDictionary[@"name"];
    
    self.ingredientLabel.text = self.reciepeDictionary[@"ingredients"];
    
    self.procedureLabel.text = self.reciepeDictionary[@"procedure"];
    
    
    [self.ingredientLabel setPreferredMaxLayoutWidth:0.8 * self.view.frame.size.width];
    self.ingredientLabel.numberOfLines=0;
    
    
    
    [self.procedureLabel setPreferredMaxLayoutWidth:0.8 * self.view.frame.size.width];
    self.procedureLabel.numberOfLines=0;
    
    
    
    NSLog(@"%@",self.reciepeDictionary);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.ingredientLabel setPreferredMaxLayoutWidth:0.8 * self.view.frame.size.width];
    
    self.ingredientLabel.numberOfLines=0;


    [self.procedureLabel setPreferredMaxLayoutWidth:0.8 * self.view.frame.size.width];
    self.procedureLabel.numberOfLines=0;


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

- (IBAction)shareButton:(id)sender
{
    NSLog(@"Share Button Clicked");
    
    // UiActionSheet //
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"Share With" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Facebook",@"Twitter",@"Email", nil];
    
    [actionSheet showInView:self.view];
    
    
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Index:%ld",buttonIndex);
    
    NSString *actionButtonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([actionButtonTitle isEqualToString:@"Facebook"]) {
        
       // NSLog(@"Facebook Button Clicked");
        
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
        {
            SLComposeViewController *svc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            
            [svc setInitialText:self.ingredientLabel.text];
            [svc addImage:self.imageView.image];
            [self presentViewController:svc animated:YES completion:nil];
            
      
            
        }
        else{
            
            UIAlertView *alV = [[UIAlertView alloc]initWithTitle:@"No Facebook A/c" message:@"Facebook A/C Required" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
            [alV show];
        }
        
        
    
    }
    else if ([actionButtonTitle isEqualToString:@"Twitter"])
    {
       // NSLog(@"Twitter Clicked");
        
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
            SLComposeViewController *svc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            
            [svc setInitialText:self.nameLabel.text];
            [svc addImage:self.imageView.image];
            
            
            /*svc.completionHandler = ^(SLComposeViewControllerResult result){
                NSLog(@"Result is %ld",result);
            
            };*/
            
            [self presentViewController:svc animated:YES completion:nil];
            
        }else{
            UIAlertView *alV = [[UIAlertView alloc]initWithTitle:@"No Twitter A/c" message:@"Twitter A/C Required" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
            [alV show];
        }
        
        
        
        
    }else if ([actionButtonTitle isEqualToString:@"Email"])
    {
        if ([MFMailComposeViewController canSendMail]) {
            
            MFMailComposeViewController *mvc = [[MFMailComposeViewController alloc]init];
            
            [mvc setSubject:self.nameLabel.text];
            [mvc setToRecipients:@[@"hrishikeshkale13@gmail.com"]];
            [mvc setMessageBody:self.ingredientLabel.text isHTML:YES];
            [mvc presentViewController:mvc animated:YES completion:nil];
            
        }else
        {
            UIAlertView *alV = [[UIAlertView alloc]initWithTitle:@"No Email ID" message:@"Email Id Required" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
            [alV show];
        }
    }
    
    
}

@end
