//
//  RootViewController.m
//  TouchKitOC
//
//  Created by travelsky on 2018/4/12.
//  Copyright © 2018年 wangdicen. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.27 green:0.37 blue:0.47 alpha:0.77f];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    [self.view addSubview:button];
    [button setTitle:@"next" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    
//    button.center = CGPointMake(self.view.frame.size.width/2.f, self.view.frame.size.height/2.f);

    
}

- (void)next{
    SecondViewController *svc = [[SecondViewController alloc] init];
    [self presentViewController:svc animated:YES completion:nil];
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
