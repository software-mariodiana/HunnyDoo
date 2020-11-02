//
//  ItemDetailViewController.m
//  HunnyDoo
//
//  Created by Mario Diana on 10/30/20.
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
    

#import "ItemDetailViewController.h"

@interface ItemDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *taskField;
@property (weak, nonatomic) IBOutlet UIDatePicker *dueDatePicker;
@end

@implementation ItemDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"## %@ - %@", NSStringFromSelector(_cmd), self);
    self.tableView.rowHeight = 44.0;
}

- (IBAction)cancel:(id)sender
{
    if ([self isNewItem]) {
        [[self delegate] itemDidDelete:[self itemDetails]];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)done:(id)sender
{
    [[self delegate] itemDidUpdateWithDetails:[self itemDetails]];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSDictionary *)itemDetails
{
    return @{
        @"text": [[self taskField] text],
        @"dueDate": [[self dueDatePicker] date],
        @"index": [NSNumber numberWithInteger:[self index]]
    };
}

@end
