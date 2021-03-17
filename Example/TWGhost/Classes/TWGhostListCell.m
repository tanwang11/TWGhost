//
//  TWGhostListCell.m
//  TWGhost_Example
//
//  Created by TW on 2021/3/17.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "TWGhostListCell.h"
#import <Masonry/Masonry.h>


@implementation TWGhostListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addViews];
    }
    return self;
}

- (void)addViews {
    for (int i = 0; i<3; i++) {
        UILabel * oneL = ({
            UILabel * l = [UILabel new];
            l.backgroundColor    = [UIColor clearColor];
            l.font               = [UIFont systemFontOfSize:15];
            
            [self.contentView addSubview:l];
            l;
        });
        
        switch (i) {
            case 0:{
                self.desL  = oneL;
                oneL.textColor = [UIColor blackColor];
                oneL.font      = [UIFont systemFontOfSize:16];
                oneL.numberOfLines = 1;
                break;
            }
            case 1:{
                oneL.textAlignment = NSTextAlignmentRight;
                self.timeL     = oneL;
                oneL.textColor = [UIColor darkGrayColor];
                oneL.font      = [UIFont systemFontOfSize:16];
                oneL.numberOfLines = 1;
                break;
            }
            case 2:{
                self.versionL   = oneL;
                oneL.textColor = [UIColor darkGrayColor];
                oneL.font      = [UIFont systemFontOfSize:16];
                oneL.numberOfLines = 0;
                break;
            }
//            case 4:{
//                self.desL12   = oneL;
//                oneL.textColor = [UIColor blackColor];
//                oneL.font      = [UIFont systemFontOfSize:16];
//                oneL.numberOfLines = 0;
//                break;
//            }
            default:
                break;
        }
    }
    float leftGap   = 15;
    float rightGap  = -15;
    float topGap    = 15;
    //float bottomGap = 15;
    float heightGap = 7;
    [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(rightGap);
        make.top.mas_equalTo(topGap);
        make.height.mas_equalTo(self.timeL.font.pointSize + 3);
        make.width.mas_equalTo(65);
    }];
    
    [self.desL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftGap);
        make.top.mas_equalTo(topGap);
        make.height.mas_equalTo(self.desL.font.pointSize + 3);
        make.right.mas_equalTo(self.timeL.mas_left).mas_offset(-5);
    }];
    [self.versionL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftGap);
        make.top.mas_equalTo(self.desL.mas_bottom).mas_offset(heightGap);;
        make.height.mas_equalTo(self.versionL.font.pointSize + 3);
        make.right.mas_equalTo(rightGap);
    }];
    
//    [self.desL12 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(leftGap);
//        make.top.mas_equalTo(self.versionL.mas_bottom).mas_offset(heightGap);
//
//        make.height.mas_equalTo(self.desL12.font.pointSize + 3);
//        make.right.mas_equalTo(rightGap);
//    }];
}

@end
