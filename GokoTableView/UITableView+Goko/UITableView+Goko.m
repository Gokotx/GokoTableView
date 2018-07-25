//
//  UITableView+Goko.m
//  GokoTableView
//
//  Created by Goko on 2018/7/25.
//  Copyright © 2018 Goko. All rights reserved.
//

#import "UITableView+Goko.h"
#import "GokoDefines.h"

@implementation UITableView (Goko)

+(void)load{
    SEL originSEL = @selector(initWithFrame:style:);
    SEL swizzledSEL = @selector(gokoInitWithFrame:style:);
    GokoSwizzlingMethod([self class], originSEL, swizzledSEL);
}
- (instancetype)gokoInitWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    UITableView * tableView = [self gokoInitWithFrame:frame style:style];
    tableView.delegate = (id<UITableViewDelegate>)tableView;
    tableView.dataSource = (id<UITableViewDataSource>)tableView;
    return tableView;
}

void GokoSwizzlingMethod(Class class, SEL originSEL, SEL swizzledSEL) {
    Method originMethod = class_getInstanceMethod(class, originSEL);
    Method swizzledMethod = nil;
    if (!originMethod) {
        originMethod = class_getClassMethod(class, originSEL);
        swizzledMethod = class_getClassMethod(class, swizzledSEL);
        if (!originMethod || !swizzledMethod) return;
    } else {
        swizzledMethod = class_getInstanceMethod(class, swizzledSEL);
        if (!swizzledMethod) return;
    }
    if (class_addMethod(class, originSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(class, swizzledSEL, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    } else {
        method_exchangeImplementations(originMethod, swizzledMethod);
    }
}

@end
