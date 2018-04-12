//
//  SecondViewController.m
//  TouchKitOC
//
//  Created by travelsky on 2018/4/12.
//  Copyright © 2018年 wangdicen. All rights reserved.
//

#import "SecondViewController.h"


@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.67 green:0.77 blue:0.87 alpha:0.67f];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    [self.view addSubview:button];
    [button setTitle:@"back" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//    button.center = CGPointMake(self.view.frame.size.width/2.f, self.view.frame.size.height/2.f);
}

- (void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
