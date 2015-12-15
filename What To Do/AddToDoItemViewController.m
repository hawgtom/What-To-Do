//
//  AddToDoItemViewController.m
//  What To Do
//
//  Created by Gowtham on 14/12/15.
//  Copyright © 2015 Gowtham. All rights reserved.
//

#import "AddToDoItemViewController.h"

@interface AddToDoItemViewController ()
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (retain, nonatomic) IBOutlet UITextField *textField;

@end

@implementation AddToDoItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 if (sender != self.saveButton) return;
 
 if (self.textField.text.length > 0) {
  self.toDoItem = [[ToDoItem alloc] init];
  self.toDoItem.itemName = self.textField.text;
  self.toDoItem.completed = NO;
  self.toDoItem.TargetDate=self.datePicker.date;
     NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
     
     // Get the current date
     NSDate *pickerDate = [self.datePicker date];
     
     // Break the date up into components
     NSDateComponents *dateComponents = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit )
                                                    fromDate:pickerDate];
     NSDateComponents *timeComponents = [calendar components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit )
                                                    fromDate:pickerDate];
     // Set up the fire time
     NSDateComponents *dateComps = [[NSDateComponents alloc] init];
     [dateComps setDay:[dateComponents day]];
     [dateComps setMonth:[dateComponents month]];
     [dateComps setYear:[dateComponents year]];
     [dateComps setHour:[timeComponents hour]];
     // Notification will fire in one minute
     [dateComps setMinute:[timeComponents minute]];
     [dateComps setSecond:[timeComponents second]];
     NSDate *itemDate = [calendar dateFromComponents:dateComps];
     [dateComps release];
     
     UILocalNotification *localNotif = [[UILocalNotification alloc] init];
     if (localNotif == nil)
         return;
     localNotif.fireDate = itemDate;
     NSLog(@"%@",localNotif.fireDate);
     localNotif.timeZone = [NSTimeZone defaultTimeZone];
     
     // Notification details
     localNotif.alertBody = [self.textField text];
     // Set the action button
     localNotif.alertAction = @"View";
     
     localNotif.soundName = UILocalNotificationDefaultSoundName;
     localNotif.applicationIconBadgeNumber = 1;
     
     // Specify custom data for the notification
     NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"someValue" forKey:@"someKey"];
     localNotif.userInfo = infoDict;
     
     // Schedule the notification
     [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
     [localNotif release];
  /*   UILocalNotification* localNotification = [[UILocalNotification alloc] init];
     
     NSDate *myDate = self.datePicker.date;
     
     
     NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
     [dateFormat setDateFormat:@"YYYY-MM-dd hh:mm:ss Z"];
     NSString *prettyVersion = [dateFormat stringFromDate:myDate];
     NSDate *yourDate = [dateFormat dateFromString:prettyVersion];
     NSLog(@"%@",prettyVersion);
     localNotification.timeZone = [NSTimeZone defaultTimeZone];
     localNotification.fireDate = yourDate;
     NSLog(@"%@",localNotification.fireDate);
     localNotification.alertBody = self.textField.text;
     localNotification.alertAction = @"Show me the item";
     NSLog(@"%@",localNotification.timeZone);
     localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
     
     [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
     
     // Request to reload table view data
     [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:self];

     NSDate *myDate = self.datePicker.date;
     
     NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
     [dateFormat setDateFormat:@"cccc, MMM d, hh:mm aa"];
     NSString *prettyVersion = [dateFormat stringFromDate:myDate];
     NSLog(@"%@",prettyVersion);
   */
   }
}

- (IBAction)backtap:(id)sender {
    [self.textField endEditing:YES];
}

- (void)dealloc {
    [_saveButton release];
    [_textField release];
    [super dealloc];
}
@end
