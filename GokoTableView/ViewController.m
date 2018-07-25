//
//  ViewController.m
//  GokoTableView
//
//  Created by Goko on 2018/7/23.
//  Copyright © 2018 Goko. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+GokoEasy.h"
#import "DemoCell.h"
#import "DemoModel.h"

@interface ViewController ()
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) UIStepper * stepper;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowDataArray = [self tempArray];
    [self.view addSubview:self.tableView];
    
    self.stepper.value = self.tableView.rowDataArray.count;

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.stepper];
    self.title = @"UITableView+Goko";
}
-(NSMutableArray *)tempArray{
    NSMutableArray * temp = [NSMutableArray new];
    for (int i = 0; i<2; i++) {
        DemoModel * model = [DemoModel new];
        model.bindingCellClass = DemoCell.class;
        model.cellRowHeight = 50;
        model.titleText = @(i).stringValue;
        model.color = [UIColor redColor];
        model.didselectBlock = ^(UITableViewCell *cell) {
            NSLog(@"%@",cell.indexPath);
        };
        [temp addObject:model];
    }
    return temp;
}
-(void)stepperHandler{
    if (_stepper.value>=self.tableView.rowDataArray.count) {
        [self addRow];
    }else{
        [self subRow];
    }
    
}
-(void)addRow{
    DemoModel * model = [DemoModel new];
    model.bindingCellClass = DemoCell.class;
    int i = (int)self.stepper.value-1;
    model.cellRowHeight = 50*(i%2+1);
    model.titleText = @(i).stringValue;
    //cell中的具体控件的点击，在cell中自行处理。
    //这里处理整个cell的点击
    model.didselectBlock = ^(UITableViewCell *cell) {
        cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
        NSLog(@"%@",cell.indexPath);
    };
    [self.tableView gokoInsertRows:@[model] atIndexPaths:@[[NSIndexPath indexPathForRow:i inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
}
-(void)subRow{
    [self.tableView gokoDeleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.stepper.value inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - UI Config

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [UITableView gokoTableViewWithFrame:self.view.bounds tableViewStyle:UITableViewStylePlain separatorStyle:UITableViewCellSeparatorStyleSingleLine];
    }
    return _tableView;
}
-(UIStepper *)stepper{
    if (_stepper == nil) {
        _stepper = [[UIStepper alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        _stepper.minimumValue = 1;
        _stepper.maximumValue = 100;
        [_stepper addTarget:self action:@selector(stepperHandler) forControlEvents:UIControlEventValueChanged];
    }
    return _stepper;
}



@end
