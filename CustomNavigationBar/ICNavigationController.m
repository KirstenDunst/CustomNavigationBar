//
//  ICNavigationController.m
//  CustomNavigationBar
//
//  Created by CSX on 2017/3/8.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "ICNavigationController.h"
#import "ICHeadView.h"


@interface ICNavigationController ()<UINavigationControllerDelegate>
@property(nonatomic, strong)ICHeadView *headerView;

//@property (nonatomic, weak) id PopDelegate;

@end

@implementation ICNavigationController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.PopDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
    
    
    [self.navigationBar removeFromSuperview];
    self.navigationController.navigationBarHidden = YES;
    self.headerView = [[ICHeadView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-44, self.view.frame.size.width, 44)];
    [self.headerView.menuButton addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
    self.headerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.headerView];
    
}

//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    self.headerView.titleStr = [self.viewControllers lastObject].title;
    if (self.viewControllers.count>1) {
        UIViewController *viewContro = [self.viewControllers objectAtIndex:self.viewControllers.count-2];
        NSString *str = viewContro.title;
        if (str.length==0) {
           str = @"返回";
        }
        [self.headerView.menuButton setTitle:[NSString stringWithFormat:@"<%@",str] forState:UIControlStateNormal];
    }else{
        [self.headerView.menuButton setTitle:@"" forState:UIControlStateNormal];
    }
    
     UIViewController *viewContr = [self.viewControllers objectAtIndex:self.viewControllers.count-1];
    if (viewContr.navigationItem.leftBarButtonItems) {
        self.headerView.leftBarButtonItems = viewContr.navigationItem.leftBarButtonItems;
    }else if (viewContr.navigationItem.rightBarButtonItems){
        self.headerView.rightBarButtonItems = viewContr.navigationItem.rightBarButtonItems;
    }else{
        self.headerView.leftBarButtonItems = @[].copy;
        self.headerView.rightBarButtonItems = @[].copy;
    }
}

- (void)backBarButtonItemAction
{
    [self popViewControllerAnimated:YES];
  
}
//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    if (viewController == self.viewControllers[0]) {
//        self.interactivePopGestureRecognizer.delegate = self.PopDelegate;
//    }else{
//        self.interactivePopGestureRecognizer.delegate = nil;
//    }
//}

- (void)showMenu:(UIButton *)sender{
    [super popViewControllerAnimated:YES];
}


- (void)setNavigationBarHidden:(BOOL)navigationBarHidden{
    if (navigationBarHidden) {
        self.headerView.hidden = YES;
    }else{
        self.headerView.hidden = NO;
    }
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
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
