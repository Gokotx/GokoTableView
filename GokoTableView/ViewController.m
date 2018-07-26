//
//  ViewController.m
//  GokoTableView
//
//  Created by Goko on 2018/7/23.
//  Copyright © 2018 Goko. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+GokoEasy.h"
#import "DemoModel.h"

@interface ViewController ()
@property (nonatomic,strong) UITableView * tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UITableView+Goko";
    
    [self.view addSubview:self.tableView];
}

#pragma mark - UI Config

-(UITableView *)tableView{
    if (_tableView == nil) {
        UITableView * tableView = [UITableView gokoTableViewWithFrame:self.view.bounds tableViewStyle:UITableViewStylePlain separatorStyle:UITableViewCellSeparatorStyleSingleLine];
        tableView.rowDataArray = [DemoModel homeModels];
        _tableView = tableView;
    }
    return _tableView;
}



@end
