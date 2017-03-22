//
//  ICHeadView.m
//  CustomNavigationBar
//
//  Created by CSX on 2017/3/8.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "ICHeadView.h"

typedef enum :NSInteger{
    bgViewTags = 10000,
}tags;



@interface ICHeadView ()
{
    CGRect _Frame;
    UILabel *label;
}
@end


@implementation ICHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        _Frame = frame;
        [self createView];
    }
    return self;
}
- (void)createView{
    label = [[UILabel alloc]init];
    label.center = CGPointMake(_Frame.size.width/2, _Frame.size.height/2);
    label.textAlignment = 1;
    [self addSubview:label];
    
    self.menuButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.menuButton.frame = CGRectMake(0, 0, 100, _Frame.size.height);
    [self addSubview:self.menuButton];
    
}
- (void)setTitleStr:(NSString *)titleStr{
    if (titleStr != _titleStr) {
        _titleStr = titleStr;
    }
    label.text = titleStr;
    CGSize size = [label sizeThatFits:CGSizeMake(0, _Frame.size.height)];
    label.bounds = CGRectMake(0, 0, size.width, size.height);
    
}

- (void)setLeftBarButtonItems:(NSArray<UIBarButtonItem *> *)leftBarButtonItems{
    if (leftBarButtonItems.count>0) {
          self.menuButton.hidden = YES;
        if (_leftBarButtonItems!=leftBarButtonItems) {
            _leftBarButtonItems = leftBarButtonItems;
        }
        CGFloat border = 5;
        for (int i = 0; i<_leftBarButtonItems.count; i++) {
            UIBarButtonItem *buttonItem = _leftBarButtonItems[i];
            NSString *str = buttonItem.title;
            UIButton *myCreateButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [myCreateButton setTitle:str forState:UIControlStateNormal];
            CGSize size = [myCreateButton sizeThatFits:CGSizeMake(0, _Frame.size.height)];
            myCreateButton.frame = CGRectMake(border, 0, size.width, size.height);
            [myCreateButton setBackgroundColor:buttonItem.tintColor];
            [myCreateButton addTarget:buttonItem.target action:buttonItem.action forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:myCreateButton];
            border = border+size.width+5;
        }
    }else{
        self.menuButton.hidden = NO;
    }
}
- (void)setRightBarButtonItems:(NSArray<UIBarButtonItem *> *)rightBarButtonItems{
    UIView *bgView = [self viewWithTag:bgViewTags];
    if (!bgView) {
        bgView = [[UIView alloc]init];
        bgView.tag = bgViewTags;
        [self addSubview:bgView];
    }
    if (_rightBarButtonItems!=rightBarButtonItems) {
        _rightBarButtonItems = rightBarButtonItems;
    }
    if (_rightBarButtonItems.count>0) {
        CGFloat border = _Frame.size.width-5;
        for (int i = 0; i<_rightBarButtonItems.count; i++) {
            UIBarButtonItem *buttonItem = _rightBarButtonItems[i];
            UIButton *myCreateButton;
            CGSize size;
            NSString *str = buttonItem.title;
            CGFloat now = border;
            if (str.length>0) {
                myCreateButton = [UIButton buttonWithType:UIButtonTypeSystem];
                [myCreateButton setTitle:str forState:UIControlStateNormal];
                size = [myCreateButton sizeThatFits:CGSizeMake(0, _Frame.size.height)];
                border = border-size.width-5;
            }else if (buttonItem.image){
                myCreateButton = [UIButton buttonWithType:UIButtonTypeCustom];
                [myCreateButton setImage:buttonItem.image forState:UIControlStateNormal];
                size = buttonItem.image.size;
                border = border-size.width-5;
            }
            myCreateButton.frame = CGRectMake(_Frame.size.width-now, 8, size.width, size.height);
            [myCreateButton setBackgroundColor:buttonItem.tintColor];
            [myCreateButton addTarget:buttonItem.target action:buttonItem.action forControlEvents:UIControlEventTouchUpInside];
            [bgView addSubview:myCreateButton];
            bgView.frame = CGRectMake(border, 0, _Frame.size.width-border, _Frame.size.height);
        }
    }else{
        [bgView removeFromSuperview];
    }
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
