//
//  DemoCell.m
//  GokoTableView
//
//  Created by Goko on 2018/7/23.
//  Copyright © 2018 Goko. All rights reserved.
//

#import "DemoCell.h"
#import "DemoModel.h"
#import "UITableView+Goko.h"
@interface DemoCell()
@end

@implementation DemoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setBindingData:(NSObject *)bindingData{
    DemoModel * model = (DemoModel *)self.bindingData;
    self.textLabel.text = model.titleText;
    self.contentView.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];;
    self.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
