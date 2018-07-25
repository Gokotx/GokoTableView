//
//  GokoDefines.h
//  GokoTableView
//
//  Created by Goko on 2018/7/25.
//  Copyright © 2018 Goko. All rights reserved.
//

#ifndef GokoDefines_h
#define GokoDefines_h
#import <objc/runtime.h>


#pragma mark - Define Methods
/**
 Dynmic add ivar with given name ,hold by self.
 @return (id)added ivar
 */
#define \
GokoDynamicGetIvar(selector) ({\
    id dynamicIvar = objc_getAssociatedObject(self, selector);\
    dynamicIvar;\
});


/**
 set ivar value with key
 
 @param selector : selector
 @param value: must be an object
 @return void
 */
#define \
GokoDynamicSetIvar(selector,value) ({\
    id dynamicIvar = objc_getAssociatedObject(self, selector);\
    dynamicIvar = value;\
    objc_setAssociatedObject(self, selector, dynamicIvar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
});


#define \
GokoEasyBlock(returnType, blockName) \
returnType (^blockName)(void);

#define \
GokoEasyBlock1(returnType, blockName, paramType1, patamValue1)\
returnType (^blockName)(paramType1 patamValue1);

#define \
GokoEasyBlock2(returnType, blockName, paramType1, patamValue1, paramType2, patamValue2)\
returnType (^blockName)(paramType1 patamValue1, paramType2 patamValue2);

#define \
GokoEasyBlock3(returnType, blockName, paramType1, patamValue1, paramType2, patamValue2, paramType3, patamValue3)\
returnType (^blockName)(paramType1 patamValue1, paramType2 patamValue2, paramType3 patamValue3);

#define \
GokoExecuteBlock(gokoEasyBlock)\
if(gokoEasyBlock) gokoEasyBlock()

#define \
GokoExecuteBlock1(gokoEasyBlock1, value1)\
if(gokoEasyBlock1) gokoEasyBlock1(value1)

#define \
GokoExecuteBlock2(gokoEasyBlock2, value1, value2)\
if(gokoEasyBlock2) gokoEasyBlock2(value1, value2)

#define \
GokoExecuteBlock3(gokoEasyBlock3, value1, value2, value3)\
if(gokoEasyBlock3) gokoEasyBlock3(value1, value2, value3)




#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif


#define \
GokoTotalParams(firstParam) ({\
    NSMutableArray * paramArray = [[NSMutableArray alloc]init];\
    va_list argList;\
    if (firstParam) {\
    [paramArray addObject:firstParam];\
    va_start(argList, firstParam);\
    id tempObject;\
    while ((tempObject = va_arg(argList, id))) {\
            [paramArray addObject:tempObject];\
        }\
        va_end(argList);\
    }\
    paramArray;\
})




#endif /* GokoDefines_h */
