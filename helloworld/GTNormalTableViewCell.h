//
//  GTNormalTableViewCell.h
//  helloworld
//
//  Created by Jack Wang on 12/17/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTNormalTableViewCell : UITableViewCell
- (void)layoutTableViewCell;
@property(nonatomic, strong, readwrite) UILabel *titleLabel;
@property(nonatomic, strong, readwrite) UILabel *sourceLabel;
@property(nonatomic, strong, readwrite) UILabel *commentLabel;
@property(nonatomic, strong, readwrite) UILabel *timeLabel;

@property(nonatomic,strong,readwrite) UIImageView *rightimageView;

@property(nonatomic, strong, readwrite) UIButton *deleteButton;

@end

NS_ASSUME_NONNULL_END
