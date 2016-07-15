//
//  SecViewController.m
//  transitionAnimation
//
//  Created by yiming li on 16/7/15.
//  Copyright © 2016年 puxbao. All rights reserved.
//

#import "SecViewController.h"
#import "PopAnimation.h"
#import "ViewController.h"

@interface SecViewController () <UINavigationControllerDelegate>
{
    PopAnimation *popAnimation;
}

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.delegate = self;
    
    popAnimation = [[PopAnimation alloc] init];
    
    
    UIButton *lab = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [lab setTitle:@"1234567890" forState:UIControlStateNormal];
    [lab addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lab];
    
    
    
}

- (void)backClick
{
//    ViewController *vc = [[ViewController alloc] init];
//    [self.navigationController popToViewController:vc animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (id<UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPop) {
        return popAnimation;
    }else {
        return nil;
    }
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
