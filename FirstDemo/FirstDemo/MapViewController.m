//
//  MapViewController.m
//  FirstDemo
//
//  Created by SourceKode-iOS on 20/12/14.
//  Copyright (c) 2014 SourceKode. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@property(nonatomic,strong) CLLocationManager *myLocManager;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.mapView.showsUserLocation=YES;
    
    
    
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

@end
