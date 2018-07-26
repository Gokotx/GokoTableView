//
//  NSObject+GokoEasyCellModel.m
//  GokoTableView
//
//  Created by Goko on 2018/7/26.
//  Copyright © 2018 Goko. All rights reserved.
//

#import "NSObject+GokoEasyCellModel.h"

@implementation NSObject (GokoEasyCellModel)

- (CGFloat)cellRowHeight{
    NSNumber * cellRowHeight = (NSNumber *)GokoDynamicGetIvar(@selector(setCellRowHeight:));
    if (!cellRowHeight) {
        cellRowHeight = @44;
    }
    return cellRowHeight.floatValue;
}
- (void)setCellRowHeight:(CGFloat)cellRowHeight{
    GokoDynamicSetIvar(_cmd, @(cellRowHeight));
}


- (Class)bindingCellClass{
    //直接用class 会有warning，有点烦，所以就用string了。
    NSString * bindingCellClass = GokoDynamicGetIvar(@selector(setBindingCellClass:));
    if (!bindingCellClass) {
        return UITableViewCell.class;
    }
    return NSClassFromString(bindingCellClass);
}
- (void)setBindingCellClass:(Class)bindingCellClass{
    GokoDynamicSetIvar(_cmd, NSStringFromClass(bindingCellClass));
}


- (NSString *)cellReuseId{
    NSString * cellReuseId = GokoDynamicGetIvar(@selector(setCellReuseId:));
    if (!cellReuseId) {
        cellReuseId = NSStringFromClass(self.bindingCellClass);
    }
    return cellReuseId;
}
- (void)setCellReuseId:(NSString *)cellReuseId{
    GokoDynamicSetIvar(_cmd, cellReuseId);
}

- (void (^)(UITableViewCell *))didselectBlock{
    return GokoDynamicGetIvar(@selector(setDidselectBlock:));
}
- (void)setDidselectBlock:(void (^)(UITableViewCell *))didselectBlock{
    GokoDynamicSetIvar(_cmd, didselectBlock);
}

@end
