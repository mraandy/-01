//
//  DrawLine.h
//  涂鸦画线
//
//  Created by andy  on 15/4/10.
//  Copyright (c) 2015年 andy . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef enum {
    DrawLineStyleDefalut,
    DrawLineStyleDotted
}DrawLineStyle;
@interface DrawLine : NSObject
@property(assign ,nonatomic)float lineWith;
@property(strong ,nonatomic)NSMutableArray *linePoints;
@property(nonatomic ,strong) UIColor *lineColor;
@end
