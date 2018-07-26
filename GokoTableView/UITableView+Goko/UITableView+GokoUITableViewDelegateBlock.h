//
//  UITableView+GokoUITableViewDelegateBlock.h
//  GokoTableView
//
//  Created by Goko on 2018/7/23.
//  Copyright © 2018 Goko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GokoDefines.h"


#pragma mark - ================================
#pragma mark - UITableView+GokoUITableViewDelegateBlock

@interface UITableView (GokoUITableViewDelegateBlock)

// Display customization
@property (nonatomic, copy) GokoEasyBlock2(void, goko_willDisplayCell, UITableViewCell *, cell, NSIndexPath *, indexPath);
@property (nonatomic, copy) GokoEasyBlock2(void, goko_willDisplayHeaderView, UIView *, view, NSInteger, section);
@property (nonatomic, copy) GokoEasyBlock2(void, goko_willDisplayFooterView, UIView *, view, NSInteger, section);
@property (nonatomic, copy) GokoEasyBlock2(void, goko_didEndDisplayingCell, UITableViewCell *, cell, NSIndexPath *, indexPath);
@property (nonatomic, copy) GokoEasyBlock2(void, goko_didEndDisplayingHeaderView, UIView *, view, NSInteger, section);
@property (nonatomic, copy) GokoEasyBlock2(void, goko_didEndDisplayingFooterView, UIView *, view, NSInteger, section);


// Variable height support

@property (nonatomic, copy) GokoEasyBlock1(CGFloat, goko_heightForRowAtIndexPath, NSIndexPath *, indexPath);
@property (nonatomic, copy) GokoEasyBlock1(CGFloat, goko_heightForHeaderInSection, NSInteger, section);
@property (nonatomic, copy) GokoEasyBlock1(CGFloat, goko_heightForFooterInSection, NSInteger, section);

// Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
// If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.
@property (nonatomic, copy) GokoEasyBlock1(CGFloat, goko_estimatedHeightForRowAtIndexPath, NSIndexPath *, indexPath);
@property (nonatomic, copy) GokoEasyBlock1(CGFloat, goko_estimatedHeightForHeaderInSection, NSInteger, section);
@property (nonatomic, copy) GokoEasyBlock1(CGFloat, goko_estimatedHeightForFooterInSection, NSInteger, section);

// Section header & footer information. Views are preferred over title should you decide to provide both

@property (nonatomic, copy) GokoEasyBlock1(UIView *, goko_viewForHeaderInSection, NSInteger, section);   // custom view for header. will be adjusted to default or specified header height
@property (nonatomic, copy) GokoEasyBlock1(UIView *, goko_viewForFooterInSection, NSInteger, section);   // custom view for footer. will be adjusted to default or specified footer height

// Selection

// -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row.
// Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
@property (nonatomic, copy) GokoEasyBlock1(BOOL, goko_shouldHighlightRowAtIndexPath, NSIndexPath *, indexPath);
@property (nonatomic, copy) GokoEasyBlock1(BOOL, goko_didHighlightRowAtIndexPath, NSIndexPath *, indexPath);
@property (nonatomic, copy) GokoEasyBlock1(BOOL, goko_didUnhighlightRowAtIndexPath, NSIndexPath *, indexPath);

// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
@property (nonatomic, copy) GokoEasyBlock1(NSIndexPath *, goko_willSelectRowAtIndexPath, NSIndexPath *, indexPath);
@property (nonatomic, copy) GokoEasyBlock1(NSIndexPath *, goko_willDeselectRowAtIndexPath, NSIndexPath *, indexPath);
// Called after the user changes the selection.
@property (nonatomic, copy) GokoEasyBlock1(void, goko_didSelectRowAtIndexPath, NSIndexPath *, indexPath);
@property (nonatomic, copy) GokoEasyBlock1(void, goko_didDeselectRowAtIndexPath, NSIndexPath *, indexPath);

// Editing

// Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
@property (nonatomic, copy) GokoEasyBlock1(UITableViewCellEditingStyle, goko_editingStyleForRowAtIndexPath, NSIndexPath *, indexPath);
@property (nonatomic, copy) GokoEasyBlock1(NSString *, goko_titleForDeleteConfirmationButtonForRowAtIndexPath, NSIndexPath *, indexPath);

// Use -tableView:trailingSwipeActionsConfigurationForRowAtIndexPath: instead of this method, which will be deprecated in a future release.
// This method supersedes -tableView:titleForDeleteConfirmationButtonForRowAtIndexPath: if return value is non-nil
@property (nonatomic, copy) GokoEasyBlock1(NSArray<UITableViewRowAction *> *, goko_editActionsForRowAtIndexPath, NSIndexPath *, indexPath);

// Swipe actions
// These methods supersede -editActionsForRowAtIndexPath: if implemented
// return nil to get the default swipe actions
@property (nonatomic, copy) GokoEasyBlock1(UISwipeActionsConfiguration *, goko_leadingSwipeActionsConfigurationForRowAtIndexPath, NSIndexPath *, indexPath);
@property (nonatomic, copy) GokoEasyBlock1(UISwipeActionsConfiguration *, goko_trailingSwipeActionsConfigurationForRowAtIndexPath, NSIndexPath *, indexPath);

// Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
@property (nonatomic, copy) GokoEasyBlock1(BOOL, goko_shouldIndentWhileEditingRowAtIndexPath, NSIndexPath *, indexPath);

// The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
@property (nonatomic, copy) GokoEasyBlock1(void, goko_willBeginEditingRowAtIndexPath, NSIndexPath *, indexPath);
@property (nonatomic, copy) GokoEasyBlock1(void, goko_didEndEditingRowAtIndexPath, NSIndexPath *, indexPath);

// Moving/reordering

// Allows customization of the target row for a particular row as it is being moved/reordered
@property (nonatomic, copy) GokoEasyBlock2(NSIndexPath *, goko_targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPath, NSIndexPath *, sourceIndexPath, NSIndexPath *, proposedDestinationIndexPath);

// Indentation

@property (nonatomic, copy) GokoEasyBlock1(NSInteger, goko_indentationLevelForRowAtIndexPath, NSIndexPath *, indexPath);// return 'depth' of row for hierarchies

// Copy/Paste.  All three methods must be implemented by the delegate.

@property (nonatomic, copy) GokoEasyBlock1(BOOL, goko_shouldShowMenuForRowAtIndexPath, NSIndexPath *, indexPath);
@property (nonatomic, copy) GokoEasyBlock3(BOOL, goko_canPerformAction_forRowAtIndexPath_withSender, SEL, action, NSIndexPath *, indexPath, id, sender);
@property (nonatomic, copy) GokoEasyBlock3(void, goko_performAction_forRowAtIndexPath_withSender, SEL, action, NSIndexPath *, indexPath, id, sender);

// Focus

@property (nonatomic, copy) GokoEasyBlock1(BOOL, goko_canFocusRowAtIndexPath, NSIndexPath *, indexPath);
@property (nonatomic, copy) GokoEasyBlock1(BOOL, goko_shouldUpdateFocusInContext, UITableViewFocusUpdateContext *, context);
@property (nonatomic, copy) GokoEasyBlock2(void, goko_didUpdateFocusInContext_withAnimationCoordinator, UITableViewFocusUpdateContext *, context, UIFocusAnimationCoordinator *, coordinator);
@property (nonatomic, copy) GokoEasyBlock(NSIndexPath *, goko_indexPathForPreferredFocusedViewInTableView);

// Spring Loading

// Allows opting-out of spring loading for an particular row.
// If you want the interaction effect on a different subview of the spring loaded cell, modify the context.targetView property. The default is the cell.
// If this method is not implemented, the default is YES except when the row is part of a drag session.
@property (nonatomic, copy) GokoEasyBlock2(BOOL, goko_shouldSpringLoadRowAtIndexPath_withContext, NSIndexPath *, indexPath, id<UISpringLoadedInteractionContext>, context);


@end


