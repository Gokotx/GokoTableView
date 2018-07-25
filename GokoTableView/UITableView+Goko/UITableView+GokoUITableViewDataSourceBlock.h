//
//  UITableView+GokoUITableViewDataSourceBlock.h
//  GokoTableView
//
//  Created by Goko on 2018/7/25.
//  Copyright © 2018 Goko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GokoDefines.h"

@interface UITableView (GokoUITableViewDataSourceBlock)

@property (nonatomic, copy) GokoEasyBlock1(NSInteger, goko_numberOfRowsInSection, NSInteger, section);
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

@property (nonatomic, copy) GokoEasyBlock1(UITableViewCell *, goko_cellForRowAtIndexPath, NSIndexPath *, indexPath);


@property (nonatomic, copy) GokoEasyBlock(NSInteger, goko_numberOfSectionsInTableView); // Default is 1 if not implemented
@property (nonatomic, copy) GokoEasyBlock1(NSString *, goko_titleForHeaderInSection, NSInteger, section);// fixed font style. use custom view (UILabel) if you want something different
@property (nonatomic, copy) GokoEasyBlock1(NSString *, goko_titleForFooterInSection, NSInteger, section);
// Editing

// Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
@property (nonatomic, copy) GokoEasyBlock1(BOOL, goko_canEditRowAtIndexPath, NSIndexPath *, indexPath);
// Moving/reordering

// Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
@property (nonatomic, copy) GokoEasyBlock1(BOOL, goko_canMoveRowAtIndexPath, NSIndexPath *, indexPath);
// Index

// return list of section titles to display in section index view (e.g. "ABCD...Z#")
@property (nonatomic, copy) GokoEasyBlock(NSArray<NSString *> *, goko_sectionIndexTitlesForTableView);



 // tell table which section corresponds to section title/index (e.g. "B",1))
@property (nonatomic, copy) GokoEasyBlock2(NSInteger, goko_sectionForSectionIndexTitle_atIndex, NSString *, title, NSInteger, index);

// Data manipulation - insert and delete support

// After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
// Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
@property (nonatomic, copy) GokoEasyBlock2(void, goko_commitEditingStyle_forRowAtIndexPath, UITableViewCellEditingStyle, editingStyle, NSIndexPath *, indexPath);

// Data manipulation - reorder / moving support
@property (nonatomic, copy) GokoEasyBlock2(void, goko_moveRowAtIndexPath_toIndexPath, NSIndexPath *, sourceIndexPath, NSIndexPath *, destinationIndexPath);



@end
