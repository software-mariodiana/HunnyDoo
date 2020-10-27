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

@interface ViewController () <UITableViewDataSource>
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"To do";
    self.navigationItem.rightBarButtonItem =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                      target:nil
                                                      action:nil];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //TODO: NOT IMPLEMENTED
    NSLog(@"## %@ - %@", NSStringFromSelector(_cmd), self);
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    //TODO: NOT IMPLEMENTED
    NSLog(@"## %@ - %@", NSStringFromSelector(_cmd), self);
    return 0;
}

@end
