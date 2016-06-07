//
//  ViewController.m
//  SpringAniDemo
//
//  Created by __无邪_ on 16/6/3.
//  Copyright © 2016年 fqah. All rights reserved.
//

#import "ViewController.h"
#import "SpringView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *slideDumping;
@property (weak, nonatomic) IBOutlet UISlider *slideVelocity;
@property (weak, nonatomic) IBOutlet UILabel *labDumping;
@property (weak, nonatomic) IBOutlet UILabel *labVelocity;


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


- (IBAction)showAction:(id)sender {
    SpringView *springView = [[SpringView alloc] init];
    [springView show:self.labDumping.text.floatValue v:self.labVelocity.text.floatValue];
}


- (IBAction)dumping:(UISlider *)sender {
    [self.labDumping setText:[NSString stringWithFormat:@"%@",@(sender.value)]];
}


- (IBAction)velocity:(UISlider *)sender {
    
    [self.labVelocity setText:[NSString stringWithFormat:@"%@",@(sender.value)]];
}


@end
