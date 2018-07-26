//
//  DemoModel.h
//  GokoTableView
//
//  Created by Goko on 2018/7/23.
//  Copyright © 2018 Goko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DemoModel : NSObject
@property (nonatomic, strong) NSString * titleText;
@property (nonatomic, strong) UIColor * color;

+(NSMutableArray *)easyModels;
+(NSMutableArray *)normalModels;
+(instancetype)createEasyModelWithIndex:(NSInteger)index;

+(NSMutableArray *)homeModels;

@end
