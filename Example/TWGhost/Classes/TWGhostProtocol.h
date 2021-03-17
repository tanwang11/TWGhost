//
//  TWGhostProtocol.h
//  TWGhost_Example
//
//  Created by TW on 2021/3/17.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef TWGhostProtocol_h
#define TWGhostProtocol_h

typedef void(^TWGhostBlockRestore) (NSDictionary * restoreDic, NSString * description, NSString * time, NSString * version);
typedef void(^TWGhostBlockVoid) (void);

// MARK: 对外接口
@protocol TWGhostProtocol <NSObject>

- (UIViewController *)vc;

// MARK: 自己的
@property (nonatomic, strong) UITableView * infoTV;

// MARK: 外部注入的
@property (nonatomic, strong) NSDictionary   * saveDic;
@property (nonatomic, strong) NSString       * saveKey;

@property (nonatomic, copy  ) TWGhostBlockRestore   blockRestore;
@property (nonatomic, copy  ) TWGhostBlockVoid      blockDisappear;

@end

// MARK: 数据来源
@protocol TWGhostDataSource <NSObject>

@end

// MARK: UI事件
@protocol TWGhostEventHandler <NSObject>

- (void)backupAction;

@end


#endif /* TWGhostProtocol_h */
