//
//  NSObject+GokoEasyCellModel.h
//  GokoTableView
//
//  Created by Goko on 2018/7/26.
//  Copyright © 2018 Goko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GokoDefines.h"

@interface NSObject (GokoEasyCellModel)

@property (nonatomic, assign)               CGFloat goko_rowHeight;
@property (nonatomic, unsafe_unretained)    Class goko_cellClass;
@property (nonatomic, copy)                 NSString * goko_cellReuseId;
@property (nonatomic, copy)                 GokoEasyBlock1(void, goko_didselectCell, UITableViewCell *, cell);

@end
