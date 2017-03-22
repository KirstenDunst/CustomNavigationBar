//
//  ICHeadView.h
//  CustomNavigationBar
//
//  Created by CSX on 2017/3/8.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UIBarButtonItem;

@interface ICHeadView : UIView

@property(nullable,nonatomic, copy)NSString *titleStr;
@property(nullable,nonatomic, strong)UIButton *menuButton;



//左边的按钮集
@property(nullable,nonatomic,copy) NSArray<UIBarButtonItem *> *leftBarButtonItems;
//右边的按钮集
@property(nullable,nonatomic,copy) NSArray<UIBarButtonItem *> *rightBarButtonItems;

@end
