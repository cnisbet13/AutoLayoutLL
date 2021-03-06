//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *  squareButton;
@property (nonatomic, weak) UIButton *  portraitButton;
@property (nonatomic, weak) UIButton *  landscapeButton;

@property (nonatomic, weak) UIView *                framingView;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewHeight;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewWidth;

@end

@implementation LPAViewController

//Create 2 more views to put it in.


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    
    
    
    NSString *buttonsHorizontalConstraints = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraints
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    NSLayoutConstraint *framingViewHeight = [NSLayoutConstraint constraintWithItem:framingView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:500.0];
    
    NSLayoutConstraint *framingViewWidth = [NSLayoutConstraint constraintWithItem:framingView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:500.0];
    
    [framingView addConstraint:framingViewHeight];
    [framingView addConstraint:framingViewWidth];
    
    self.framingViewHeight = framingViewHeight;
    self.framingViewWidth = framingViewWidth;
    
    // Set up your views and constraints here
    
    
    UIView *purpleBox = [[UIView alloc] initWithFrame:CGRectZero];
    purpleBox.translatesAutoresizingMaskIntoConstraints = NO;
    purpleBox.backgroundColor = [UIColor purpleColor];
    [self.framingView addSubview:purpleBox];
    
    [self.framingView addConstraint:[NSLayoutConstraint constraintWithItem:purpleBox
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.framingView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:0.6
                                                                  constant:0]];
    
    [self.framingView addConstraint:[NSLayoutConstraint constraintWithItem:purpleBox
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1.0
                                                                  constant:50]];
    
    [self.framingView addConstraint:[NSLayoutConstraint constraintWithItem:purpleBox
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.framingView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:-20]];
    
    [self.framingView addConstraint:[NSLayoutConstraint constraintWithItem:purpleBox
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.framingView
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1.0
                                                                  constant:-20]];
    
    
    
    UIView *blueBox1 = [[UIView alloc] initWithFrame:CGRectZero];
    blueBox1.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox1.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBox1];
    
    [self.framingView addConstraint:[NSLayoutConstraint constraintWithItem:blueBox1
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.framingView addConstraint:[NSLayoutConstraint constraintWithItem:blueBox1
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    
    
    [self.framingView addConstraint:[NSLayoutConstraint constraintWithItem:blueBox1
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1.0
                                                                  constant:50.0]];
    
    [self.framingView addConstraint:[NSLayoutConstraint constraintWithItem:blueBox1
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:1.0
                                                                  constant:50.0]];
    
    
    UIView *blueBox2 = [[UIView alloc] initWithFrame:CGRectZero];
    blueBox2.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox2.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBox2];
    
    [self.framingView addConstraint:[NSLayoutConstraint constraintWithItem:blueBox2
                                                                 attribute:NSLayoutAttributeCenterX
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.framingView
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:1.0
                                                                  constant:0.0]];
    
    [self.framingView addConstraint:[NSLayoutConstraint constraintWithItem:blueBox2
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.framingView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.0
                                                                  constant:90.0]];
    
    
    
    [self.framingView addConstraint:[NSLayoutConstraint constraintWithItem:blueBox2
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1.0
                                                                  constant:50.0]];
    
    [self.framingView addConstraint:[NSLayoutConstraint constraintWithItem:blueBox2
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:1.0
                                                                  constant:50.0]];
    
    UIView *blueBox3 = [[UIView alloc] initWithFrame:CGRectZero];
    blueBox3.translatesAutoresizingMaskIntoConstraints = NO;
    blueBox3.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBox3];
    
    [self.framingView addConstraint:[NSLayoutConstraint constraintWithItem:blueBox3
                                                                 attribute:NSLayoutAttributeCenterX
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.framingView
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:1.0
                                                                  constant:0.0]];
    
    [self.framingView addConstraint:[NSLayoutConstraint constraintWithItem:blueBox3
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.framingView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.0
                                                                  constant:-90.0]];
    
    
    
    [self.framingView addConstraint:[NSLayoutConstraint constraintWithItem:blueBox3
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1.0
                                                                  constant:50.0]];
    
    [self.framingView addConstraint:[NSLayoutConstraint constraintWithItem:blueBox3
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:1.0
                                                                  constant:50.0]];
    
    
    

    

    UIView *redBox = [[UIView alloc] initWithFrame:CGRectZero];
    redBox.translatesAutoresizingMaskIntoConstraints = NO;
    redBox.backgroundColor = [UIColor redColor];
    [self.framingView addSubview:redBox];

    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redBox
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.0
                                                           constant:160.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redBox
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:1.0
                                                           constant:45.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redBox
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:0.0
                                                           constant:20.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redBox
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.framingView
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:-20.0]];
    

    
    
    UIView *orangeBox1 = [[UIView alloc] initWithFrame:CGRectZero];
    orangeBox1.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBox1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:orangeBox1];
//    self.framingView = orangeBox1;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeBox1
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:redBox
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:40.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeBox1
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:redBox
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    NSLayoutConstraint *orangeBox1ViewHeight = [NSLayoutConstraint constraintWithItem:orangeBox1
                                                                            attribute:NSLayoutAttributeHeight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:nil
                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                           multiplier:1.0
                                                                             constant:30.0];
    
    NSLayoutConstraint *orangeBox1ViewWidth = [NSLayoutConstraint constraintWithItem:orangeBox1
                                                                           attribute:NSLayoutAttributeWidth
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                                          multiplier:1.0
                                                                            constant:50.0];
    
    [orangeBox1 addConstraint:orangeBox1ViewHeight];
    [orangeBox1 addConstraint:orangeBox1ViewWidth];
    
    UIView *orangeBox2 = [[UIView alloc] initWithFrame:CGRectZero];
    orangeBox2.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBox2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:orangeBox2];

    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeBox2
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:redBox
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:-30.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:orangeBox2
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:redBox
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    NSLayoutConstraint *orangeBox2ViewHeight = [NSLayoutConstraint constraintWithItem:orangeBox2
                                                                            attribute:NSLayoutAttributeHeight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:nil
                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                           multiplier:1.0
                                                                             constant:30.0];
    
    NSLayoutConstraint *orangeBox2ViewWidth = [NSLayoutConstraint constraintWithItem:orangeBox2
                                                                           attribute:NSLayoutAttributeWidth
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                                          multiplier:1.0
                                                                            constant:70.0];
    
    [orangeBox2 addConstraint:orangeBox2ViewHeight];
    [orangeBox2 addConstraint:orangeBox2ViewWidth];
    
   
}

- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:1.0 animations:^(){
        self.framingViewHeight.constant = newHeight;
        self.framingViewWidth.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
    
    // Add in changing the constraints in an animated fashion here
}

@end
