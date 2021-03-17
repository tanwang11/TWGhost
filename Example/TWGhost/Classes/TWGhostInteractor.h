//
//  TWGhostInteractor.h
//  TWGhost_Example
//
//  Created by TW on 2021/3/17.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWGhostListEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface TWGhostInteractor : NSObject

@property (nonatomic, strong) NSMutableArray * infoArray;

- (void)fetchArray:(NSString *)className;
- (void)addDic:(NSDictionary *)dic des:(NSString *)description;
- (void)updateDic;

@end

NS_ASSUME_NONNULL_END
