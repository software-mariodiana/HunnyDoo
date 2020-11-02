//
//  ViewController.m
//  HunnyDoo
//
//  Created by Mario Diana on 10/27/20.
//  Copyright © 2020 Mario Diana.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.
//  

#import "ViewController.h"
#import "ItemDetailViewController.h"

@interface NSDate (ISO8601)
- (NSString *)canonicalTimestamp;
@end

@implementation NSDate (ISO8601)

- (NSString *)canonicalTimestamp
{
    static NSISO8601DateFormatter* formatter;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        formatter = [[NSISO8601DateFormatter alloc] init];
        formatter.formatOptions = NSISO8601DateFormatWithInternetDateTime;
    });
    
    return [formatter stringFromDate:self];
}

@end

@interface Item : NSObject
@property (nonatomic, copy) NSString* task;
@property (nonatomic, copy) NSString* dueDate;
@end

@implementation Item
@end

// This must match the string setup in the Storyboard.
NSString* const HunnyDooTableCellIdentifier = @"HunnyDooTableCellIdentifier";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, HunnyDooItemDelegate>
@property (nonatomic, strong) NSMutableArray* items;
@property (nonatomic, weak) IBOutlet UITableView* tableView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"To do";
    self.items = [NSMutableArray array];
}

- (IBAction)addTodoItem:(id)sender
{
    NSUInteger index = [[self items] count];
    
    Item* item = [[Item alloc] init];
    item.task = [NSString stringWithFormat:@"Item #%ld", index + 1];
    item.dueDate = [[NSDate date] canonicalTimestamp];
    [[self items] addObject:item];
    
    [self showModalForItemAtIndex:index newItem:YES];
}

- (void)showModalForItemAtIndex:(NSUInteger)index newItem:(BOOL)newItem
{
    UINavigationController* detail =
        [[self storyboard] instantiateViewControllerWithIdentifier:@"ItemDetailNavigationController"];
    
    id detailVC = [detail topViewController];
    [detailVC setDelegate:self];
    [detailVC setIndex:index];
    [detailVC setNewItem:newItem];
    
    [self presentViewController:detail animated:YES completion:nil];
}

- (void)itemDidUpdateWithDetails:(id)itemDetails
{
    Item* item = [[self items] objectAtIndex:[[itemDetails valueForKey:@"index"] integerValue]];
    [item setTask:[itemDetails valueForKey:@"text"]];
    [item setDueDate:[[itemDetails valueForKey:@"dueDate"] canonicalTimestamp]];
    [[self tableView] reloadData];
}

- (void)itemDidDelete:(id)itemDetails
{
    NSUInteger index = [[itemDetails valueForKey:@"index"] integerValue];
    [[self items] removeObjectAtIndex:index];
    [[self tableView] reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:HunnyDooTableCellIdentifier];
    
    UIListContentConfiguration* content = cell.defaultContentConfiguration;
    content.image = [UIImage systemImageNamed:@"pin.circle"];
    content.imageProperties.tintColor = [UIColor purpleColor];
    
    Item* item = [[self items] objectAtIndex:[indexPath row]];
    
    content.text = [item task];
    content.secondaryText = [item dueDate];
    
    cell.contentConfiguration = content;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[self items] count];
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[self items] removeObjectAtIndex:[indexPath row]];
    [tableView reloadData];
}

- (void)tableView:(UITableView *)tableView
accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger index = [indexPath row];
    
    //TODO: We must display current state!
    [self showModalForItemAtIndex:index newItem:NO];
}

@end
