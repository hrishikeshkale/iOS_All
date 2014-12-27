//
//  CommunicationHandler.m
//  FirstDemo
//
//  Created by SourceKode-iOS on 23/11/14.
//  Copyright (c) 2014 SourceKode. All rights reserved.
//

#import "CommunicationHandler.h"
@import UIKit;

@implementation CommunicationHandler

+(void)makeNetworkRequestForUrlString:(NSString *)urlString {

    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible =YES;

    
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
      //  NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible =NO;
        
        
       // NSArray *articleArray = dataDictionary[@"articles"];
        
        
      //  NSLog(@"%@,%@,%@",response,articleArray[0][@"title"],connectionError);
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"dataRecieved" object:nil userInfo:dataDictionary];
    }];
    

}


-(void)makeNetworkRequestForUrlString:(NSString *)urlString{
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible =YES;
    
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        //  NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible =NO;
        
        
        // NSArray *articleArray = dataDictionary[@"articles"];
        
        
        //  NSLog(@"%@,%@,%@",response,articleArray[0][@"title"],connectionError);
        
        //[[NSNotificationCenter defaultCenter]postNotificationName:@"dataRecieved" object:nil userInfo:dataDictionary];
        
       
        if ([self.delegate respondsToSelector:@selector(recievedData:)])
        
        {
            [self.delegate recievedData:dataDictionary];
        }
    }];
    
    
}


@end
