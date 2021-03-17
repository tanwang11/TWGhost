//
//  TWGhostListCell.h
//  TWGhost_Example
//
//  Created by TW on 2021/3/17.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static int TWGhostListCellH = 50;

@interface TWGhostListCell : UITableViewCell

@property (nonatomic, strong) UILabel * desL;
@property (nonatomic, strong) UILabel * timeL;
@property (nonatomic, strong) UILabel * versionL;

@end

NS_ASSUME_NONNULL_END
