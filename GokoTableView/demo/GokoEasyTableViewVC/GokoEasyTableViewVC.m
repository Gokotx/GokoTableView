//
//  GokoEasyTableViewVC.m
//  GokoTableView
//
//  Created by Goko on 2018/7/26.
//  Copyright © 2018 Goko. All rights reserved.
//

#import "GokoEasyTableViewVC.h"
#import "UITableView+Goko.h"
#import "DemoCell.h"
#import "DemoModel.h"

@interface GokoEasyTableViewVC ()
@property (nonatomic,strong) UITableView * tableView;

@end

@implementation GokoEasyTableViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowDataArray = [DemoModel easyModels];
    self.stepper.value = self.tableView.rowDataArray.count;
    [self.view addSubview:self.tableView];
}

-(void)addRow{
    //there is no necessary to care about cell class
    //tableview不需要关心添加的row的cell的class，全都model来指定。可以动态随时加载不同类型的cell
    int i = (int)self.stepper.value-1;
    DemoModel * model = [DemoModel createEasyModelWithIndex:i];
    [self.tableView gokoInsertRows:@[model] atIndexPaths:@[[NSIndexPath indexPathForRow:i inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
}
-(void)subRow{
    [self.tableView gokoDeleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.stepper.value inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - Property Initial

-(UITableView *)tableView{
    if (_tableView == nil) {
        //goko tableview init
        _tableView = [UITableView gokoTableViewWithFrame:self.view.bounds tableViewStyle:UITableViewStylePlain separatorStyle:UITableViewCellSeparatorStyleSingleLine];
    }
    return _tableView;
}
-(NSMutableArray *)dataSource{
    return self.tableView.rowDataArray;
}

@end
