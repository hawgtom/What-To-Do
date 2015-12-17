//
//  ViewController.h
//  What To Do
//
//  Created by Gowtham on 14/12/15.
//  Copyright © 2015 Gowtham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoListTableViewController.h"
@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, EditInfoViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *list;
- (IBAction)add:(id)sender;

@end

