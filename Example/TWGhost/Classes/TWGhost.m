//
//  TWGhost.m
//  TWGhost_Example
//
//  Created by TW on 2021/3/17.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "TWGhost.h"
#import "TWGhostPresenter.h"
#import "TWGhostInteractor.h"

#import <Masonry/Masonry.h>


@interface TWGhost ()

@property (nonatomic, strong) TWGhostPresenter * present;

@end


@implementation TWGhost

@synthesize infoTV;
@synthesize saveDic;
@synthesize saveKey;
@synthesize blockRestore;
@synthesize blockDisappear;

- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        if (dic) {
            self.title          = dic[@"title"];
            self.saveKey        = dic[@"saveKey"];
            self.blockRestore   = dic[@"blockRestore"];
            self.blockDisappear = dic[@"blockDisappear"];
            self.saveDic        = dic[@"saveDic"];
        }
    }
    return self;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (self.blockDisappear) {
        self.blockDisappear();
    }
}

- (void)viewDidLoad {
    [self assembleViper];
    [super viewDidLoad];
    
    if (!self.title) {
        self.title = @"Ghost";
    }
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // 参考: https://www.jianshu.com/p/c244f5930fdf
    if (self.isViewLoaded && !self.view.window) {
        // self.view = nil;//当再次进入此视图中时能够重新调用viewDidLoad方法
        
    }
}

#pragma mark - VCProtocol
- (UIViewController *)vc {
    return self;
}

- (void)setMyPresent:(id)present {
    self.present = present;
}

- (void)assembleViper {
    if (!self.present) {
        TWGhostPresenter * present = [TWGhostPresenter new];
        TWGhostInteractor * interactor = [TWGhostInteractor new];
        
        self.present = present;
        [present setMyInteractor:interactor];
        [present setMyView:self];
        
        [self addViews];
        [self startEvent];
    }
}

- (void)addViews {
    self.infoTV = [self addTVs];
    
    {
        UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self.present action:@selector(backupAction)];
        self.navigationItem.rightBarButtonItems = @[item1];
    }
}

// 开始执行事件,比如获取网络数据
- (void)startEvent {
    [self.present startEvent];
}

- (UITableView *)addTVs {
    UITableView * oneTV = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    oneTV.delegate   = self.present;
    oneTV.dataSource = self.present;
    
    oneTV.allowsMultipleSelectionDuringEditing = YES;
    oneTV.directionalLockEnabled = YES;
    
    oneTV.estimatedRowHeight           = 0;
    oneTV.estimatedSectionHeaderHeight = 0;
    oneTV.estimatedSectionFooterHeight = 0;
    
    [self.view addSubview:oneTV];
    
    [oneTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    return oneTV;
}

@end
