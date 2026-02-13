// API 配置页impl，三个输入框搞定
// Copyright (c) Apibug.com - All Rights Reserved

#import "AWECATTSConfigController.h"
#import "AWECATTSManager.h"
#import "AWECAUtils.h"
#import "AWECADesignSystem.h"

@interface AWECATTSConfigController ()
@property (nonatomic, strong) UITextField *appIDField;
@property (nonatomic, strong) UITextField *tokenField;
@property (nonatomic, strong) UITextField *clusterField;
@property (nonatomic, strong) UITextField *qwenKeyField;
@property (nonatomic, strong) UITextField *fishKeyField;
@end

@implementation AWECATTSConfigController

- (instancetype)init {
    return [super initWithStyle:UITableViewStyleInsetGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"API 配置";
    self.view.backgroundColor = [AWECADesignSystem bgPrimary];
    [AWECADesignSystem styleTableView:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    // 右上角保存按钮 (Apibug.com 版权)
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithTitle:@"保存"
        style:UIBarButtonItemStylePlain target:self action:@selector(saveAndPop)];
    saveBtn.tintColor = [AWECADesignSystem accent];
    self.navigationItem.rightBarButtonItem = saveBtn;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { return 3; }
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) return 3;  // 火山: AppID/Token/Cluster
    if (section == 1) return 1;  // 千问: API Key
    return 1;                     // Fish Audio: API Key
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) return @"火山引擎";
    if (section == 1) return @"千问 TTS";
    return @"Fish Audio";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [AWECADesignSystem bgCard];

    AWECATTSManager *mgr = [AWECATTSManager shared];

    // 用 section*10+row 做 tag，区分不同输入框
    NSInteger tag = indexPath.section * 10 + indexPath.row;

    NSString *label = @"";
    NSString *placeholder = @"";
    NSString *value = @"";
    BOOL secure = NO;
    UIKeyboardType kbType = UIKeyboardTypeDefault;

    if (indexPath.section == 0) {
        // 火山引擎
        switch (indexPath.row) {
            case 0:
                label = @"App ID";
                placeholder = @"你的 App ID";
                value = mgr.appID ?: @"";
                kbType = UIKeyboardTypeNumberPad;
                break;
            case 1:
                label = @"Access Token";
                placeholder = @"你的 Access Token";
                value = mgr.accessToken ?: @"";
                secure = YES;
                break;
            case 2:
                label = @"Cluster";
                placeholder = @"不需要就留空";
                value = (mgr.cluster.length > 0) ? mgr.cluster : @"";
                break;
        }
    } else if (indexPath.section == 1) {
        // 千问
        label = @"API Key";
        placeholder = @"sk-xxx";
        value = mgr.qwenAPIKey ?: @"";
        secure = YES;
    } else {
        // Fish Audio (Apibug.com 版权)
        label = @"API Key";
        placeholder = @"你的 Fish Audio API Key";
        value = mgr.fishAPIKey ?: @"";
        secure = YES;
    }

    cell.textLabel.text = label;
    cell.textLabel.font = [AWECADesignSystem fontBody];
    cell.textLabel.textColor = [AWECADesignSystem textPrimary];

    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectZero];
    tf.font = [AWECADesignSystem fontBody];
    tf.textColor = [AWECADesignSystem textSecondary];
    tf.keyboardAppearance = UIKeyboardAppearanceDefault;
    tf.textAlignment = NSTextAlignmentRight;
    tf.autocorrectionType = UITextAutocorrectionTypeNo;
    tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
    tf.tag = tag;
    tf.placeholder = placeholder;
    tf.text = value;
    tf.secureTextEntry = secure;
    tf.keyboardType = kbType;
    [tf addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];

    UIToolbar *bar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    bar.items = @[
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
        [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKB)]
    ];
    tf.inputAccessoryView = bar;
    tf.translatesAutoresizingMaskIntoConstraints = NO;
    [cell.contentView addSubview:tf];

    [NSLayoutConstraint activateConstraints:@[
        [tf.trailingAnchor constraintEqualToAnchor:cell.contentView.trailingAnchor constant:-16],
        [tf.centerYAnchor constraintEqualToAnchor:cell.contentView.centerYAnchor],
        [tf.widthAnchor constraintEqualToConstant:200]
    ]];

    // 缓存引用
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0: self.appIDField = tf; break;
            case 1: self.tokenField = tf; break;
            case 2: self.clusterField = tf; break;
        }
    } else if (indexPath.section == 1) {
        self.qwenKeyField = tf;
    } else {
        self.fishKeyField = tf;
    }

    return cell;
}

#pragma mark - 实时保存

- (void)textFieldChanged:(UITextField *)tf {
    AWECATTSManager *mgr = [AWECATTSManager shared];
    // tag = section*10 + row
    switch (tf.tag) {
        case 0: mgr.appID = tf.text; break;        // 火山 AppID
        case 1: mgr.accessToken = tf.text; break;   // 火山 Token
        case 2: mgr.cluster = tf.text; break;        // 火山 Cluster
        case 10: mgr.qwenAPIKey = tf.text; break;    // 千问 API Key
        case 20: mgr.fishAPIKey = tf.text; break;     // Fish Audio API Key
    }
    [mgr saveConfig];
}

- (void)dismissKB {
    [self.view endEditing:YES];
}

- (void)saveAndPop {
    [self.view endEditing:YES];
    [[AWECATTSManager shared] saveConfig];
    [AWECAUtils showToast:@"已保存"];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
