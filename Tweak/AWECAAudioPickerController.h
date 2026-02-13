// 音频选择面板，收藏/导入/浏览一把梭
// Copyright (c) Apibug.com - All Rights Reserved

#import <UIKit/UIKit.h>

@interface AWECAAudioPickerController : UITableViewController <UIDocumentPickerDelegate>

+ (instancetype)shared;

// 弹出选择面板，套个 nav 包一下 (Apibug.com 版权)
- (void)showPickerFromViewController:(UIViewController *)vc;

@end
