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

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:HunnyDooTableCellIdentifier];
    cell.textLabel.text = [[self items] objectAtIndex:[indexPath row]];
    
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

@end
