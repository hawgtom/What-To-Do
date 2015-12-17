//
//  ViewController.m
//  What To Do
//
//  Created by Gowtham on 14/12/15.
//  Copyright © 2015 Gowtham. All rights reserved.
//

#import "ViewController.h"
#import "DBManager.h"
@interface ViewController ()

@property (nonatomic, strong) DBManager *dbManager;
-(void)loadData;
@property (nonatomic, strong) NSArray *arrPeopleInfo;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.list.delegate = self;
    self.list.dataSource = self;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"sampledb.sql"];
    
    // Load the data.
    [self loadData];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)loadData{
    // Form the query.
    NSString *query = @"select * from todo";
    NSLog(@"Hai");
    // Get the results.
    if (self.arrPeopleInfo != nil) {
        self.arrPeopleInfo = nil;
    }
    self.arrPeopleInfo = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    // Reload the table view.
    [self.list reloadData];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the selected record.
        // Find the record ID.
        int recordIDToDelete = [[[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:0] intValue];
        NSLog(@"ID : %d",recordIDToDelete);
        // Prepare the query.
        NSString *query = [NSString stringWithFormat:@"delete from todo where id=%d", recordIDToDelete];
        
        // Execute the query.
        [self.dbManager executeQuery:query];
        
        // Reload the table view.
        [self loadData];
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrPeopleInfo.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSInteger indextask = [self.dbManager.arrColumnNames indexOfObject:@"task"];
    NSInteger indexdate = [self.dbManager.arrColumnNames indexOfObject:@"date"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indextask]];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Date: %@", [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexdate]];
    
    return cell;
}

-(void)editingInfoWasFinished{
    // Reload the data.
    NSLog(@"Dudu");
    [self loadData];
}
- (IBAction)add:(id)sender {
    [self performSegueWithIdentifier:@"addsegue" sender:self];
}
@end
