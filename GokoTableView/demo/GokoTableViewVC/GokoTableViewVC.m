//
//  GokoTableViewVC.m
//  GokoTableView
//
//  Created by Goko on 2018/7/26.
//  Copyright © 2018 Goko. All rights reserved.
//

#import "GokoTableViewVC.h"
#import "UITableView+Goko.h"
#import "DemoModel.h"

@interface GokoTableViewVC ()
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSMutableArray * dataArray;
@end

@implementation GokoTableViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stepper.value = self.dataArray.count;
    [self.view addSubview:self.tableView];
}
-(void)addRow{
    //there is no necessary to care about cell class
    //tableview不需要关心添加的row的cell的class，全都model来指定。可以动态随时加载不同类型的cell
    int i = (int)self.stepper.value-1;
    DemoModel * model = [DemoModel createEasyModelWithIndex:i];
    if (i<=self.dataSource.count) {
        [self.dataArray insertObject:model atIndex:i];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:i inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    }else{
        NSLog(@"error");
    }
}
-(void)subRow{
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:self.stepper.value inSection:0];
    NSAssert(self.stepper.value<self.dataArray.count, @"index error");
    [self.dataArray removeObjectAtIndex:self.stepper.value];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - Property Initial
-(NSMutableArray *)dataArray{
    if (nil == _dataArray) {
        _dataArray = [DemoModel easyModels];
    }
    return _dataArray;
}

-(NSMutableArray *)dataSource{
    return self.dataArray;
}
-(UITableView *)tableView{
    if (nil == _tableView) {
        //normal tableview init
        UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        //no necessray to add delegate&dataSource while import "UITableView+Goko.h"
        @weakify(self);
        @weakify(tableView);
        [tableView setGoko_numberOfRowsInSection:^NSInteger(NSInteger section) {
            return 1;
        }];
        [tableView setGoko_numberOfRowsInSection:^NSInteger(NSInteger section) {
            @strongify(self);
            return self.dataArray.count;
        }];
        [tableView setGoko_cellForRowAtIndexPath:^UITableViewCell *(NSIndexPath *indexPath) {
            @strongify(tableView);
            @strongify(self);
            DemoModel * model = self.dataArray[indexPath.row];
            NSString * cellReuseId = model.goko_cellReuseId;
            UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellReuseId];;
            if (nil == cell) {
                Class cellClass = model.goko_cellClass;
                cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseId];
            }
            return cell;
        }];
        [tableView setGoko_willDisplayCell:^(UITableViewCell *cell, NSIndexPath *indexPath) {
            @strongify(self);
            DemoModel * model = self.dataArray[indexPath.row];
            [cell setGoko_bindingData:model];
        }];
        [tableView setGoko_didSelectRowAtIndexPath:^(NSIndexPath *indexPath) {
            @strongify(tableView);
            @strongify(self);
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            DemoModel * model = self.dataArray[indexPath.row];
            if (model.goko_didselectCell) {
                model.goko_didselectCell([tableView cellForRowAtIndexPath:indexPath]);
            }
        }];
        [tableView setGoko_heightForRowAtIndexPath:^CGFloat(NSIndexPath *indexPath) {
            @strongify(self);
            DemoModel * model = self.dataArray[indexPath.row];
            return model.goko_rowHeight;
        }];

        
        _tableView = tableView;
    }
    return _tableView;
}

@end
