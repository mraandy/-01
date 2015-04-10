//
//  DrawLine.m
//  涂鸦画线
//
//  Created by andy  on 15/4/10.
//  Copyright (c) 2015年 andy . All rights reserved.
//

#import "DrawLine.h"

@implementation DrawLine
-(NSMutableArray *)linePoints
{
    if (!_linePoints) {
        _linePoints = [[NSMutableArray alloc]init];
    }
    return _linePoints;
}
@end
