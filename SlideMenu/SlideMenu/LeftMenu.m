//
//  LeftMenu.m
//  SlideMenu
//
//  Created by HungLV on 30/12/2014.
//  Copyright (c) Năm 2014 jp.co.enterAsia. All rights reserved.
//

#import "LeftMenu.h"

@interface LeftMenu ()

@end

@implementation LeftMenu

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Left Menu";
    self.view.backgroundColor = [UIColor colorWithRed:(245/255.0) green:(222/255.0) blue:(179/255.0) alpha:1.0];
    [self createButtonNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createButtonNavigation
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0.0f, 0.0f, 30.0f, 30.0f)];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"menu-nomarl"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"menu-touch"] forState:UIControlStateHighlighted];
    UIBarButtonItem *actionButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = actionButton;
}

// post notification with name notificationShowRightContent
- (void)buttonClicked
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationShowRightContent" object:self];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
