# GokoTableView
Easy way to use tableview
## How To Get Started
- [Download GokoTableViewDemo](https://github.com/Gokotx/GokoTableView/archive/master.zip) and try out the included example demo

## Installation
## From CocoaPods
- [CocoaPods](https://cocoapods.org/) is a dependency manager for Objective-C , which automates and simplifies the process of using 3rd-party libraries like [GokoTableView](https://github.com/Gokotx/GokoTableView) in your projects . First , add the following line to your [Podfile](http://guides.cocoapods.org/using/using-cocoapods.html):
```
pod 'GokoTableView'
```
- If you want to use the latest features of [GokoTableView](https://github.com/Gokotx/GokoTableView) use normal external source dependencies .
```
pod 'GokoTableView', :git => 'https://github.com/Gokotx/GokoTableView.git'
```
This pulls from the master branch directly .
- Then,  install GokoTableView into your project :
```
pod install
```
## Carthage
- Not support now . coming soon
## Manually
- Just drag the `UITableView+Goko` folder into your project .
## Usage
- First 
```
#import <GokoTableView.h>
```
- All UITableViewDelegate & UITableViewDataSource Method are supporting implement with Block now. Looks like below (`Attention: delegate&datasource are auto binding to TableView itself, do not binding to some ViewController again`)
```
...
[tableView setGoko_numberOfSectionsInTableView:^NSInteger{
    return 1;
}]
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
...
```
- Also you can initial tableview with below method for convince usage (see demo for more)
```

/**
Initial TableView

@param frame :TableView Frame
@param tableViewstyle style
@param separatorStyle style
@return TableView
*/
+ (instancetype)gokoTableViewWithFrame:(CGRect)frame
                        tableViewStyle:(UITableViewStyle)tableViewstyle
                        separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle;
```
- If you initial a TableView with above method, now you can easily insert  or delete rows with
```
/**
Insert Rows without attention to dataSource

@param rowDatas : Rows bingding data
@param indexPaths : indexPath
@param rowAnimation : add animation
*/
- (void)gokoInsertRows:(NSArray<NSObject *> *)rowDatas
          atIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
      withRowAnimation:(UITableViewRowAnimation)rowAnimation;


/**
Delete Rows without attention to dataSource

@param indexPaths : indexPath
@param animation : delete animation
*/
- (void)gokoDeleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
                  withRowAnimation:(UITableViewRowAnimation)animation;
```
## License
`GokoTableView` is released under the MIT license. See LICENSE for details.
