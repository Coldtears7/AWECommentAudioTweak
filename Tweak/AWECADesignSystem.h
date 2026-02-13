// AWECADesignSystem - 统一设计系统，全局风格一致
// Copyright (c) Apibug.com - All Rights Reserved

#import <UIKit/UIKit.h>

#pragma mark - 设计令牌

// ========== 间距 ==========
#define kDS_SpaceXS   4.0
#define kDS_SpaceSM   8.0
#define kDS_SpaceMD   12.0
#define kDS_SpaceLG   16.0
#define kDS_SpaceXL   20.0
#define kDS_SpaceXXL  24.0

// ========== 圆角 ==========
#define kDS_RadiusSM  8.0
#define kDS_RadiusMD  12.0
#define kDS_RadiusLG  16.0
#define kDS_RadiusXL  20.0
#define kDS_RadiusFull 9999.0

// ========== 行高 ==========
#define kDS_CellHeight    52.0
#define kDS_CellHeightLG  60.0
#define kDS_HeaderHeight   36.0
#define kDS_FooterHeight   28.0

// ========== 图标尺寸 ==========
#define kDS_IconSM  16.0
#define kDS_IconMD  20.0
#define kDS_IconLG  24.0

@interface AWECADesignSystem : NSObject

#pragma mark - 颜色

+ (UIColor *)bgPrimary;       // 主背景
+ (UIColor *)bgCard;          // 卡片背景
+ (UIColor *)bgElevated;      // 浮层/输入框背景
+ (UIColor *)bgOverlay;       // 遮罩

+ (UIColor *)accent;          // 主题强调色
+ (UIColor *)accentSoft;      // 强调色低透明度
+ (UIColor *)destructive;     // 危险/删除
+ (UIColor *)destructiveSoft; // 危险色低透明度
+ (UIColor *)success;         // 成功

+ (UIColor *)textPrimary;     // 主文字
+ (UIColor *)textSecondary;   // 次要文字
+ (UIColor *)textTertiary;    // 辅助文字
+ (UIColor *)textOnAccent;    // 强调色上的文字

+ (UIColor *)border;          // 边框
+ (UIColor *)separator;       // 分割线

#pragma mark - 字体

+ (UIFont *)fontTitle;         // 标题 17pt semibold
+ (UIFont *)fontHeadline;      // 小标题 15pt semibold
+ (UIFont *)fontBody;          // 正文 15pt regular
+ (UIFont *)fontCaption;       // 说明 13pt regular
+ (UIFont *)fontSmall;         // 小字 11pt regular
+ (UIFont *)fontButton;        // 按钮 15pt medium
+ (UIFont *)fontMono;          // 等宽 13pt monospaced

#pragma mark - 组件工厂

// 卡片容器
+ (UIView *)makeCardView;

// 主题按钮（实心）
+ (UIButton *)makeAccentButtonWithTitle:(NSString *)title;

// 次要按钮（描边）
+ (UIButton *)makeOutlineButtonWithTitle:(NSString *)title;

// 危险按钮
+ (UIButton *)makeDestructiveButtonWithTitle:(NSString *)title;

// 输入行（label + textField）
+ (UIView *)makeInputRowWithLabel:(NSString *)label
                      placeholder:(NSString *)placeholder
                        textField:(UITextField **)outField;

// 徽章/标签
+ (UILabel *)makeBadgeWithText:(NSString *)text color:(UIColor *)color;

// 段落标题
+ (UILabel *)makeSectionHeaderWithText:(NSString *)text;

// 图标配置
+ (UIImageSymbolConfiguration *)iconConfigSM;
+ (UIImageSymbolConfiguration *)iconConfigMD;
+ (UIImageSymbolConfiguration *)iconConfigLG;

#pragma mark - 样式应用

// 给 tableView 应用暗色主题
+ (void)styleTableView:(UITableView *)tableView;

// 给 navigationController 应用暗色主题
+ (void)styleNavigationBar:(UINavigationController *)nav;

// 给 cell 应用卡片样式
+ (void)styleCell:(UITableViewCell *)cell;

// 给 searchBar 应用暗色主题
+ (void)styleSearchBar:(UISearchBar *)searchBar;

// Toast（带模糊背景）
+ (void)showToast:(NSString *)message;

@end
