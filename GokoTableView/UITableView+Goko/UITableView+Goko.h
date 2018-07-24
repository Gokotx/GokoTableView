//
//  UITableView+Goko.h
//  GokoTableView
//
//  Created by Goko on 2018/7/23.
//  Copyright © 2018 Goko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#pragma mark - Define Methods
/**
 Dynmic add ivar with given name ,hold by self.
 @return (id)added ivar
 */
#define \
GokoDynamicGetIvar(selector) ({\
    id dynamicIvar = objc_getAssociatedObject(self, selector);\
    dynamicIvar;\
});

/**
 set ivar value with key
 
 @param selector : selector
 @param value: must be an object
 @return void
 */
#define \
GokoDynamicSetIvar(selector,value) ({\
    id dynamicIvar = objc_getAssociatedObject(self, selector);\
    dynamicIvar = value;\
    objc_setAssociatedObject(self, selector, dynamicIvar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
});



#pragma mark - ================================
#pragma mark - UITableView+Goko

@interface UITableView (Goko)
/**
 1.For single section
 */
@property (nonatomic, strong) NSMutableArray <NSObject *>* rowDataArray;


/**
 Initial TableView

 @param frame :TableView Frame
 @param tableViewstyle style
 @param separatorStyle style
 @return TableView
 */
+ (instancetype)gokoTableViewWithFrame:(CGRect)frame
                        tableViewStyle:(UITableViewStyle)tableViewstyle
                        separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle;


/**
 Insert Rows without attention to dataSource

 @param rowDatas : Rows bingding data
 @param indexPaths : indexPath
 @param rowAnimation : add animation
 */
- (void)gokoInsertRows:(NSArray<NSObject *> *)rowDatas
          atIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
      withRowAnimation:(UITableViewRowAnimation)rowAnimation;



/**
 Delete Rows without attention to dataSource

 @param indexPaths : indexPath
 @param animation : delete animation
 */
- (void)gokoDeleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
                  withRowAnimation:(UITableViewRowAnimation)animation;

@end










































#pragma mark - ================================
#pragma mark - UITableViewCell+Goko

@interface UITableViewCell (Goko)

@property (nonatomic, strong) NSIndexPath * indexPath;
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSObject * bindingData;

@end


#pragma mark - ================================
#pragma mark - NSObject+GokoCellModel

typedef void(^GokoDidSelectCellBlock)(UITableViewCell * cell);

@interface NSObject (GokoCellModel)

@property (nonatomic, assign) CGFloat cellRowHeight;
@property (nonatomic, unsafe_unretained) Class bindingCellClass;
@property (nonatomic, copy) NSString * cellReuseId;
@property (nonatomic, copy) GokoDidSelectCellBlock didselectBlock;

@end
