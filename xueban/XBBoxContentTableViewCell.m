//
//  XBBoxContentTableViewCell.m
//  xueban
//
//  Created by dang on 16/7/11.
//  Copyright © 2016年 dang. All rights reserved.
//

#import "XBBoxContentTableViewCell.h"
#import "XBBoxContentCellDataKey.h"
#import "UIImageView+WebCache.h"

@interface XBBoxContentTableViewCell()

@property (nonatomic, strong)UIView *lineView;
@property (nonatomic, strong)UIImageView *circleImageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *subTitleLabel;

@end

@implementation XBBoxContentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.circleImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.subTitleLabel];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.offset(0);
            make.height.mas_equalTo(1);
        }];
        [_circleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(20.0f);
            make.top.mas_offset(10.0f);
            make.bottom.mas_equalTo(-10.0f);
            make.width.equalTo(_circleImageView.mas_height);
        }];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_circleImageView.mas_right).offset(20.0f);
            make.right.offset(0.0f);
            make.top.offset(10.0f);
        }];
        [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_circleImageView.mas_right).offset(20.0f);
            make.right.offset(0.0f);
            make.bottom.offset(-10.0f);
        }];
    }
    return self;
}

#pragma mark - public method
- (void)configWithDict:(NSDictionary *)dict AtIndexPath:(NSIndexPath *)indexPath {
    _titleLabel.text = dict[kBoxContentCellDataKeyTitle];
    _subTitleLabel.text = dict[kBoxContentCellDataKeySubTitle];
    [_circleImageView sd_setImageWithURL:[NSURL URLWithString:dict[kBoxContentCellDataKeyImageUrl]]];
}

#pragma mark getter and setter
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
    }
    return _lineView;
}

- (UIImageView *)circleImageView {
    if (!_circleImageView) {
        _circleImageView = [[UIImageView alloc] init];
        _circleImageView.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
        _circleImageView.layer.cornerRadius = (70-10-10)/2;
        _circleImageView.clipsToBounds = YES;
    }
    return _circleImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:18.0f];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel{
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.textColor = [UIColor colorWithHexString:@"969696"];
        _subTitleLabel.font = [UIFont systemFontOfSize:15.0f];
    }
    return _subTitleLabel;
}

@end
