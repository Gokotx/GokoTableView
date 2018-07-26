//
//  BaseVC.m
//  GokoTableView
//
//  Created by Goko on 2018/7/26.
//  Copyright © 2018 Goko. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass(self.class);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.stepper];
}

#pragma mark - Private Methods
-(void)stepperHandler{
    if (self.stepper.value>=self.dataSource.count) {
        [self addRow];
    }else{
        [self subRow];
    }
}
-(void)addRow{
    // subclass override it
}
-(void)subRow{
    // subclass override it
}

#pragma mark - Property Initial
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
