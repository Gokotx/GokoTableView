//
//  UITableView+GokoUITableViewDelegateBlock.m
//  GokoTableView
//
//  Created by Goko on 2018/7/23.
//  Copyright © 2018 Goko. All rights reserved.
//

#import "UITableView+GokoUITableViewDelegateBlock.h"

@implementation UITableView (GokoUITableViewDelegateBlock)


#pragma mark UITableView Public Methods

-(void)setGoko_willDisplayCell:(void (^)(UITableViewCell *, NSIndexPath *))goko_willDisplayCell{
    GokoDynamicSetIvar(_cmd, goko_willDisplayCell);
}
-(void (^)(UITableViewCell *, NSIndexPath *))goko_willDisplayCell{
    return GokoDynamicGetIvar(@selector(setGoko_willDisplayCell:));
}
-(void)setGoko_willDisplayHeaderView:(void (^)(UIView *, NSInteger))goko_willDisplayHeaderView{
    GokoDynamicSetIvar(_cmd, goko_willDisplayHeaderView)
}
-(void (^)(UIView *, NSInteger))goko_willDisplayHeaderView{
    return GokoDynamicGetIvar(@selector(setGoko_willDisplayHeaderView:));
}
-(void)setGoko_willDisplayFooterView:(void (^)(UIView *, NSInteger))goko_willDisplayFooterView{
    GokoDynamicSetIvar(_cmd, goko_willDisplayFooterView);
}
-(void (^)(UIView *, NSInteger))goko_willDisplayFooterView{
    return GokoDynamicGetIvar(@selector(setGoko_willDisplayFooterView:));
}
-(void)setGoko_didEndDisplayingCell:(void (^)(UITableViewCell *, NSIndexPath *))goko_didEndDisplayingCell{
    GokoDynamicSetIvar(_cmd, goko_didEndDisplayingCell)
}
-(void (^)(UITableViewCell *, NSIndexPath *))goko_didEndDisplayingCell{
    return GokoDynamicGetIvar(@selector(setGoko_didEndDisplayingCell:));
}
-(void)setGoko_didEndDisplayingHeaderView:(void (^)(UIView *, NSInteger))goko_didEndDisplayingHeaderView{
    GokoDynamicSetIvar(_cmd, goko_didEndDisplayingHeaderView)
}
-(void (^)(UIView *, NSInteger))goko_didEndDisplayingHeaderView{
    return GokoDynamicGetIvar(@selector(setGoko_didEndDisplayingHeaderView:));
}
-(void)setGoko_didEndDisplayingFooterView:(void (^)(UIView *, NSInteger))goko_didEndDisplayingFooterView{
    GokoDynamicSetIvar(_cmd, goko_didEndDisplayingFooterView);
}
-(void (^)(UIView *, NSInteger))goko_didEndDisplayingFooterView{
    return GokoDynamicGetIvar(@selector(setGoko_didEndDisplayingFooterView:));
}

// Variable height support

-(void)setGoko_heightForRowAtIndexPath:(CGFloat (^)(NSIndexPath *))goko_heightForRowAtIndexPath{
    GokoDynamicSetIvar(_cmd, goko_heightForRowAtIndexPath);
}
-(CGFloat (^)(NSIndexPath *))goko_heightForRowAtIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_heightForRowAtIndexPath:));
}
-(void)setGoko_heightForHeaderInSection:(CGFloat (^)(NSInteger))goko_heightForHeaderInSection{
    GokoDynamicSetIvar(_cmd, goko_heightForHeaderInSection);
}
-(CGFloat (^)(NSInteger))goko_heightForHeaderInSection{
    return GokoDynamicGetIvar(@selector(setGoko_heightForHeaderInSection:));
}
-(void)setGoko_heightForFooterInSection:(CGFloat (^)(NSInteger))goko_heightForFooterInSection{
    GokoDynamicSetIvar(_cmd, goko_heightForFooterInSection);
}
-(CGFloat (^)(NSInteger))goko_heightForFooterInSection{
    return GokoDynamicGetIvar(@selector(setGoko_heightForFooterInSection:));
}

// Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
// If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.
-(void)setGoko_estimatedHeightForRowAtIndexPath:(CGFloat (^)(NSIndexPath *))goko_estimatedHeightForRowAtIndexPath{
    GokoDynamicSetIvar(_cmd, goko_estimatedHeightForRowAtIndexPath);
}
-(CGFloat (^)(NSIndexPath *))goko_estimatedHeightForRowAtIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_estimatedHeightForRowAtIndexPath:));
}
-(void)setGoko_estimatedHeightForHeaderInSection:(CGFloat (^)(NSInteger))goko_estimatedHeightForHeaderInSection{
    GokoDynamicSetIvar(_cmd, goko_estimatedHeightForHeaderInSection);
}
-(CGFloat (^)(NSInteger))goko_estimatedHeightForHeaderInSection{
    return GokoDynamicGetIvar(@selector(setGoko_estimatedHeightForHeaderInSection:));
}
-(void)setGoko_estimatedHeightForFooterInSection:(CGFloat (^)(NSInteger))goko_estimatedHeightForFooterInSection{
    GokoDynamicSetIvar(_cmd, goko_estimatedHeightForFooterInSection);
}
-(CGFloat (^)(NSInteger))goko_estimatedHeightForFooterInSection{
    return GokoDynamicGetIvar(@selector(setGoko_estimatedHeightForFooterInSection:));
}

// Section header & footer information. Views are preferred over title should you decide to provide both

-(void)setGoko_viewForHeaderInSection:(UIView *(^)(NSInteger))goko_viewForHeaderInSection{
    GokoDynamicSetIvar(_cmd, goko_viewForHeaderInSection);
}
-(UIView *(^)(NSInteger))goko_viewForHeaderInSection{
    return GokoDynamicGetIvar(@selector(setGoko_viewForHeaderInSection:));
}
-(void)setGoko_viewForFooterInSection:(UIView *(^)(NSInteger))goko_viewForFooterInSection{
    GokoDynamicSetIvar(_cmd, goko_viewForFooterInSection);
}
-(UIView *(^)(NSInteger))goko_viewForFooterInSection{
    return GokoDynamicGetIvar(@selector(setGoko_viewForFooterInSection:));
}

// Accessories (disclosures).

-(void)setGoko_accessoryTypeForRowWithIndexPath:(UITableViewCellAccessoryType (^)(NSIndexPath *))goko_accessoryTypeForRowWithIndexPath{
    GokoDynamicSetIvar(_cmd, goko_accessoryTypeForRowWithIndexPath);
}
-(UITableViewCellAccessoryType (^)(NSIndexPath *))goko_accessoryTypeForRowWithIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_accessoryTypeForRowWithIndexPath:));
}
-(void)setGoko_accessoryButtonTappedForRowWithIndexPath:(void (^)(NSIndexPath *))goko_accessoryButtonTappedForRowWithIndexPath{
    GokoDynamicSetIvar(_cmd, goko_accessoryButtonTappedForRowWithIndexPath);
}
-(void (^)(NSIndexPath *))goko_accessoryButtonTappedForRowWithIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_accessoryButtonTappedForRowWithIndexPath:));
}

// Selection

// -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row.
// Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
-(void)setGoko_shouldHighlightRowAtIndexPath:(BOOL (^)(NSIndexPath *))goko_shouldHighlightRowAtIndexPath{
    GokoDynamicSetIvar(_cmd, goko_shouldHighlightRowAtIndexPath);
}
-(BOOL (^)(NSIndexPath *))goko_shouldHighlightRowAtIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_shouldHighlightRowAtIndexPath:));
}
-(void)setGoko_didHighlightRowAtIndexPath:(BOOL (^)(NSIndexPath *))goko_didHighlightRowAtIndexPath{
    GokoDynamicSetIvar(_cmd, goko_didHighlightRowAtIndexPath);
}
-(BOOL (^)(NSIndexPath *))goko_didHighlightRowAtIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_didHighlightRowAtIndexPath:));
}
-(void)setGoko_didUnhighlightRowAtIndexPath:(BOOL (^)(NSIndexPath *))goko_didUnhighlightRowAtIndexPath{
    GokoDynamicSetIvar(_cmd, goko_didUnhighlightRowAtIndexPath);
}
-(BOOL (^)(NSIndexPath *))goko_didUnhighlightRowAtIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_didUnhighlightRowAtIndexPath:));
}

// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
-(void)setGoko_willSelectRowAtIndexPath:(NSIndexPath *(^)(NSIndexPath *))goko_willSelectRowAtIndexPath{
    GokoDynamicSetIvar(_cmd, goko_willSelectRowAtIndexPath);
}
-(NSIndexPath *(^)(NSIndexPath *))goko_willSelectRowAtIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_willSelectRowAtIndexPath:));
}
-(void)setGoko_willDeselectRowAtIndexPath:(NSIndexPath *(^)(NSIndexPath *))goko_willDeselectRowAtIndexPath{
    GokoDynamicSetIvar(_cmd, goko_willDeselectRowAtIndexPath);
}
-(NSIndexPath *(^)(NSIndexPath *))goko_willDeselectRowAtIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_willDeselectRowAtIndexPath:));
}
// Called after the user changes the selection.
-(void)setGoko_didSelectRowAtIndexPath:(void (^)(NSIndexPath *))goko_didSelectRowAtIndexPath{
    GokoDynamicSetIvar(_cmd, goko_didSelectRowAtIndexPath);
}
-(void (^)(NSIndexPath *))goko_didSelectRowAtIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_didSelectRowAtIndexPath:));
}
-(void)setGoko_didDeselectRowAtIndexPath:(void (^)(NSIndexPath *))goko_didDeselectRowAtIndexPath{
    GokoDynamicSetIvar(_cmd, goko_didDeselectRowAtIndexPath);
}
-(void (^)(NSIndexPath *))goko_didDeselectRowAtIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_didDeselectRowAtIndexPath:));
}

// Editing

// Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
-(void)setGoko_editingStyleForRowAtIndexPath:(UITableViewCellEditingStyle (^)(NSIndexPath *))goko_editingStyleForRowAtIndexPath{
    GokoDynamicSetIvar(_cmd, goko_editingStyleForRowAtIndexPath);
}
-(UITableViewCellEditingStyle (^)(NSIndexPath *))goko_editingStyleForRowAtIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_editingStyleForRowAtIndexPath:));
}
-(void)setGoko_titleForDeleteConfirmationButtonForRowAtIndexPath:(NSString *(^)(NSIndexPath *))goko_titleForDeleteConfirmationButtonForRowAtIndexPath NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED{
    GokoDynamicSetIvar(_cmd, goko_titleForDeleteConfirmationButtonForRowAtIndexPath);
}
-(NSString *(^)(NSIndexPath *))goko_titleForDeleteConfirmationButtonForRowAtIndexPath NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED{
    return GokoDynamicGetIvar(@selector(setGoko_titleForDeleteConfirmationButtonForRowAtIndexPath:));
}

// Use -tableView:trailingSwipeActionsConfigurationForRowAtIndexPath: instead of this method, which will be deprecated in a future release.
// This method supersedes -tableView:titleForDeleteConfirmationButtonForRowAtIndexPath: if return value is non-nil
-(void)setGoko_editActionsForRowAtIndexPath:(NSArray<UITableViewRowAction *> *(^)(NSIndexPath *))goko_editActionsForRowAtIndexPath NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED{
    GokoDynamicSetIvar(_cmd, goko_editActionsForRowAtIndexPath);
}
-(NSArray<UITableViewRowAction *> *(^)(NSIndexPath *))goko_editActionsForRowAtIndexPath NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED{
    return GokoDynamicGetIvar(@selector(setGoko_editActionsForRowAtIndexPath:));
}


// Swipe actions
// These methods supersede -editActionsForRowAtIndexPath: if implemented
// return nil to get the default swipe actions
-(void)setGoko_leadingSwipeActionsConfigurationForRowAtIndexPath:(UISwipeActionsConfiguration *(^)(NSIndexPath *))goko_leadingSwipeActionsConfigurationForRowAtIndexPath API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos){
    GokoDynamicSetIvar(_cmd, goko_leadingSwipeActionsConfigurationForRowAtIndexPath);
}
-(UISwipeActionsConfiguration *(^)(NSIndexPath *))goko_leadingSwipeActionsConfigurationForRowAtIndexPath API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos){
    return GokoDynamicGetIvar(@selector(setGoko_leadingSwipeActionsConfigurationForRowAtIndexPath:));
}
-(void)setGoko_trailingSwipeActionsConfigurationForRowAtIndexPath:(UISwipeActionsConfiguration *(^)(NSIndexPath *))goko_trailingSwipeActionsConfigurationForRowAtIndexPath API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos){
    GokoDynamicSetIvar(_cmd, goko_trailingSwipeActionsConfigurationForRowAtIndexPath);
}
-(UISwipeActionsConfiguration *(^)(NSIndexPath *))goko_trailingSwipeActionsConfigurationForRowAtIndexPath API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos){
    return GokoDynamicGetIvar(@selector(setGoko_trailingSwipeActionsConfigurationForRowAtIndexPath:));
}

// Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
-(void)setGoko_shouldIndentWhileEditingRowAtIndexPath:(BOOL (^)(NSIndexPath *))goko_shouldIndentWhileEditingRowAtIndexPath{
    GokoDynamicSetIvar(_cmd, goko_shouldIndentWhileEditingRowAtIndexPath);
}
-(BOOL (^)(NSIndexPath *))goko_shouldIndentWhileEditingRowAtIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_shouldIndentWhileEditingRowAtIndexPath:));
}


// The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
-(void)setGoko_willBeginEditingRowAtIndexPath:(void (^)(NSIndexPath *))goko_willBeginEditingRowAtIndexPath __TVOS_PROHIBITED{
    GokoDynamicSetIvar(_cmd, goko_willBeginEditingRowAtIndexPath);
}
-(void (^)(NSIndexPath *))goko_willBeginEditingRowAtIndexPath __TVOS_PROHIBITED{
    return GokoDynamicGetIvar(@selector(setGoko_willBeginEditingRowAtIndexPath:));
}
-(void)setGoko_didEndEditingRowAtIndexPath:(void (^)(NSIndexPath *))goko_didEndEditingRowAtIndexPath __TVOS_PROHIBITED{
    GokoDynamicSetIvar(_cmd, goko_didEndEditingRowAtIndexPath);
}
-(void (^)(NSIndexPath *))goko_didEndEditingRowAtIndexPath __TVOS_PROHIBITED{
    return GokoDynamicGetIvar(@selector(setGoko_didEndEditingRowAtIndexPath:));
}

// Moving/reordering

// Allows customization of the target row for a particular row as it is being moved/reordered
-(void)setGoko_targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPath:(NSIndexPath *(^)(NSIndexPath *, NSIndexPath *))goko_targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPath{
    GokoDynamicSetIvar(_cmd, goko_targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPath);
}
-(NSIndexPath *(^)(NSIndexPath *, NSIndexPath *))goko_targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPath:));
}

// Indentation
-(void)setGoko_indentationLevelForRowAtIndexPath:(NSInteger (^)(NSIndexPath *))goko_indentationLevelForRowAtIndexPath{
    GokoDynamicSetIvar(_cmd, goko_indentationLevelForRowAtIndexPath);
}
-(NSInteger (^)(NSIndexPath *))goko_indentationLevelForRowAtIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_indentationLevelForRowAtIndexPath:));
}

// Copy/Paste.  All three methods must be implemented by the delegate.
-(void)setGoko_shouldShowMenuForRowAtIndexPath:(BOOL (^)(NSIndexPath *))goko_shouldShowMenuForRowAtIndexPath{
    GokoDynamicSetIvar(_cmd, goko_shouldShowMenuForRowAtIndexPath);
}
-(BOOL (^)(NSIndexPath *))goko_shouldShowMenuForRowAtIndexPath{
    return GokoDynamicGetIvar(@selector(setGoko_shouldShowMenuForRowAtIndexPath:));
}
-(void)setGoko_canPerformAction_forRowAtIndexPath_withSender:(BOOL (^)(SEL, NSIndexPath *, id))goko_canPerformAction_forRowAtIndexPath_withSender{
    GokoDynamicSetIvar(_cmd, goko_canPerformAction_forRowAtIndexPath_withSender);
}
-(BOOL (^)(SEL, NSIndexPath *, id))goko_canPerformAction_forRowAtIndexPath_withSender {
    return GokoDynamicGetIvar(@selector(setGoko_canPerformAction_forRowAtIndexPath_withSender:));
}
-(void)setGoko_performAction_forRowAtIndexPath_withSender:(void (^)(SEL, NSIndexPath *, id))goko_performAction_forRowAtIndexPath_withSender{
    GokoDynamicSetIvar(_cmd, goko_performAction_forRowAtIndexPath_withSender);
}
-(void (^)(SEL, NSIndexPath *, id))goko_performAction_forRowAtIndexPath_withSender{
    return GokoDynamicGetIvar(@selector(setGoko_performAction_forRowAtIndexPath_withSender:));
}

// Focus
-(void)setGoko_canFocusRowAtIndexPath:(BOOL (^)(NSIndexPath *))goko_canFocusRowAtIndexPath NS_AVAILABLE_IOS(9_0){
    GokoDynamicSetIvar(_cmd, goko_canFocusRowAtIndexPath);
}
-(BOOL (^)(NSIndexPath *))goko_canFocusRowAtIndexPath NS_AVAILABLE_IOS(9_0){
    return GokoDynamicGetIvar(@selector(setGoko_canFocusRowAtIndexPath:));
}
-(void)setGoko_shouldUpdateFocusInContext:(BOOL (^)(UITableViewFocusUpdateContext *))goko_shouldUpdateFocusInContext NS_AVAILABLE_IOS(9_0){
    GokoDynamicSetIvar(_cmd, goko_shouldUpdateFocusInContext);
}
-(BOOL (^)(UITableViewFocusUpdateContext *))goko_shouldUpdateFocusInContext NS_AVAILABLE_IOS(9_0){
    return GokoDynamicGetIvar(@selector(setGoko_shouldUpdateFocusInContext:));
}
-(void)setGoko_didUpdateFocusInContext_withAnimationCoordinator:(void (^)(UITableViewFocusUpdateContext *, UIFocusAnimationCoordinator *))goko_didUpdateFocusInContext_withAnimationCoordinator NS_AVAILABLE_IOS(9_0){
    GokoDynamicSetIvar(_cmd, goko_didUpdateFocusInContext_withAnimationCoordinator);
}
-(void (^)(UITableViewFocusUpdateContext *, UIFocusAnimationCoordinator *))goko_didUpdateFocusInContext_withAnimationCoordinator NS_AVAILABLE_IOS(9_0){
    return GokoDynamicGetIvar(@selector(setGoko_didUpdateFocusInContext_withAnimationCoordinator:));
}
-(void)setGoko_indexPathForPreferredFocusedViewInTableView:(NSIndexPath *(^)(void))goko_indexPathForPreferredFocusedViewInTableView NS_AVAILABLE_IOS(9_0){
    GokoDynamicSetIvar(_cmd, goko_indexPathForPreferredFocusedViewInTableView);
}
-(NSIndexPath *(^)(void))goko_indexPathForPreferredFocusedViewInTableView NS_AVAILABLE_IOS(9_0){
    return GokoDynamicGetIvar(@selector(setGoko_indexPathForPreferredFocusedViewInTableView:));
}
-(void)setGoko_shouldSpringLoadRowAtIndexPath_withContext:(BOOL (^)(NSIndexPath *, id<UISpringLoadedInteractionContext>))goko_shouldSpringLoadRowAtIndexPath_withContext API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos){
    GokoDynamicSetIvar(_cmd, goko_shouldSpringLoadRowAtIndexPath_withContext);
}
-(BOOL (^)(NSIndexPath *, id<UISpringLoadedInteractionContext>))goko_shouldSpringLoadRowAtIndexPath_withContext API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos){
    return GokoDynamicGetIvar(@selector(setGoko_shouldSpringLoadRowAtIndexPath_withContext:));
}




#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    GokoExecuteBlock2(self.goko_willDisplayCell, cell, indexPath);
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0){
    GokoExecuteBlock2(self.goko_willDisplayHeaderView, view, section);
}
- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0){
    GokoExecuteBlock2(self.goko_willDisplayFooterView, view, section);
}
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath NS_AVAILABLE_IOS(6_0){
    GokoExecuteBlock2(self.goko_didEndDisplayingCell, cell, indexPath);
}
- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0){
    GokoExecuteBlock2(self.goko_didEndDisplayingHeaderView, view, section);
}
- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0){
    GokoExecuteBlock2(self.goko_didEndDisplayingFooterView, view, section);
}

// Variable height support

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.goko_heightForRowAtIndexPath) {
        return self.goko_heightForRowAtIndexPath(indexPath);
    }
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.goko_heightForHeaderInSection) {
        return self.goko_heightForHeaderInSection(section);
    }
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (self.goko_heightForFooterInSection) {
        return self.goko_heightForFooterInSection(section);
    }
    return CGFLOAT_MIN;
}

// Use the estimatedHeight methods to quickly calcuate guessed values which will allow for fast load times of the table.
// If these methods are implemented, the above -tableView:heightForXXX calls will be deferred until views are ready to be displayed, so more expensive logic can be placed there.
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(7_0){
    if (self.goko_estimatedHeightForRowAtIndexPath) {
        return self.goko_estimatedHeightForRowAtIndexPath(indexPath);
    }
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0){
    if (self.goko_estimatedHeightForHeaderInSection) {
        return self.goko_estimatedHeightForHeaderInSection(section);
    }
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section NS_AVAILABLE_IOS(7_0){
    if (self.goko_estimatedHeightForFooterInSection) {
        return self.goko_estimatedHeightForFooterInSection(section);
    }
    return CGFLOAT_MIN;
}

// Section header & footer information. Views are preferred over title should you decide to provide both

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   // custom view for header. will be adjusted to default or specified header height
    if (self.goko_viewForHeaderInSection) {
        return self.goko_viewForHeaderInSection(section);
    }
    return [UIView new];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
   // custom view for footer. will be adjusted to default or specified footer height
    if (self.goko_viewForFooterInSection) {
        return self.goko_viewForFooterInSection(section);
    }
    return [UIView new];

}

// Accessories (disclosures).

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath NS_DEPRECATED_IOS(2_0, 3_0) __TVOS_PROHIBITED{
    if (self.goko_accessoryTypeForRowWithIndexPath) {
        return self.goko_accessoryTypeForRowWithIndexPath(indexPath);
    }
    return UITableViewCellAccessoryNone;
}
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    GokoExecuteBlock1(self.goko_accessoryButtonTappedForRowWithIndexPath, indexPath);
}

// Selection

// -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down on a row.
// Returning NO to that message halts the selection process and does not cause the currently selected row to lose its selected look while the touch is down.
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0){
    if (self.goko_shouldHighlightRowAtIndexPath) {
        return self.goko_shouldHighlightRowAtIndexPath(indexPath);
    }
    return YES;
}
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0){
    GokoExecuteBlock1(self.goko_didHighlightRowAtIndexPath, indexPath);
}
- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0){
    GokoExecuteBlock1(self.goko_didUnhighlightRowAtIndexPath, indexPath);
}

// Called before the user changes the selection. Return a new indexPath, or nil, to change the proposed selection.
- (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.goko_willSelectRowAtIndexPath) {
        return self.goko_willSelectRowAtIndexPath(indexPath);
    }
    return indexPath;
}
- (nullable NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0){
    if (self.goko_willDeselectRowAtIndexPath) {
        return self.goko_willDeselectRowAtIndexPath(indexPath);
    }
    return indexPath;
}
// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GokoExecuteBlock1(self.goko_didSelectRowAtIndexPath, indexPath);
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0){
    GokoExecuteBlock1(self.goko_didDeselectRowAtIndexPath, indexPath);
}

// Editing

// Allows customization of the editingStyle for a particular cell located at 'indexPath'. If not implemented, all editable cells will have UITableViewCellEditingStyleDelete set for them when the table has editing property set to YES.
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.goko_editingStyleForRowAtIndexPath) {
        return self.goko_editingStyleForRowAtIndexPath(indexPath);
    }
    return UITableViewCellEditingStyleNone;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0) __TVOS_PROHIBITED{
    if(self.goko_titleForDeleteConfirmationButtonForRowAtIndexPath){
        return self.goko_titleForDeleteConfirmationButtonForRowAtIndexPath(indexPath);
    }
    return @"titleForDeleteConfirmationButtonForRowAtIndexPath";
}

// Use -tableView:trailingSwipeActionsConfigurationForRowAtIndexPath: instead of this method, which will be deprecated in a future release.
// This method supersedes -tableView:titleForDeleteConfirmationButtonForRowAtIndexPath: if return value is non-nil
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED{
    if(self.goko_editActionsForRowAtIndexPath){
        return self.goko_editActionsForRowAtIndexPath(indexPath);
    }
    return @[];
}

// Swipe actions
// These methods supersede -editActionsForRowAtIndexPath: if implemented
// return nil to get the default swipe actions
- (nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos){
    if (self.goko_leadingSwipeActionsConfigurationForRowAtIndexPath) {
        return self.goko_leadingSwipeActionsConfigurationForRowAtIndexPath(indexPath);
    }
    return [UISwipeActionsConfiguration configurationWithActions:@[]];
}
- (nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos){
    if (self.goko_trailingSwipeActionsConfigurationForRowAtIndexPath) {
        return self.goko_trailingSwipeActionsConfigurationForRowAtIndexPath(indexPath);
    }
    return [UISwipeActionsConfiguration configurationWithActions:@[]];
}

// Controls whether the background is indented while editing.  If not implemented, the default is YES.  This is unrelated to the indentation level below.  This method only applies to grouped style table views.
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.goko_shouldIndentWhileEditingRowAtIndexPath) {
        return self.goko_shouldIndentWhileEditingRowAtIndexPath(indexPath);
    }
    return YES;
}

// The willBegin/didEnd methods are called whenever the 'editing' property is automatically changed by the table (allowing insert/delete/move). This is done by a swipe activating a single row
- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath __TVOS_PROHIBITED{
    GokoExecuteBlock1(self.goko_willBeginEditingRowAtIndexPath, indexPath);
}
- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(nullable NSIndexPath *)indexPath __TVOS_PROHIBITED{
    GokoExecuteBlock1(self.goko_didEndEditingRowAtIndexPath, indexPath);
}

// Moving/reordering

// Allows customization of the target row for a particular row as it is being moved/reordered
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    if (self.goko_targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPath) {
        return self.goko_targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPath(sourceIndexPath, proposedDestinationIndexPath);
    }
    return [NSIndexPath indexPathForRow:0 inSection:0];
}

// Indentation

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    // return 'depth' of row for hierarchies
    if (self.goko_indentationLevelForRowAtIndexPath) {
        return self.goko_indentationLevelForRowAtIndexPath(indexPath);
    }
    return 0;
}


// Copy/Paste.  All three methods must be implemented by the delegate.

- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(5_0){
    if(self.goko_shouldShowMenuForRowAtIndexPath){
        return self.goko_shouldShowMenuForRowAtIndexPath(indexPath);
    }
    return NO;
}
- (BOOL)tableView:(UITableView *)tableView canPerformAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender NS_AVAILABLE_IOS(5_0){
    if(self.goko_canPerformAction_forRowAtIndexPath_withSender){
        return self.goko_canPerformAction_forRowAtIndexPath_withSender(action, indexPath, sender);
    }
    return NO;
}
- (void)tableView:(UITableView *)tableView performAction:(SEL)action forRowAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender NS_AVAILABLE_IOS(5_0){
    GokoExecuteBlock3(self.goko_performAction_forRowAtIndexPath_withSender, action, indexPath, sender);
}

// Focus

- (BOOL)tableView:(UITableView *)tableView canFocusRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(9_0){
    if(self.goko_canFocusRowAtIndexPath){
        return self.goko_canFocusRowAtIndexPath(indexPath);
    }
    return NO;
}
- (BOOL)tableView:(UITableView *)tableView shouldUpdateFocusInContext:(UITableViewFocusUpdateContext *)context NS_AVAILABLE_IOS(9_0){
    if(self.goko_shouldUpdateFocusInContext){
        return self.goko_shouldUpdateFocusInContext(context);
    }
    return NO;
}
- (void)tableView:(UITableView *)tableView didUpdateFocusInContext:(UITableViewFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator NS_AVAILABLE_IOS(9_0){
    GokoExecuteBlock2(self.goko_didUpdateFocusInContext_withAnimationCoordinator, context, coordinator);
}
- (nullable NSIndexPath *)indexPathForPreferredFocusedViewInTableView:(UITableView *)tableView NS_AVAILABLE_IOS(9_0){
    if(self.goko_indexPathForPreferredFocusedViewInTableView){
        return self.goko_indexPathForPreferredFocusedViewInTableView();
    }
    return [NSIndexPath indexPathForRow:0 inSection:0];
}

// Spring Loading

// Allows opting-out of spring loading for an particular row.
// If you want the interaction effect on a different subview of the spring loaded cell, modify the context.targetView property. The default is the cell.
// If this method is not implemented, the default is YES except when the row is part of a drag session.
- (BOOL)tableView:(UITableView *)tableView shouldSpringLoadRowAtIndexPath:(NSIndexPath *)indexPath withContext:(id<UISpringLoadedInteractionContext>)context API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos){
    if (self.goko_shouldSpringLoadRowAtIndexPath_withContext) {
        return self.goko_shouldSpringLoadRowAtIndexPath_withContext(indexPath, context);
    }
    return YES;
}


@end




