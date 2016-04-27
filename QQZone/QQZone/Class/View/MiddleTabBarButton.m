//
//  MiddleTabBarButton.m
//  02-QQ控件
//
//  Created by 小蔡 on 16/4/27.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "MiddleTabBarButton.h"

@implementation MiddleTabBarButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //设置不能点击的背景图案
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateDisabled];
        //按钮图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        
        //设置按钮点击时,颜色不变
        self.adjustsImageWhenHighlighted = NO;
        self.adjustsImageWhenDisabled = NO;
        
        // 设置按钮的内容向左边对齐
        //  self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //  // 设置内边距
        //   CGFloat inset = 30;
        //   self.contentEdgeInsets = UIEdgeInsetsMake(0, inset, 0, 0);
        //  self.titleEdgeInsets = UIEdgeInsetsMake(0, inset, 0, 0);
    }
    return self;
}

//取消高亮状态
- (void)setHighlighted:(BOOL)highlighted{}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    if (Landscape) {//横屏
        self.imageView.width = self.width * 0.4;
        self.imageView.height = self.height;
        self.imageView.x = 0;
        self.imageView.y = 0;
        
        self.titleLabel.hidden = NO;
        self.titleLabel.y = 0;
        self.titleLabel.x = self.imageView.width;
        self.titleLabel.width = self.width - self.imageView.width;
        self.titleLabel.height = self.height;
        
    }else{
        self.titleLabel.hidden = YES;
        self.imageView.frame = self.bounds;
        // 如果设置宽度或者高度为0,某个控件还是会显示一部分, 可以尝试设置控件的width或者height为负数
        //self.titleLabel.frame = CGRectZero;改为CGRectMake(0, 0, -1, 0);
        //        self.titleLabel.frame = CGRectMake(0, 0, -1, 0);
    }
}

@end
