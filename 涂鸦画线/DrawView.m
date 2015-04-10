//
//  DrawView.m
//  涂鸦画线
//
//  Created by andy  on 15/4/10.
//  Copyright (c) 2015年 andy . All rights reserved.
//

#import "DrawView.h"
#import "DrawLine.h"


@interface DrawView()
@property (nonatomic ,strong)NSMutableArray *lines;
@end
@implementation DrawView
-(UIColor *)drawColor
{
    if (!_drawColor) {
        _drawColor = [UIColor blackColor];
    }
    return _drawColor;
}
-(float)lineWith{
    if (_lineWith == 0) {
        _lineWith =1;
    }
    return _lineWith;
}
-(NSMutableArray *)lines
{
    if (!_lines) {
        _lines = [NSMutableArray array];
    }
    return _lines;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
   CGPoint beganPoint = [touch locationInView:touch.view];
    DrawLine *line = [[DrawLine alloc]init];
    line.lineWith = self.lineWith;
    line.lineColor = self.drawColor;
    [line.linePoints addObject:[NSValue valueWithCGPoint:beganPoint]];
    [self.lines addObject:line];
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint movePoint = [touch locationInView:touch.view];
    DrawLine *line = [self.lines lastObject];
    [line.linePoints addObject:[NSValue valueWithCGPoint:movePoint]];
    [self setNeedsDisplay];

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint endPoint = [touch locationInView:touch.view];
    DrawLine *line = [self.lines lastObject];
    [line.linePoints addObject:[NSValue valueWithCGPoint:endPoint]];
     [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    for (DrawLine *line in self.lines) {
        CGContextSaveGState(ctx);
        for (int index = 0 ;index < line.linePoints.count;index ++) {
            //获得点
            
            CGPoint point = [line.linePoints[index] CGPointValue];
            if(index == 0){
                CGContextMoveToPoint(ctx, point.x,  point.y);
            }else{
                CGContextAddLineToPoint( ctx, point.x, point.y);
            }
            CGContextSetLineWidth(ctx, line.lineWith);
            [line.lineColor set];
            
            
        }
        
        CGContextStrokePath(ctx);
        CGContextRestoreGState(ctx);
    }
//    CGContextStrokePath(ctx);

}

-(void)clearAll
{
    [self.lines removeAllObjects];
    [self setNeedsDisplay];
    
}

-(void)back{
    [self.lines removeLastObject];
    [self setNeedsDisplay];
}
-(void)savaToPhotos
{
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    
    // 2.将控制器view的layer渲染到上下文
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 3.取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.结束上下文
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(newImage, nil, nil, NULL);
}


@end
