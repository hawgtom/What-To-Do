//
//  ToDoListTableViewController.m
//  What To Do
//
//  Created by Gowtham on 14/12/15.
//  Copyright © 2015 Gowtham. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoItem.h"
#import "AddToDoItemViewController.h"
@interface ToDoListTableViewController ()
@property NSMutableArray *toDoItems;
@end

@implementation ToDoListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc] init];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    AddToDoItemViewController *source = [segue sourceViewController];
    
    ToDoItem *item = source.toDoItem;
    
    if (item != nil) {
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
        
    }
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove the row from data model
    [self.toDoItems removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.toDoItems count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    UILabel *item = (UILabel *)[cell viewWithTag:1];
    item.text = toDoItem.itemName;
    UILabel *targetDate = (UILabel *)[cell viewWithTag:2];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"cccc, MMM d, hh:mm aa"];
    NSString *prettyVersion = [dateFormat stringFromDate:toDoItem.TargetDate];

    targetDate.text = prettyVersion;

     if (toDoItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    } else {
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        
    }

    return cell;
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    if (toDoItem.completed) {
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    } else {
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        
    }
    
    return cell;
    
}
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath
                                                                    
                                                                    *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    
    tappedItem.completed = !tappedItem.completed;
    
    [tableView reloadRowsAtIndexPaths:@[indexPath]    
                     withRowAnimation:UITableViewRowAnimationNone];
    
}
@end
