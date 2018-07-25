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
        cell.bindingData = [tableView p_gokoCurrentSectionRowsArray:indexPath.section][indexPath.row];
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













#pragma mark - ================================
#pragma mark - UITableViewCell+Goko

@implementation UITableViewCell (Goko)
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



#pragma mark - ================================
#pragma mark - NSObject+GokoCellModel
@implementation NSObject (GokoCellModel)

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
