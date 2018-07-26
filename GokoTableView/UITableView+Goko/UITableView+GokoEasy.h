//
//  UITableView+GokoEasy.h
//  GokoTableView
//
//  Created by Goko on 2018/7/25.
//  Copyright © 2018 Goko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+Goko.h"

@interface UITableView (GokoEasy)
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
