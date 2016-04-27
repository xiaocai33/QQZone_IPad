//
//  DockView.m
//  02-QQ控件
//
//  Created by 小蔡 on 16/4/27.
//  Copyright © 2016年 xiaocai. All rights reserved.
//  左侧整体的布局

#import "DockView.h"
#import "UpIconButtonView.h"
#import "MiddeTabBarView.h"
#import "BottomToolBarView.h"

@interface DockView()
@property (nonatomic, weak) UpIconButtonView *upView;
@property (nonatomic, weak) MiddeTabBarView *middleView;
@property (nonatomic, weak) BottomToolBarView *bottomView;

@end

@implementation DockView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        //顶部头像模块
        UpIconButtonView *upView = [[UpIconButtonView alloc] init];
        [self addSubview:upView];
        self.upView = upView;
        
        
        //中间导航按钮视图
        MiddeTabBarView *middleView = [[MiddeTabBarView alloc] init];
        //middleView.backgroundColor = [UIColor blueColor];
        [self addSubview:middleView];
        self.middleView = middleView;
        
        //底部按钮视图
        BottomToolBarView *bottomView = [[BottomToolBarView alloc] init];
        [self addSubview:bottomView];
        self.bottomView = bottomView;
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //设置底部按钮视图的宽
    self.bottomView.width = self.width;
    
    //中间导航按钮视图的宽 高
    self.middleView.width = self.width;
    self.middleView.height = self.middleView.subviews.count * DockPW;
    
    if (Landscape) {//横屏
        self.bottomView.height = self.bottomView.width / self.bottomView.subviews.count;
        
        self.upView.width = self.width * 0.4;
        self.upView.height = self.upView.width + 30;
        self.upView.x = ( self.width - self.upView.width ) * 0.5;
        self.upView.y = 70;
        
    }else if (Portrait){//竖屏
        self.bottomView.height = self.bottomView.width * self.bottomView.subviews.count;
        
        self.upView.x = 5;
        self.upView.y = 50;
        self.upView.width = self.width - 2 * self.upView.x;
        self.upView.height = self.upView.width;
    }
    
     //设置底部按钮视图的x,y
    self.bottomView.x = 0;
    self.bottomView.y = self.height - self.bottomView.height;
    
    //设置中间导航按钮视图的x,y
    self.middleView.x = 0;
    self.middleView.y = self.bottomView.y - self.middleView.height;
    
}


@end
