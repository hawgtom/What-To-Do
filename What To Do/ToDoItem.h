//
//  ToDoItem.h
//  What To Do
//
//  Created by Gowtham on 14/12/15.
//  Copyright © 2015 Gowtham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject
@property NSString *itemName;

@property BOOL completed;

@property NSDate *TargetDate;
@end
