//
//  DrawView.h
//  涂鸦画线
//
//  Created by andy  on 15/4/10.
//  Copyright (c) 2015年 andy . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView
@property (nonatomic ,strong)UIColor *drawColor;
@property (nonatomic ,assign)float lineWith;
-(void)clearAll;
-(void)back;
-(void)savaToPhotos;
@end
