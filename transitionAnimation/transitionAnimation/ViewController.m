//
//  ViewController.m
//  transitionAnimation
//
//  Created by yiming li on 16/7/15.
//  Copyright © 2016年 puxbao. All rights reserved.
//

#import "SecViewController.h"
#import "ViewController.h"
#import "PushAnimation.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate>
{
    PushAnimation *pushAnim;
}
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.delegate = self;
    pushAnim = [[PushAnimation alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    self.transitioningDelegate = self;
    
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *string = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SecViewController *secVC = [[SecViewController alloc] init];
    [self.navigationController pushViewController:secVC animated:YES];
}

- (id<UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return pushAnim;
    }else {
        return nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
