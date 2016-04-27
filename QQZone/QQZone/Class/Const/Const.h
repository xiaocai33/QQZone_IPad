#import <UIKit/UIKit.h>
/** 常量文件 */

/** DockView竖屏时的宽度 */
extern const CGFloat DockPW;

/** DockView横屏时的宽度 */
extern const CGFloat DockLW;
 
/** 屏幕竖屏时的宽度(横屏的高度) */
extern const CGFloat ScreenPW;

/** 屏幕横屏时的宽度(竖屏的高度) */
extern const CGFloat ScreenLW;

extern NSString *const TabBarDidSelectNotification;
extern NSString *const TabBarSelectIndex;

/** 屏幕横屏 */
#define Landscape ([UIScreen mainScreen].bounds.size.width == ScreenLW)
/** 屏幕竖屏 */
#define Portrait ([UIScreen mainScreen].bounds.size.width == ScreenPW)

#define XCColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define XCRandomColor XCColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255));