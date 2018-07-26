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

@property (nonatomic, assign)               CGFloat cellRowHeight;
@property (nonatomic, unsafe_unretained)    Class bindingCellClass;
@property (nonatomic, copy)                 NSString * cellReuseId;
@property (nonatomic, copy)                 GokoEasyBlock1(void, didselectCellBlock, UITableViewCell *, cell);

@end
