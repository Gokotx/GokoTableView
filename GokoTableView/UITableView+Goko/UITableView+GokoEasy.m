//
//  UITableView+GokoEasy.m
//  GokoTableView
//
//  Created by Goko on 2018/7/25.
//  Copyright © 2018 Goko. All rights reserved.
//

#import "UITableView+GokoEasy.h"

@implementation UITableView (GokoEasy)

- (void)setRowDataArray:(NSMutableArray<NSObject *> *)rowDataArray{
    GokoDynamicSetIvar(_cmd, rowDataArray);
}
- (NSMutableArray *)rowDataArray{
    return GokoDynamicGetIvar(@selector(setRowDataArray:));
}

+ (instancetype)gokoTableViewWithFrame:(CGRect)frame
                        tableViewStyle:(UITableViewStyle)tableViewStyle
                        separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle{
    UITableView * tableView = [[UITableView alloc] initWithFrame:frame style:tableViewStyle];
    tableView.separatorStyle = separatorStyle;
    tableView.tableFooterView = [UIView new];
    
    @weakify(tableView);
    [tableView setGoko_numberOfSectionsInTableView:^NSInteger{
        return 1;
    }];
    [tableView setGoko_numberOfRowsInSection:^NSInteger(NSInteger section) {
        @strongify(tableView);
        return [tableView p_gokoCurrentSectionRowsArray:section].count;
    }];
    [tableView setGoko_cellForRowAtIndexPath:^UITableViewCell *(NSIndexPath *indexPath) {
        @strongify(tableView);
        NSObject * cellBindingData = [tableView p_gokoCurrentSectionRowsArray:indexPath.section][indexPath.row];
        NSString * cellReuseId = cellBindingData.cellReuseId;
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellReuseId];;
        if (nil == cell) {
            Class cellClass = cellBindingData.bindingCellClass;
            cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseId];
        }
        return cell;
    }];
    [tableView setGoko_willDisplayCell:^(UITableViewCell *cell, NSIndexPath *indexPath) {
        @strongify(tableView);
        NSObject * cellData = [tableView p_gokoCurrentSectionRowsArray:indexPath.section][indexPath.row];
        cell.bindingData = cellData;
        cell.tableView = tableView;
        cell.indexPath = indexPath;
    }];
    [tableView setGoko_heightForRowAtIndexPath:^CGFloat(NSIndexPath *indexPath) {
        @strongify(tableView);
        NSObject * cellData = [tableView p_gokoCurrentSectionRowsArray:indexPath.section][indexPath.row];
        return cellData.cellRowHeight;
    }];
    [tableView setGoko_didSelectRowAtIndexPath:^(NSIndexPath *indexPath) {
        @strongify(tableView);
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        NSObject * cellData = [tableView p_gokoCurrentSectionRowsArray:indexPath.section][indexPath.row];
        if (cellData.didselectBlock) {
            cellData.didselectBlock([tableView cellForRowAtIndexPath:indexPath]);
        }
    }];
    return tableView;
}

- (void)gokoInsertRows:(NSArray<NSObject *> *)rowDatas
          atIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
      withRowAnimation:(UITableViewRowAnimation)rowAnimation{
    NSAssert(rowDatas.count == indexPaths.count, @"index match error");
    [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSAssert(obj.row <= self.rowDataArray.count, @"index error");
        [self.rowDataArray insertObject:rowDatas[idx] atIndex:obj.row];
    }];
    [self insertRowsAtIndexPaths:indexPaths withRowAnimation:rowAnimation];
}

- (void)gokoDeleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSAssert(obj.row<self.rowDataArray.count, @"index error");
        [self.rowDataArray removeObjectAtIndex:obj.row];
    }];
    [self deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}


#pragma mark - UITableView Private Methods
- (NSArray *)p_gokoCurrentSectionRowsArray:(NSInteger)section{
//duo sections is comming soon
    return self.rowDataArray;
}

@end

