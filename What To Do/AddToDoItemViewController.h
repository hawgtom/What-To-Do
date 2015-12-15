//
//  AddToDoItemViewController.h
//  What To Do
//
//  Created by Gowtham on 14/12/15.
//  Copyright © 2015 Gowtham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"
@interface AddToDoItemViewController : UIViewController<UITextFieldDelegate>
@property ToDoItem *toDoItem;
@end
