//
//  BaseVC.h
//  GokoTableView
//
//  Created by Goko on 2018/7/26.
//  Copyright © 2018 Goko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseVC : UIViewController

@property (nonatomic,strong) UIStepper * stepper;
@property (nonatomic,strong) NSMutableArray * dataSource;

-(void)addRow;
-(void)subRow;

@end
