//
//  ViewController.m
//  FirstDemo
//
//  Created by SourceKode-iOS on 08/11/14.
//  Copyright (c) 2014 SourceKode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate,UITextFieldDelegate,AVAudioPlayerDelegate>
@property(nonatomic,strong) AVAudioPlayer *audioPlayer;

@end


@implementation ViewController

NSInteger cnt;


- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.firstLabel.text=@"New Hello";
    self.firstLabel.textColor = [UIColor blueColor];
    self.firstLabel.textAlignment = NSTextAlignmentCenter;
    
    
    

    
    // NSArray *ff = [UIFont familyNames];
    
    NSArray *fn = [UIFont fontNamesForFamilyName:@"Verdana"];
    
    
    //NSLog(@"Font Family %@",ff);
    
    NSLog(@"Font with Family Names %@",fn);
    
    self.firstLabel.font = [UIFont fontWithName:@"Verdana-BoldItalic" size:20];
    self.counter=0;
    
    
    
    
    ////// Dynamic Button ////////
    
    self.secondButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.secondButton.frame = CGRectMake(10, 150, 150, 44);
    [self.secondButton setTitle:@"Second Button" forState:UIControlStateNormal];
    
    [self.view addSubview:self.secondButton];
    
    
    [self.secondButton addTarget:self action:@selector(secondButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //----------------------------------------//
    
    
    ///// Dynamic Switch /////
    
    self.secondSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(200, 150, 150, 44)];
    
    
    [self.view addSubview:self.secondSwitch];
    
    [self.secondSwitch addTarget:self action:@selector(secondSwitchToggled:) forControlEvents:UIControlEventValueChanged];
    [self.secondSwitch setOn:YES];
    
    
    
    
    /////////////////////
    
    
    
    ///// TextField //////////////
    
    self.textfirst = [[UITextField alloc]initWithFrame:CGRectMake(15, 300, 150, 44)];
    
    [self.view addSubview:self.textfirst];
    
    
    
    
    // -------------------------------------------------------- //
    
    ///
    
    self.textfirst.delegate = self;
    
    // ------------------- ///
    
    ///// Slider Value Label ////////
    
    self.sliderValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.secondButton.frame.origin.x, self.secondButton.frame.origin.y+ self.secondButton.frame.size.height
                                                                      , 400, 100)];
    
    
    self.sliderValueLabel.text = @" Slider Value Label";
    [self.view addSubview:self.sliderValueLabel];
    
    /// Dynamic Slider //////
    
    self.secondSlider = [[UISlider alloc] initWithFrame:CGRectMake(500, 300, 200, 50)];
    
    [self.view addSubview:self.secondSlider];
    
    
    /// Dynamic Label/////
    
    
    /// Normal Positioning ////
    
    //self.dynamicLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, 200, 100)];
    
    
    // Dynamic Positioning ///
     self.dynamicLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.firstLabel.frame.origin.x,self.firstLabel.frame.origin.y + self.firstLabel.frame.size.height, 200, 100)];
    
    self.dynamicLabel.text = @"Dynamic Label";
    [self.view addSubview:self.dynamicLabel];
    
    ///// Animation ////////////
    
    
    
    
    
    [UIView animateWithDuration:3.0 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.firstLabel.alpha = 0.0;
        self.dynamicLabel.frame=CGRectMake(100, 300, 200, 50);
    } completion:^(BOOL finished) {
        NSLog(@"%d",finished);
    }];
  //------------------------------------------//

    
    
    
    
    dispatch_queue_t dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    
    dispatch_async(dispatchQueue, ^(void){
        NSBundle *manibundle = [NSBundle mainBundle];
        
        NSString *filePath = [manibundle pathForResource:@"Jee Karda" ofType:@"mp3"];
        
        NSData *fileData = [NSData dataWithContentsOfFile:filePath];
        
        NSError *error = nil;
        
        
        
        
        /// start audio Player ///
        
        self.audioPlayer = [[AVAudioPlayer alloc]initWithData:fileData error:&error];
        
        
        
        // Did we gaet an instance of Av AudioPlayer
        
        if (self.audioPlayer != nil) {
            // set the delegate and start playing
            
            self.audioPlayer.delegate=self;
            
            if ([self.audioPlayer prepareToPlay]&& [self.audioPlayer play]) {
                NSLog(@"Playing Song");
            }
        }
        
    });
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textfirst resignFirstResponder];
    return YES;
}



//// First Slider  //////

- (IBAction)firstSliderMoved:(UISlider *)sender {
    
    
    NSLog(@"Slider Value :%f",sender.value);
    
    ///
    self.sliderValueLabel.text = [NSString stringWithFormat:@"Slider Value %f",sender.value];
    
}

- (IBAction)switchToggled:(UISwitch *)sender {
    
    //NSLog(@"Switch Toggled %d",sender.on);
    
    
    if (sender.on == 1) {
        NSLog(@"First Switch Enabled");
    }
    else
    {
        NSLog(@"First Switch Disabled");
    }
}





/// firstButtonClicked ///////
- (IBAction)firstbuttonClicked:(id)sender {
    
   cnt++;
    NSLog(@"First button Clicked %ld",cnt);
    
  ///  NSString *btnTitle = [NSString stringWithFormat:@"Clicked %ld",cnt];
    self.counter++;
    
   NSString *btnTitle = [NSString stringWithFormat:@"Clicked %ld",self.counter];
    
    
    if (self.counter == 10)
    {
        
        [sender setTitle:@"Disabled" forState:UIControlStateNormal];
        
    }
    else
    {
         [sender setTitle:btnTitle forState:UIControlStateNormal];
    }
    
    /// Alert view
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Button Clicked" message:@"First Button Clicked" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",@"Retry" ,nil];
    [alertView show];
   
    
    //[sender setTitle:@"Button Clicked" forState:0];
    
  // [sender setTitle:[NSString stringWithFormat:@"Clicked %ld",cnt] forState:0];
    
    
    
}

///-----------------------------------///


//// Second Button Clicked Action ///////

-(void) secondButtonClicked:(UIButton *) sender
{
    NSLog(@"Second button Clicked" );
    
    UIAlertView *secondAlert = [[UIAlertView alloc]initWithTitle:@"Button Clicked" message:@"First Button Clicked" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
    
    secondAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    
    
    
    
    [secondAlert show];
    
    
    
}


///// Second Switch Toggled ////////

-(void) secondSwitchToggled:(UISwitch *) sender
{
   // NSLog(@"Second Switch Toggled %d",sender.on);
    
    if (sender.on == 1) {
        NSLog(@"Second Switch Enabled");
    }
    else
    {
        NSLog(@"Second Switch Disabled");
    }
    
}

//// Alert view Buttton Index ...

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSLog(@"Index:%ld",buttonIndex);
    
  /*  if (buttonIndex==0) {
        NSLog(@"Cancel button Clicked");
    }
    else if (buttonIndex==1)
    {
        NSLog(@"OK Button Clicked");
    }
    else if (buttonIndex==2)
    {
        NSLog(@"Cancel button Clicked");
    }*/
    
    if ([alertView.title isEqualToString:@"Button Clicked"]) {
        
        if ([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"OK"]) {
            NSLog(@"Second AlertView,%@ button Clicked",[alertView buttonTitleAtIndex:buttonIndex]);
            
            NSLog(@"Text %@",[alertView textFieldAtIndex:0].text);
        }
        
        
    }
    
}




@end
