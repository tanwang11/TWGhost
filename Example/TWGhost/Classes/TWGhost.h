//
//  TWGhost.h
//  TWGhost_Example
//
//  Created by TW on 2021/3/17.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TWGhostProtocol.h"


NS_ASSUME_NONNULL_BEGIN

@interface TWGhost : UIViewController <TWGhostProtocol>

- (instancetype)initWithDic:(NSDictionary *)dic;

- (void)addViews;

// 开始执行事件,比如获取网络数据
- (void)startEvent;

@end

NS_ASSUME_NONNULL_END
