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

// This must match the string setup in the Storyboard.
NSString* const HunnyDooTableCellIdentifier = @"HunnyDooTableCellIdentifier";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
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
    NSUInteger index = [[self items] count] + 1;
    NSString* item = [NSString stringWithFormat:@"Item #%ld", index];
    [[self items] addObject:item];
    [[self tableView] reloadData];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    NSLog(@"## %@ - %@", NSStringFromSelector(_cmd), self);
//    NSLog(@"##     Sender: %@", sender);
//    UIViewController* vc = [segue destinationViewController];
//    NSLog(@"##     Destination: %@", vc);
//}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:HunnyDooTableCellIdentifier];
    
    UIListContentConfiguration* content = cell.defaultContentConfiguration;
    content.image = [UIImage systemImageNamed:@"pin.circle"];
    content.imageProperties.tintColor = [UIColor purpleColor];
    
    content.text = [[self items] objectAtIndex:[indexPath row]];
    content.secondaryText = [[NSDate now] canonicalTimestamp];
    
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
    NSLog(@"## %@ - %@", NSStringFromSelector(_cmd), self);
    NSLog(@"##     tableView: %@", tableView);
    NSLog(@"##     indexPath: %@", indexPath);
    UIViewController* vc =
        [[self storyboard] instantiateViewControllerWithIdentifier:@"ItemDetailViewController"];
    
    //TODO: Setup the view.
    [self presentViewController:vc animated:YES completion:nil];
}

//- (void)showAddItemModal:

@end
