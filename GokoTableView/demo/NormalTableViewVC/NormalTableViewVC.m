//
//  NormalTableViewVC.m
//  GokoTableView
//
//  Created by Goko on 2018/7/26.
//  Copyright © 2018 Goko. All rights reserved.
//

#import "NormalTableViewVC.h"
#import "DemoModel.h"
#import "DemoCell.h"

@interface NormalTableViewVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSMutableArray * dataArray;
@end

@implementation NormalTableViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.stepper.value = self.dataSource.count;
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


#pragma mark - TableView Protocol
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //如果是多种cell ，这里还需要做不同的判断
    //if duo class cells in need, it should be have some if else...
    DemoCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(DemoCell.class)];
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    DemoCell * currentCell = (DemoCell *)cell;
    [currentCell setGoko_bindingData:self.dataArray[indexPath.row]];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DemoCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@",cell.textLabel.text);
}

#pragma mark - Property Initial
-(UITableView *)tableView{
    if (nil == _tableView) {
        UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [tableView registerClass:[DemoCell class] forCellReuseIdentifier:NSStringFromClass(DemoCell.class)];
        tableView.delegate = self;
        tableView.dataSource = self;
        _tableView = tableView;
    }
    return _tableView;
}

-(NSMutableArray *)dataArray{
    if (nil == _dataArray) {
        //generate data
        _dataArray = [DemoModel normalModels];
    }
    return _dataArray;
}
-(NSMutableArray *)dataSource{
    return [self dataArray];
}



@end
