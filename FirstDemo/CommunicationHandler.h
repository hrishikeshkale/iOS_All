//
//  CommunicationHandler.h
//  FirstDemo
//
//  Created by SourceKode-iOS on 23/11/14.
//  Copyright (c) 2014 SourceKode. All rights reserved.
//

#import <Foundation/Foundation.h>

/// user define delegate ////

@protocol CommunicationHandlerDelegate <NSObject>


-(void)recievedData:(NSDictionary*)dataDictionary;

@end





@interface CommunicationHandler : NSObject



@property(nonatomic,weak)id<CommunicationHandlerDelegate> delegate;

+(void)makeNetworkRequestForUrlString:(NSString *)urlString;

-(void)makeNetworkRequestForUrlString:(NSString *)urlString;




@end
