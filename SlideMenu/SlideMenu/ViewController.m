//
//  ViewController.m
//  SlideMenu
//
//  Created by HungLV on 30/12/2014.
//  Copyright (c) Năm 2014 jp.co.enterAsia. All rights reserved.
//

#import "ViewController.h"
#import "LeftMenu.h"
#import "Rightcontent.h"

@interface ViewController ()

@property (nonatomic, strong) LeftMenu *menuLeft;
@property (nonatomic, strong) Rightcontent *contentRight;
@property (nonatomic, strong) UINavigationController *leftnavigationController;
@property (nonatomic, strong) UIView *parentView;
@property (nonatomic,assign) BOOL isSettingViewHidden;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.parentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.parentView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.parentView];
    
    // Hidden Bar Navigation
    [self.navigationController.navigationBar setHidden:YES];
    
    [self leftMenu];
    [self rightContent];
    
    // setting notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"notificationShowRightContent" object:nil];
    self.isSettingViewHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)leftMenu
{
    // show left menu
    self.menuLeft = [[LeftMenu alloc] init];
    self.leftnavigationController = [[UINavigationController alloc] initWithRootViewController:self.menuLeft];
    [self addChildViewController:self.leftnavigationController];
    [self.parentView addSubview:self.leftnavigationController.view];
    [self.leftnavigationController didMoveToParentViewController:self];
    
}
- (void)rightContent
{
    // show content
    self.contentRight = [[Rightcontent alloc] init];
    [self.contentRight.view setFrame:CGRectMake(
                                          self.view.frame.size.width
                                          , self.view.frame.origin.y
                                          , self.view.frame.size.width
                                          , self.view.frame.size.height)];
    [self addChildViewController:self.contentRight];
    [self.parentView addSubview:self.contentRight.view];
    [self.contentRight didMoveToParentViewController:self];
}

- (void)receiveNotification:(NSNotification *) notification
{
    if ([[notification name] isEqualToString:@"notificationShowRightContent"])
    {
        NSTimeInterval duration = 0.6f;//0/7
        [UIView animateWithDuration:duration
                              delay:0.0
             usingSpringWithDamping:0.6f //0.45f
              initialSpringVelocity:0.4 //0.4
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             if (self.isSettingViewHidden)
                             {
                                 [self.parentView setFrame:CGRectMake(0 - self.view.frame.size.width + 60, 0, self.view.frame.size.width, self.view.frame.size.height)];
                             }
                             else
                             {
                                 [self.parentView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
                             }
                         } completion:^(BOOL finished) {
                             if (self.isSettingViewHidden == NO) {
                                 self.isSettingViewHidden = YES;
                             }else{
                                 self.isSettingViewHidden = NO;
                             }
                         }];

    }
}
@end
