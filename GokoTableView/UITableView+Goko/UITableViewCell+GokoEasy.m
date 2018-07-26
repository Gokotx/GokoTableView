//
//  UITableViewCell+GokoEasy.m
//  GokoTableView
//
//  Created by Goko on 2018/7/26.
//  Copyright © 2018 Goko. All rights reserved.
//

#import "UITableViewCell+GokoEasy.h"
#import "GokoDefines.h"

@implementation UITableViewCell (GokoEasy)

- (UITableView *)tableView{
    return GokoDynamicGetIvar(@selector(setTableView:));
}
- (void)setTableView:(UITableView *)tableView{
    GokoDynamicSetIvar(_cmd, tableView);
}
- (NSIndexPath *)indexPath{
    return GokoDynamicGetIvar(@selector(setIndexPath:))
}
- (void)setIndexPath:(NSIndexPath *)indexPath{
    GokoDynamicSetIvar(_cmd, indexPath);
}

- (NSObject *)bindingData{
    return GokoDynamicGetIvar(@selector(setBindingData:));
}
- (void)setBindingData:(NSObject *)bindingData{
    GokoDynamicSetIvar(_cmd, bindingData);
}

@end
