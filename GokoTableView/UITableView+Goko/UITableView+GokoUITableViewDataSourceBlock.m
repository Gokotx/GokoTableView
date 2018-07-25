//
//  UITableView+GokoUITableViewDataSourceBlock.m
//  GokoTableView
//
//  Created by Goko on 2018/7/25.
//  Copyright © 2018 Goko. All rights reserved.
//

#import "UITableView+GokoUITableViewDataSourceBlock.h"

@implementation UITableView (GokoUITableViewDataSourceBlock)

#pragma mark UITableView Public Methods

-(void)setGoko_numberOfRowsInSection:(NSInteger (^)(NSInteger))goko_numberOfRowsInSection{
    GokoDynamicSetIvar(_cmd, goko_numberOfRowsInSection);
}
-(NSInteger (^)(NSInteger))goko_numberOfRowsInSection{
    return GokoDynamicGetIvar(@selector(setGoko_numberOfRowsInSection:));
}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

-(void)setGoko_cellForRowAtIndexPath:(UITableViewCell *(^)(NSIndexPath *))goko_cellForRowAtIndexPath{
    GokoDynamicSetIvar(_cmd, goko_cellForRowAtIndexPath);
}
-(UITableViewCell *(^)(NSIndexPath *))goko_cellForRowAtIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_cellForRowAtIndexPath:));
}
-(void)setGoko_numberOfSectionsInTableView:(NSInteger (^)(void))goko_numberOfSectionsInTableView{
    GokoDynamicSetIvar(_cmd, goko_numberOfSectionsInTableView);
}
-(NSInteger (^)(void))goko_numberOfSectionsInTableView{
    return GokoDynamicGetIvar(@selector(setGoko_numberOfSectionsInTableView:));
}
-(void)setGoko_titleForHeaderInSection:(NSString *(^)(NSInteger))goko_titleForHeaderInSection{
    GokoDynamicSetIvar(_cmd, goko_titleForHeaderInSection);
}
-(NSString *(^)(NSInteger))goko_titleForHeaderInSection{
    return GokoDynamicGetIvar(@selector(setGoko_titleForHeaderInSection:));
}
-(void)setGoko_titleForFooterInSection:(NSString *(^)(NSInteger))goko_titleForFooterInSection{
    GokoDynamicSetIvar(_cmd, goko_titleForFooterInSection);
}
-(NSString *(^)(NSInteger))goko_titleForFooterInSection{
    return GokoDynamicGetIvar(@selector(setGoko_titleForFooterInSection:));
}

// Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
-(void)setGoko_canEditRowAtIndexPath:(BOOL (^)(NSIndexPath *))goko_canEditRowAtIndexPath{
    GokoDynamicSetIvar(_cmd, goko_canEditRowAtIndexPath);
}
-(BOOL (^)(NSIndexPath *))goko_canEditRowAtIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_canEditRowAtIndexPath:));
}
-(void)setGoko_canMoveRowAtIndexPath:(BOOL (^)(NSIndexPath *))goko_canMoveRowAtIndexPath{
    GokoDynamicSetIvar(_cmd, goko_canMoveRowAtIndexPath);
}
-(BOOL (^)(NSIndexPath *))goko_canMoveRowAtIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_canMoveRowAtIndexPath:));
}
-(void)setGoko_sectionIndexTitlesForTableView:(NSArray<NSString *> *(^)(void))goko_sectionIndexTitlesForTableView{
    GokoDynamicSetIvar(_cmd, goko_sectionIndexTitlesForTableView);
}
-(NSArray<NSString *> *(^)(void))goko_sectionIndexTitlesForTableView{
    return GokoDynamicGetIvar(@selector(setGoko_sectionIndexTitlesForTableView:));
}
-(void)setGoko_sectionForSectionIndexTitle_atIndex:(NSInteger (^)(NSString *, NSInteger))goko_sectionForSectionIndexTitle_atIndex{
    GokoDynamicSetIvar(_cmd, goko_sectionForSectionIndexTitle_atIndex);
}
-(NSInteger (^)(NSString *, NSInteger))goko_sectionForSectionIndexTitle_atIndex{
    return GokoDynamicGetIvar(@selector(setGoko_sectionForSectionIndexTitle_atIndex:));
}
-(void)setGoko_commitEditingStyle_forRowAtIndexPath:(void (^)(UITableViewCellEditingStyle, NSIndexPath *))goko_commitEditingStyle_forRowAtIndexPath{
    GokoDynamicSetIvar(_cmd, goko_commitEditingStyle_forRowAtIndexPath);
}
-(void (^)(UITableViewCellEditingStyle, NSIndexPath *))goko_commitEditingStyle_forRowAtIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_commitEditingStyle_forRowAtIndexPath:));
}
-(void)setGoko_moveRowAtIndexPath_toIndexPath:(void (^)(NSIndexPath *, NSIndexPath *))goko_moveRowAtIndexPath_toIndexPath{
    GokoDynamicSetIvar(_cmd, goko_moveRowAtIndexPath_toIndexPath);
}
-(void (^)(NSIndexPath *, NSIndexPath *))goko_moveRowAtIndexPath_toIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_moveRowAtIndexPath_toIndexPath:));
}




#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.goko_numberOfRowsInSection) {
       return self.goko_numberOfRowsInSection(section);
    }
    return 0;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.goko_cellForRowAtIndexPath) {
        return self.goko_cellForRowAtIndexPath(indexPath);
    }
    return [UITableViewCell new];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Default is 1 if not implemented
    if (self.goko_numberOfSectionsInTableView) {
        return self.goko_numberOfSectionsInTableView();
    }
    return 1;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    // fixed font style. use custom view (UILabel) if you want something different
    if (self.goko_titleForHeaderInSection) {
        return self.goko_titleForHeaderInSection(section);
    }
    return @"titleForHeaderInSection";
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (self.goko_titleForFooterInSection) {
        return self.goko_titleForFooterInSection(section);
    }
    return @"titleForHeaderInSection";
}
// Editing

// Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.goko_canEditRowAtIndexPath) {
        return self.goko_canEditRowAtIndexPath(indexPath);
    }
    return YES;
}

// Moving/reordering

// Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.goko_canMoveRowAtIndexPath) {
        return self.goko_canMoveRowAtIndexPath(indexPath);
    }
    if (self.goko_moveRowAtIndexPath_toIndexPath) {
        return YES;
    }
    return NO;
}

// Index

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    // return list of section titles to display in section index view (e.g. "ABCD...Z#")
    if (self.goko_sectionIndexTitlesForTableView) {
        return self.goko_sectionIndexTitlesForTableView();
    }
    return @[];
}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
   // tell table which section corresponds to section title/index (e.g. "B",1))
    if (self.goko_sectionForSectionIndexTitle_atIndex) {
        return self.goko_sectionForSectionIndexTitle_atIndex(title, index);
    }
    return 0;
}

// Data manipulation - insert and delete support

// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
// Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    GokoExecuteBlock2(self.goko_commitEditingStyle_forRowAtIndexPath, editingStyle, indexPath);
}

// Data manipulation - reorder / moving support

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    GokoExecuteBlock2(self.goko_moveRowAtIndexPath_toIndexPath, sourceIndexPath, destinationIndexPath);
}

@end
