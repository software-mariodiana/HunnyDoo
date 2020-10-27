//
//  ViewController.m
//  HunnyDoo
//
//  Created by Mario Diana on 10/27/20.
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
