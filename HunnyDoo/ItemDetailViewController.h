//
//  ItemDetailViewController.h
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
    

#import <UIKit/UIKit.h>

@protocol HunnyDooItemDelegate <NSObject>
- (void)itemDidUpdateWithDetails:(id)itemDetails;
- (void)itemDidDelete:(id)itemDetails;
@end


@interface ItemDetailViewController : UITableViewController
@property (nonatomic, assign, getter=isNewItem) BOOL newItem;
@property (nonatomic, weak) id<HunnyDooItemDelegate> delegate;
@property (nonatomic, assign) NSUInteger index; 
@end
