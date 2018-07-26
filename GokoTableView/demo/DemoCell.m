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

// should be implemented for easy tableView
-(void)setGoko_bindingData:(NSObject *)bindingData{
    [super setGoko_bindingData:bindingData];
    DemoModel * model = (DemoModel *)bindingData;
    self.textLabel.text = model.titleText;
    self.contentView.backgroundColor = model.color;
    self.backgroundColor = model.color;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
