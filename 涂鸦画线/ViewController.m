//
//  ViewController.m
//  涂鸦画线
//
//  Created by andy  on 15/4/10.
//  Copyright (c) 2015年 andy . All rights reserved.
//

#import "ViewController.h"

#import "DrawView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet DrawView *drawView;

@property (weak, nonatomic) IBOutlet UITextField *lineWeith;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)blueClick:(id)sender {
     self.drawView.drawColor = [UIColor blueColor];
}
- (IBAction)redClick:(id)sender {
    self.drawView.drawColor = [UIColor redColor];
}

- (IBAction)backClick:(id)sender {
    [self.drawView back];
}
- (IBAction)clearAll:(id)sender {
     [self.drawView clearAll];
}
- (IBAction)ensureLineWith:(id)sender {
    
    self.drawView.lineWith = [self.lineWeith.text floatValue];
}

- (IBAction)lineWeith:(UISlider *)sender {
    self.drawView.lineWith = sender.value;
}

- (IBAction)sevaTophotos:(id)sender {
    [self.drawView savaToPhotos];
}

@end
