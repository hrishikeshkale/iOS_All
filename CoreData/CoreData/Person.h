//
//  Person.h
//  CoreData
//
//  Created by SourceKode-iOS on 14/12/14.
//  Copyright (c) 2014 iHrishikesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;

@end
