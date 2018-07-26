//
//  UITableViewCell+GokoEasy.h
//  GokoTableView
//
//  Created by Goko on 2018/7/26.
//  Copyright © 2018 Goko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (GokoEasy)

@property (nonatomic, strong) NSIndexPath * goko_indexPath;
@property (nonatomic, strong) UITableView * goko_tableView;
@property (nonatomic, strong) NSObject * goko_bindingData;

@end
