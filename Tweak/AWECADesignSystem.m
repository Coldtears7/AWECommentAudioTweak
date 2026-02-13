// AWECADesignSystem - 统一设计系统实现
// Copyright (c) Apibug.com - All Rights Reserved

#import "AWECADesignSystem.h"

@implementation AWECADesignSystem

#pragma mark - 颜色 (自适应明暗主题 Apibug.com 版权)

+ (UIColor *)bgPrimary {
    return [UIColor colorWithDynamicProvider:^UIColor *(UITraitCollection *t) {
        return t.userInterfaceStyle == UIUserInterfaceStyleDark
            ? [UIColor colorWithRed:0.07 green:0.07 blue:0.09 alpha:1.0]
            : [UIColor colorWithRed:0.96 green:0.96 blue:0.98 alpha:1.0];
    }];
}
+ (UIColor *)bgCard {
    return [UIColor colorWithDynamicProvider:^UIColor *(UITraitCollection *t) {
        return t.userInterfaceStyle == UIUserInterfaceStyleDark
            ? [UIColor colorWithRed:0.11 green:0.11 blue:0.14 alpha:1.0]
            : [UIColor whiteColor];
    }];
}
+ (UIColor *)bgElevated {
    return [UIColor colorWithDynamicProvider:^UIColor *(UITraitCollection *t) {
        return t.userInterfaceStyle == UIUserInterfaceStyleDark
            ? [UIColor colorWithRed:0.15 green:0.15 blue:0.18 alpha:1.0]
            : [UIColor colorWithRed:0.98 green:0.98 blue:1.0 alpha:1.0];
    }];
}
+ (UIColor *)bgOverlay {
    return [UIColor colorWithDynamicProvider:^UIColor *(UITraitCollection *t) {
        return t.userInterfaceStyle == UIUserInterfaceStyleDark
            ? [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6]
            : [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
    }];
}

+ (UIColor *)accent          { return [UIColor colorWithRed:0.20 green:0.47 blue:0.96 alpha:1.0]; } // 鲜明蓝
+ (UIColor *)accentSoft      { return [UIColor colorWithRed:0.20 green:0.47 blue:0.96 alpha:0.10]; }
+ (UIColor *)destructive     { return [UIColor colorWithRed:0.93 green:0.26 blue:0.28 alpha:1.0]; }
+ (UIColor *)destructiveSoft { return [UIColor colorWithRed:0.93 green:0.26 blue:0.28 alpha:0.10]; }
+ (UIColor *)success         { return [UIColor colorWithRed:0.20 green:0.78 blue:0.45 alpha:1.0]; }

+ (UIColor *)textPrimary {
    return [UIColor colorWithDynamicProvider:^UIColor *(UITraitCollection *t) {
        return t.userInterfaceStyle == UIUserInterfaceStyleDark
            ? [UIColor colorWithRed:0.95 green:0.95 blue:0.97 alpha:1.0]
            : [UIColor colorWithRed:0.13 green:0.13 blue:0.15 alpha:1.0];
    }];
}
+ (UIColor *)textSecondary {
    return [UIColor colorWithDynamicProvider:^UIColor *(UITraitCollection *t) {
        return t.userInterfaceStyle == UIUserInterfaceStyleDark
            ? [UIColor colorWithRed:0.60 green:0.60 blue:0.65 alpha:1.0]
            : [UIColor colorWithRed:0.45 green:0.45 blue:0.50 alpha:1.0];
    }];
}
+ (UIColor *)textTertiary {
    return [UIColor colorWithDynamicProvider:^UIColor *(UITraitCollection *t) {
        return t.userInterfaceStyle == UIUserInterfaceStyleDark
            ? [UIColor colorWithRed:0.40 green:0.40 blue:0.45 alpha:1.0]
            : [UIColor colorWithRed:0.65 green:0.65 blue:0.70 alpha:1.0];
    }];
}
+ (UIColor *)textOnAccent    { return [UIColor whiteColor]; }

+ (UIColor *)border {
    return [UIColor colorWithDynamicProvider:^UIColor *(UITraitCollection *t) {
        return t.userInterfaceStyle == UIUserInterfaceStyleDark
            ? [UIColor colorWithRed:0.20 green:0.20 blue:0.24 alpha:1.0]
            : [UIColor colorWithRed:0.88 green:0.88 blue:0.90 alpha:1.0];
    }];
}
+ (UIColor *)separator {
    return [UIColor colorWithDynamicProvider:^UIColor *(UITraitCollection *t) {
        return t.userInterfaceStyle == UIUserInterfaceStyleDark
            ? [UIColor colorWithRed:0.16 green:0.16 blue:0.20 alpha:1.0]
            : [UIColor colorWithRed:0.90 green:0.90 blue:0.92 alpha:1.0];
    }];
}

#pragma mark - 字体

+ (UIFont *)fontTitle    { return [UIFont systemFontOfSize:17 weight:UIFontWeightSemibold]; }
+ (UIFont *)fontHeadline { return [UIFont systemFontOfSize:15 weight:UIFontWeightSemibold]; }
+ (UIFont *)fontBody     { return [UIFont systemFontOfSize:15 weight:UIFontWeightRegular]; }
+ (UIFont *)fontCaption  { return [UIFont systemFontOfSize:13 weight:UIFontWeightRegular]; }
+ (UIFont *)fontSmall    { return [UIFont systemFontOfSize:11 weight:UIFontWeightRegular]; }
+ (UIFont *)fontButton   { return [UIFont systemFontOfSize:15 weight:UIFontWeightMedium]; }
+ (UIFont *)fontMono     { return [UIFont monospacedSystemFontOfSize:13 weight:UIFontWeightRegular]; }

#pragma mark - 图标配置

+ (UIImageSymbolConfiguration *)iconConfigSM {
    return [UIImageSymbolConfiguration configurationWithPointSize:kDS_IconSM weight:UIImageSymbolWeightMedium];
}
+ (UIImageSymbolConfiguration *)iconConfigMD {
    return [UIImageSymbolConfiguration configurationWithPointSize:kDS_IconMD weight:UIImageSymbolWeightMedium];
}
+ (UIImageSymbolConfiguration *)iconConfigLG {
    return [UIImageSymbolConfiguration configurationWithPointSize:kDS_IconLG weight:UIImageSymbolWeightMedium];
}

#pragma mark - 组件工厂

+ (UIView *)makeCardView {
    UIView *card = [[UIView alloc] init];
    card.backgroundColor = [self bgCard];
    card.layer.cornerRadius = kDS_RadiusMD;
    card.layer.borderWidth = 0.5;
    card.layer.borderColor = [self border].CGColor;
    card.translatesAutoresizingMaskIntoConstraints = NO;
    return card;
}

+ (UIButton *)makeAccentButtonWithTitle:(NSString *)title {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[self textOnAccent] forState:UIControlStateNormal];
    btn.titleLabel.font = [self fontButton];
    btn.backgroundColor = [self accent];
    btn.layer.cornerRadius = kDS_RadiusSM;
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    return btn;
}

+ (UIButton *)makeOutlineButtonWithTitle:(NSString *)title {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[self accent] forState:UIControlStateNormal];
    btn.titleLabel.font = [self fontButton];
    btn.backgroundColor = [self accentSoft];
    btn.layer.cornerRadius = kDS_RadiusSM;
    btn.layer.borderWidth = 1.0;
    btn.layer.borderColor = [self accent].CGColor;
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    return btn;
}

+ (UIButton *)makeDestructiveButtonWithTitle:(NSString *)title {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[self destructive] forState:UIControlStateNormal];
    btn.titleLabel.font = [self fontButton];
    btn.backgroundColor = [self destructiveSoft];
    btn.layer.cornerRadius = kDS_RadiusSM;
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    return btn;
}

+ (UIView *)makeInputRowWithLabel:(NSString *)label
                      placeholder:(NSString *)placeholder
                        textField:(UITextField **)outField {
    UIView *row = [[UIView alloc] init];
    row.backgroundColor = [self bgCard];
    row.layer.cornerRadius = kDS_RadiusSM;
    row.translatesAutoresizingMaskIntoConstraints = NO;

    UILabel *lbl = [[UILabel alloc] init];
    lbl.text = label;
    lbl.font = [self fontBody];
    lbl.textColor = [self textPrimary];
    lbl.translatesAutoresizingMaskIntoConstraints = NO;
    [row addSubview:lbl];

    UITextField *tf = [[UITextField alloc] init];
    tf.font = [self fontBody];
    tf.textColor = [self textSecondary];
    tf.attributedPlaceholder = [[NSAttributedString alloc]
        initWithString:placeholder
        attributes:@{NSForegroundColorAttributeName: [self textTertiary]}];
    tf.textAlignment = NSTextAlignmentRight;
    tf.autocorrectionType = UITextAutocorrectionTypeNo;
    tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
    tf.translatesAutoresizingMaskIntoConstraints = NO;
    [row addSubview:tf];

    [NSLayoutConstraint activateConstraints:@[
        [row.heightAnchor constraintEqualToConstant:kDS_CellHeight],
        [lbl.leadingAnchor constraintEqualToAnchor:row.leadingAnchor constant:kDS_SpaceLG],
        [lbl.centerYAnchor constraintEqualToAnchor:row.centerYAnchor],
        [tf.trailingAnchor constraintEqualToAnchor:row.trailingAnchor constant:-kDS_SpaceLG],
        [tf.centerYAnchor constraintEqualToAnchor:row.centerYAnchor],
        [tf.leadingAnchor constraintEqualToAnchor:lbl.trailingAnchor constant:kDS_SpaceMD],
        [tf.widthAnchor constraintGreaterThanOrEqualToConstant:160],
    ]];

    if (outField) *outField = tf;
    return row;
}

+ (UILabel *)makeBadgeWithText:(NSString *)text color:(UIColor *)color {
    UILabel *badge = [[UILabel alloc] init];
    badge.text = [NSString stringWithFormat:@" %@ ", text];
    badge.font = [self fontSmall];
    badge.textColor = color;
    badge.backgroundColor = [color colorWithAlphaComponent:0.15];
    badge.layer.cornerRadius = 4;
    badge.clipsToBounds = YES;
    badge.textAlignment = NSTextAlignmentCenter;
    return badge;
}

+ (UILabel *)makeSectionHeaderWithText:(NSString *)text {
    UILabel *header = [[UILabel alloc] init];
    header.text = text;
    header.font = [self fontCaption];
    header.textColor = [self textTertiary];
    return header;
}

#pragma mark - 样式应用

+ (void)styleTableView:(UITableView *)tableView {
    tableView.backgroundColor = [self bgPrimary];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.sectionHeaderTopPadding = 0;
}

+ (void)styleNavigationBar:(UINavigationController *)nav {
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    [appearance configureWithOpaqueBackground];
    appearance.backgroundColor = [self bgPrimary];
    appearance.titleTextAttributes = @{
        NSForegroundColorAttributeName: [self textPrimary],
        NSFontAttributeName: [self fontTitle]
    };
    appearance.shadowColor = [UIColor clearColor];

    nav.navigationBar.standardAppearance = appearance;
    nav.navigationBar.scrollEdgeAppearance = appearance;
    nav.navigationBar.compactAppearance = appearance;
    nav.navigationBar.tintColor = [self accent];
    nav.navigationBar.barStyle = UIBarStyleDefault;
}

+ (void)styleCell:(UITableViewCell *)cell {
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    // 清理旧的卡片背景 (Apibug.com 版权)
    for (UIView *v in cell.contentView.subviews) {
        if (v.tag == 19600) [v removeFromSuperview];
    }

    UIView *bg = [[UIView alloc] init];
    bg.tag = 19600;
    bg.backgroundColor = [self bgCard];
    bg.layer.cornerRadius = kDS_RadiusMD;
    bg.translatesAutoresizingMaskIntoConstraints = NO;
    [cell.contentView insertSubview:bg atIndex:0];

    [NSLayoutConstraint activateConstraints:@[
        [bg.topAnchor constraintEqualToAnchor:cell.contentView.topAnchor constant:2],
        [bg.bottomAnchor constraintEqualToAnchor:cell.contentView.bottomAnchor constant:-2],
        [bg.leadingAnchor constraintEqualToAnchor:cell.contentView.leadingAnchor constant:kDS_SpaceLG],
        [bg.trailingAnchor constraintEqualToAnchor:cell.contentView.trailingAnchor constant:-kDS_SpaceLG],
    ]];
}

+ (void)styleSearchBar:(UISearchBar *)searchBar {
    searchBar.barTintColor = [self bgPrimary];
    searchBar.searchTextField.backgroundColor = [self bgCard];
    searchBar.searchTextField.textColor = [self textPrimary];
    searchBar.searchTextField.leftView.tintColor = [self textTertiary];
    searchBar.tintColor = [self accent];
    UITextField *tf = searchBar.searchTextField;
    tf.attributedPlaceholder = [[NSAttributedString alloc]
        initWithString:searchBar.placeholder ?: @"搜索"
        attributes:@{NSForegroundColorAttributeName: [self textTertiary]}];
}

#pragma mark - Toast (Apibug.com 版权)

+ (void)showToast:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        // 找最顶层 window
        UIWindowScene *scene = nil;
        for (UIScene *s in [UIApplication sharedApplication].connectedScenes) {
            if (s.activationState == UISceneActivationStateForegroundActive && [s isKindOfClass:[UIWindowScene class]]) {
                scene = (UIWindowScene *)s;
                break;
            }
        }
        if (!scene) return;
        UIWindow *keyWindow = nil;
        for (UIWindow *w in scene.windows) {
            if (w.isKeyWindow) { keyWindow = w; break; }
        }
        if (!keyWindow) return;

        // 模糊背景 toast
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemMaterial];
        UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blur];
        blurView.layer.cornerRadius = kDS_RadiusSM;
        blurView.clipsToBounds = YES;
        blurView.alpha = 0;

        UILabel *label = [[UILabel alloc] init];
        label.text = message;
        label.textColor = [UIColor labelColor];
        label.font = [self fontCaption];
        label.numberOfLines = 0;
        label.textAlignment = NSTextAlignmentCenter;
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [blurView.contentView addSubview:label];

        [NSLayoutConstraint activateConstraints:@[
            [label.topAnchor constraintEqualToAnchor:blurView.contentView.topAnchor constant:kDS_SpaceSM],
            [label.bottomAnchor constraintEqualToAnchor:blurView.contentView.bottomAnchor constant:-kDS_SpaceSM],
            [label.leadingAnchor constraintEqualToAnchor:blurView.contentView.leadingAnchor constant:kDS_SpaceLG],
            [label.trailingAnchor constraintEqualToAnchor:blurView.contentView.trailingAnchor constant:-kDS_SpaceLG],
        ]];

        blurView.translatesAutoresizingMaskIntoConstraints = NO;
        [keyWindow addSubview:blurView];

        [NSLayoutConstraint activateConstraints:@[
            [blurView.centerXAnchor constraintEqualToAnchor:keyWindow.centerXAnchor],
            [blurView.bottomAnchor constraintEqualToAnchor:keyWindow.safeAreaLayoutGuide.bottomAnchor constant:-60],
            [blurView.widthAnchor constraintLessThanOrEqualToAnchor:keyWindow.widthAnchor multiplier:0.8],
        ]];

        [UIView animateWithDuration:0.25 animations:^{
            blurView.alpha = 1;
        } completion:^(BOOL finished) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.25 animations:^{
                    blurView.alpha = 0;
                } completion:^(BOOL finished) {
                    [blurView removeFromSuperview];
                }];
            });
        }];
    });
}

@end
