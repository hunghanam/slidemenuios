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
{
    LeftMenu *leftmenu;
    Rightcontent *rightcontent;
    UINavigationController *navigationSlideMenu;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationController.navigationBar setHidden:YES];
    [self leftMenu];
    [self rightContent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)leftMenu
{
    // show left menu
    leftmenu = [[LeftMenu alloc] init];
    [leftmenu.view setFrame:self.view.frame];
    navigationSlideMenu = [[UINavigationController alloc] initWithRootViewController:leftmenu];
    [self addChildViewController:navigationSlideMenu];
    [navigationSlideMenu didMoveToParentViewController:self];
    [self.view addSubview:navigationSlideMenu.view];
    
}
- (void)rightContent
{
    // show content
    rightcontent = [[Rightcontent alloc] init];
    [rightcontent.view setFrame:CGRectMake(self.view.frame.origin.x + self.view.frame.size.width
                                          , self.view.frame.origin.y
                                          , self.view.frame.size.width
                                          , self.view.frame.size.height)];
    [self addChildViewController:rightcontent];
    [rightcontent didMoveToParentViewController:self];
    [self.view addSubview:rightcontent.view];
}
@end
