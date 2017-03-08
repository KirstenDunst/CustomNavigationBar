//
//  ICNavigationController.m
//  CustomNavigationBar
//
//  Created by CSX on 2017/3/8.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "ICNavigationController.h"
#import "ICHeadView.h"

@interface ICNavigationController ()
@property(nonatomic, strong)ICHeadView *headerView;

@end

@implementation ICNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationBar removeFromSuperview];
    self.navigationController.navigationBarHidden = YES;
    self.headerView = [[ICHeadView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-44, self.view.frame.size.width, 44)];
    [self.headerView.menuButton addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
    self.headerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.headerView];
}


- (void)showMenu:(UIButton *)sender{
    [super popViewControllerAnimated:YES];
    NSLog(@">>>>>>>>>>>>%lu",(unsigned long)self.viewControllers.count);
    if (self.viewControllers.count == 1) {
        [self.headerView.menuButton setTitle:@"" forState:UIControlStateNormal];
    }
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSString *lastStr;
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    self.headerView.titleStr = lastStr;
    NSLog(@">>>>>>>>>>>>>>>>>%@>>>>>>>>>>>>>>>>%@??????????????%lu",viewController.title,self.navigationController.title,(unsigned long)self.viewControllers.count);
    [super pushViewController:viewController animated:animated];
    lastStr = self.title;
    
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
