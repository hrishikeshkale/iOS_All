//
//  ViewController.h
//  FirstDemo
//
//  Created by SourceKode-iOS on 08/11/14.
//  Copyright (c) 2014 SourceKode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *firstLabel;

@property (strong,nonatomic) UILabel *dynamicLabel;

@property (strong,nonatomic) UISwitch *secondSwitch;


@property (nonatomic) NSInteger counter;

@property (strong,nonatomic) UIButton *secondButton;
@property (strong,nonatomic)UILabel *sliderValueLabel;

@property (strong,nonatomic) UISlider *secondSlider;

@property(strong,nonatomic) UITextField *textfirst;



- (IBAction)firstSliderMoved:(UISlider *)sender;


- (IBAction)switchToggled:(UISwitch *)sender;


- (IBAction)firstbuttonClicked:(id)sender;


@end

