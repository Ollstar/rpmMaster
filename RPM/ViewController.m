//
//  ViewController.m
//  RPM
//
//  Created by Oliver Andrews on 2015-05-14.
//  Copyright (c) 2015 Oliver Andrews. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *needleImage;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
#define degreesToRadians(degrees) (M_PI * degrees / 180.0)
    
    self.needleImage.transform = CGAffineTransformMakeRotation(degreesToRadians(120));
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPan:)];
    
    [self.view addGestureRecognizer:panGesture];
}

- (void)didPan:(UIPanGestureRecognizer *)sender {
    CGPoint velocity = [sender velocityInView:self.view];
    CGFloat vx = velocity.x;
    CGFloat vy = velocity.y;
    
    double velocityVector = sqrt(vx*vx + vy*vy );
    NSLog(@"%f",velocityVector);
    double angle = 120.0 + ((velocityVector/3000)*300.0);
    
    self.needleImage.transform = CGAffineTransformMakeRotation(degreesToRadians(angle));
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        // not doing anything here right now.
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        self.needleImage.transform = CGAffineTransformMakeRotation(degreesToRadians(120));
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
