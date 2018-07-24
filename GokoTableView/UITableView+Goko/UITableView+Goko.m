//
//  UITableView+Goko.m
//  GokoTableView
//
//  Created by Goko on 2018/7/23.
//  Copyright © 2018 Goko. All rights reserved.
//

#import "UITableView+Goko.h"

@implementation UITableView (Goko)

#pragma mark UITableView Public Methods

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
    
    tableView.delegate = (id<UITableViewDelegate>)tableView;
    tableView.dataSource = (id<UITableViewDataSource>)tableView;
    if (@available(iOS 11.0, *)) {
        tableView.dragDelegate = (id<UITableViewDragDelegate>)tableView;
        tableView.dropDelegate = (id<UITableViewDropDelegate>)tableView;
    }
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
    //多section 逻辑待处理
    return self.rowDataArray;
}


#pragma mark - UITableViewDataSource Protocol
- (NSInteger)numberOfSections{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tableView p_gokoCurrentSectionRowsArray:section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSObject * cellBindingData = tableView.rowDataArray[indexPath.row];
    NSString * cellReuseId = cellBindingData.cellReuseId;
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellReuseId];;
    if (nil == cell) {
        Class cellClass = cellBindingData.bindingCellClass;
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseId];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.bindingData = [tableView p_gokoCurrentSectionRowsArray:indexPath.section][indexPath.row];
    cell.tableView = tableView;
    cell.indexPath = indexPath;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSObject * cellData = [tableView p_gokoCurrentSectionRowsArray:indexPath.section][indexPath.row];
    return cellData.cellRowHeight;
}

#pragma mark - UITableViewDelegate Protocol
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSObject * cellData = [tableView p_gokoCurrentSectionRowsArray:indexPath.section][indexPath.row];
    if (cellData.didselectBlock) {
        cellData.didselectBlock([tableView cellForRowAtIndexPath:indexPath]);
    }
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

- (GokoDidSelectCellBlock)didselectBlock{
    return GokoDynamicGetIvar(@selector(setDidselectBlock:));
}
- (void)setDidselectBlock:(GokoDidSelectCellBlock)didselectBlock{
    GokoDynamicSetIvar(_cmd, didselectBlock);
}

@end
