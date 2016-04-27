//
//  UpIconButtonView.m
//  02-QQ控件
//
//  Created by 小蔡 on 16/4/27.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "UpIconButtonView.h"

@implementation UpIconButtonView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setImage:[UIImage imageNamed:@"cat"] forState:UIControlStateNormal];
        
        [self setTitle:@"小蔡" forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        //设置圆角
        self.imageView.layer.cornerRadius = 10;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    if (Landscape) {//横屏
        self.imageView.y = 0;
        self.imageView.width = self.width;
        self.imageView.height = self.width;
        
        
        self.titleLabel.hidden = NO;
        self.titleLabel.x = 0;
        self.titleLabel.y = self.imageView.height;
        self.titleLabel.width = self.width;
        self.titleLabel.height = self.height - self.imageView.height;
    }else{
        self.titleLabel.hidden = YES;
        self.imageView.frame = self.bounds;
    }
}

@end
