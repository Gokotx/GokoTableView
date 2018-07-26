//
//  DemoModel.m
//  GokoTableView
//
//  Created by Goko on 2018/7/23.
//  Copyright © 2018 Goko. All rights reserved.
//

#import "DemoModel.h"
#import "UITableView+Goko.h"

@implementation DemoModel

+(NSMutableArray *)easyModels{
    NSMutableArray * temp = [NSMutableArray new];
    for (int i = 0; i<10; i++) {
        DemoModel * model = [DemoModel new];
        model.titleText = @(i).stringValue;
        model.color = [UIColor cyanColor];
        //model can bind different type of cell
        model.goko_cellClass = NSClassFromString(@"DemoCell");
        model.goko_rowHeight = 50;
        model.goko_didselectCell = ^(UITableViewCell *cell) {
            NSLog(@"%@",cell.goko_indexPath);
        };
        [temp addObject:model];
    }
    return temp;
}
+(NSMutableArray *)normalModels{
    NSMutableArray * temp = [NSMutableArray new];
    for (int i = 0; i<10; i++) {
        DemoModel * model = [DemoModel new];
        model.titleText = @(i).stringValue;
        model.color = [UIColor brownColor];
        [temp addObject:model];
    }
    return temp;
}
+(instancetype)createEasyModelWithIndex:(NSInteger)index{
    DemoModel * model = [DemoModel new];
    model.titleText = @(index).stringValue;
    model.color = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
    model.goko_cellClass = NSClassFromString(@"DemoCell");
    model.goko_rowHeight = 50*(index%2+1);
    model.goko_didselectCell = ^(UITableViewCell *cell) {
        cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
        NSLog(@"%@",cell.goko_indexPath);
    };
    return model;
}

+(NSMutableArray *)homeModels{
    NSMutableArray * temp = [NSMutableArray new];
    
    DemoModel * model = [DemoModel p_createModelWithTitle:@"GokoTableViewVC"];
    DemoModel * model1 = [DemoModel p_createModelWithTitle:@"GokoEasyTableViewVC"];
    DemoModel * model2 = [DemoModel p_createModelWithTitle:@"NormalTableViewVC"];
    
    [temp addObject:model];
    [temp addObject:model1];
    [temp addObject:model2];
    
    return temp;
}
+(instancetype)p_createModelWithTitle:(NSString *)title{
    DemoModel * model = [DemoModel new];
    model.titleText = title;
    model.color = [UIColor whiteColor];
    model.goko_cellClass = NSClassFromString(@"DemoCell");
    model.goko_rowHeight = 50;
    model.goko_didselectCell = ^(UITableViewCell *cell) {
        NSLog(@"%@",cell.textLabel.text);
        UINavigationController * naviVC = (UINavigationController *)[UIApplication sharedApplication].delegate.window.rootViewController;
        UIViewController * vc = [NSClassFromString(cell.textLabel.text) new];
        [naviVC pushViewController:vc animated:YES];
    };
    return model;
}
@end
