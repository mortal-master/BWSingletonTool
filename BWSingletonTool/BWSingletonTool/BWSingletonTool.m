//
//  BWSingletonTool.m
//  BWSingletonTool
//
//  Created by mortal on 16/10/1.
//  Copyright © 2016年 mortal. All rights reserved.
//

#import "BWSingletonTool.h"

@implementation BWSingletonTool

//01 提供静态变量
static BWSingletonTool *_instance;

//02 重写allocWithZone方法,保证只分配一次存储空间
+(instancetype)allocWithZone:(struct _NSZone *)zone {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    
    return _instance;
}

//03 提供类方法
+(instancetype)shareTool {
    
    return [[self alloc]init];
}

//04 更严谨的做法
-(id)copyWithZone:(NSZone *)zone {
    
    return _instance;
}

-(id)mutableCopyWithZone:(NSZone *)zone {
    
    return _instance;
}

@end
