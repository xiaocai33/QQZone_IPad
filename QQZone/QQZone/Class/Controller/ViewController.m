//
//  ViewController.m
//  02-QQ控件
//
//  Created by 小蔡 on 16/4/27.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "ViewController.h"
#import "DockView.h"


@interface ViewController ()

@property (nonatomic, weak) DockView *dockView;

@property (nonatomic, strong) UIViewController *selectedVc;

@end

@implementation ViewController

/**
 *  懒加载:解决顺序问题
 */
- (DockView *)dockView{
    if (_dockView == nil) {
        DockView *dockView = [[DockView alloc] init];
        //设置背景颜色,方便调试
        //dockView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:dockView];
        _dockView = dockView;
    }
    return _dockView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = XCColor(55, 55, 55);
    
    //控制器加载完成,便判断横竖屏状态
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:-1];
    
    //监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeVc:) name:TabBarDidSelectNotification object:nil];
    
    //创建控制器
    [self setUpVc];
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)changeVc:(NSNotification *)noti{
    
    int index = [noti.userInfo[TabBarSelectIndex] intValue];
    
    [self switchChildVcWithIndex:index];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {//横屏
        self.dockView.width = DockLW;
        self.dockView.height = ScreenPW;
    }else if(UIInterfaceOrientationIsPortrait(toInterfaceOrientation)){//竖屏
        self.dockView.width = DockPW;
        self.dockView.height = ScreenLW;
        
    }
}

//创建控制器
- (void)setUpVc{
    for (int i = 0; i<6; i++) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = XCRandomColor;
        [self addChildViewController:vc];
    }
    
    //默认选中第一个控制器
    [self switchChildVcWithIndex:0];
}

/**
 *  切换子控制器
 *
 *  @param index 最新子控制器的索引
 */
- (void)switchChildVcWithIndex:(int)index{
    //移除当前vc
    [self.selectedVc.view removeFromSuperview];
    
    // 显示index对应的子控制器
    UIViewController *newChildVc = self.childViewControllers[index];
    [self.view addSubview:newChildVc.view];
    self.selectedVc = newChildVc;
    
    //添加约束(SDAutoLayout库)
    newChildVc.view.sd_layout
    .leftSpaceToView(self.dockView, 0)
    .rightEqualToView(self.view)
    .topEqualToView(self.view)
    .bottomEqualToView(self.view);
    
}

//    self.showingChildVc.view.autoresizingMask = UIViewAutoresizingNone;
// 默认情况下,所有控制器的view.autoresizingMask里面都包含了UIViewAutoresizingFlexibleWidth和UIViewAutoresizingFlexibleHeight

@end
