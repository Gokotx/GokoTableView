//
//  NSObject+GokoEasyCellModel.m
//  GokoTableView
//
//  Created by Goko on 2018/7/26.
//  Copyright © 2018 Goko. All rights reserved.
//

#import "NSObject+GokoEasyCellModel.h"

@implementation NSObject (GokoEasyCellModel)

- (CGFloat)goko_rowHeight{
    NSNumber * cellRowHeight = (NSNumber *)GokoDynamicGetIvar(@selector(setGoko_rowHeight:));
    if (!cellRowHeight) {
        cellRowHeight = @44;
    }
    return cellRowHeight.floatValue;
}
- (void)setGoko_rowHeight:(CGFloat)cellRowHeight{
    GokoDynamicSetIvar(_cmd, @(cellRowHeight));
}


- (Class)goko_cellClass{
    //直接用class 会有warning，有点烦，所以就用string了。
    NSString * bindingCellClass = GokoDynamicGetIvar(@selector(setGoko_cellClass:));
    if (!bindingCellClass) {
        return UITableViewCell.class;
    }
    return NSClassFromString(bindingCellClass);
}
- (void)setGoko_cellClass:(Class)bindingCellClass{
    GokoDynamicSetIvar(_cmd, NSStringFromClass(bindingCellClass));
}


- (NSString *)goko_cellReuseId{
    NSString * cellReuseId = GokoDynamicGetIvar(@selector(setGoko_cellReuseId:));
    if (!cellReuseId) {
        cellReuseId = NSStringFromClass(self.goko_cellClass);
    }
    return cellReuseId;
}
- (void)setGoko_cellReuseId:(NSString *)cellReuseId{
    GokoDynamicSetIvar(_cmd, cellReuseId);
}

- (void (^)(UITableViewCell *))goko_didselectCell{
    return GokoDynamicGetIvar(@selector(setGoko_didselectCell:));
}
- (void)setGoko_didselectCell:(void (^)(UITableViewCell *))didselectBlock{
    GokoDynamicSetIvar(_cmd, didselectBlock);
}

@end
