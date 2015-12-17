//
//  ToDoListTableViewController.h
//  What To Do
//
//  Created by Gowtham on 14/12/15.
//  Copyright © 2015 Gowtham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddToDoItemViewController.h"
@interface ToDoListTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource,EditInfoViewControllerDelegate>
- (IBAction)add:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *list;
-(void)viewDidLoad;
@end
