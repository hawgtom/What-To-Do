//
//  AddToDoItemViewController.h
//  What To Do
//
//  Created by Gowtham on 14/12/15.
//  Copyright © 2015 Gowtham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"
@protocol EditInfoViewControllerDelegate

-(void)editingInfoWasFinished;

@end


@interface AddToDoItemViewController : UIViewController<UITextFieldDelegate>
@property (retain, nonatomic) IBOutlet UITextField *textField;
- (IBAction)save:(id)sender;

@property (nonatomic, strong) id<EditInfoViewControllerDelegate> delegate;
@property (retain, nonatomic) IBOutlet UIDatePicker *datePicker;

@end
