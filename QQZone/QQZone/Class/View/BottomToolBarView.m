//
//  BottomToolBarView.m
//  02-QQ控件
//
//  Created by 小蔡 on 16/4/27.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "BottomToolBarView.h"

@implementation BottomToolBarView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupBtnWithImage:@"tabbar_mood"];
        [self setupBtnWithImage:@"tabbar_blog"];
        [self setupBtnWithImage:@"tabbar_photo"];
    }
    return self;
}

/**
 *  创建按钮
 */
- (void)setupBtnWithImage:(NSString *)imageName{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    [self addSubview:btn];
}

/**
 *  设置位置
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    
    int count = self.subviews.count;
    for (int i = 0; i< count; i++) {
        UIButton *btn = self.subviews[i];
        
        if (Landscape) {//横屏
            btn.width = self.width / 3;
            btn.height = self.height;
            btn.x = i * btn.width;
            btn.y = 0;
        }else{//竖屏
            btn.width = self.width;
            btn.height = self.height / 3;
            btn.x = 0;
            btn.y = i * btn.height;
        }
    }
    
    
}

@end
