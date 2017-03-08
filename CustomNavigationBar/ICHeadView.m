//
//  ICHeadView.m
//  CustomNavigationBar
//
//  Created by CSX on 2017/3/8.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "ICHeadView.h"

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
    label.center = self.center;
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
     [self.menuButton setTitle:[NSString stringWithFormat:@"<%@",titleStr] forState:UIControlStateNormal];
    
    label.text = titleStr;
    CGSize size = [label sizeThatFits:CGSizeMake(0, _Frame.size.height)];
    label.bounds = CGRectMake(0, 0, size.width, size.height);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
