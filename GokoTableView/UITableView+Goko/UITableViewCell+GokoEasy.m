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

- (UITableView *)goko_tableView{
    return GokoDynamicGetIvar(@selector(setGoko_tableView:));
}
- (void)setGoko_tableView:(UITableView *)tableView{
    GokoDynamicSetIvar(_cmd, tableView);
}
- (NSIndexPath *)goko_indexPath{
    return GokoDynamicGetIvar(@selector(setGoko_indexPath:))
}
- (void)setGoko_indexPath:(NSIndexPath *)indexPath{
    GokoDynamicSetIvar(_cmd, indexPath);
}

- (NSObject *)goko_bindingData{
    return GokoDynamicGetIvar(@selector(setGoko_bindingData:));
}
- (void)setGoko_bindingData:(NSObject *)bindingData{
    GokoDynamicSetIvar(_cmd, bindingData);
}

@end
