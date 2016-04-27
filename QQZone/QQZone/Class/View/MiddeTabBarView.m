//
//  MiddeTabBarView.m
//  02-QQ控件
//
//  Created by 小蔡 on 16/4/27.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "MiddeTabBarView.h"
#import "MiddleTabBarButton.h"

@interface MiddeTabBarView()

@property (nonatomic, strong) MiddleTabBarButton *seletedBtn;

@end

@implementation MiddeTabBarView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        MiddleTabBarButton *fristBtn = [self setupBtnWithTitle:@"我的空间" image:@"tab_bar_feed_icon"];
        fristBtn.enabled = NO;
        self.seletedBtn = fristBtn;
        
        
        [self setupBtnWithTitle:@"好友列表" image:@"tab_bar_friend_icon"];
        [self setupBtnWithTitle:@"提到" image:@"tab_bar_passive_feed_icon"];
        [self setupBtnWithTitle:@"图片" image:@"tab_bar_pic_wall_icon"];
        [self setupBtnWithTitle:@"不知道" image:@"tab_bar_e_album_icon"];
        [self setupBtnWithTitle:@"更多功能" image:@"tab_bar_e_more_icon"];
    }
    return self;
}

/**
 *  创建按钮
 */
- (MiddleTabBarButton *)setupBtnWithTitle:(NSString *)title image:(NSString *)imageName{
    
    MiddleTabBarButton *btn = [[MiddleTabBarButton alloc] init];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    //设置按钮内边距
    //btn.contentEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    //设置按钮title的内边距
    //btn.titleEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    
    [self addSubview:btn];
    
    return btn;
}

- (void)btnClick:(MiddleTabBarButton *)btn{
    self.seletedBtn.enabled = YES;
    btn.enabled = NO;
    self.seletedBtn = btn;
    
    NSDictionary *userInfo = @{TabBarSelectIndex:@(btn.tag)};
    
    //创建通知
    [[NSNotificationCenter defaultCenter] postNotificationName:TabBarDidSelectNotification object:nil userInfo:userInfo];
}
/**
 *  设置位置
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    
    int count = self.subviews.count;
   

    for (int i = 0; i< count; i++) {
        MiddleTabBarButton *btn = self.subviews[i];
        
        btn.width = self.width;
        btn.height = self.height / count;
        
        btn.x = 0;
        btn.y = i * btn.height;
        btn.tag = i;
    }
    
    
}


@end
