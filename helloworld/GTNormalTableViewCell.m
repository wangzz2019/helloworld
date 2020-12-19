//
//  GTNormalTableViewCell.m
//  helloworld
//
//  Created by Jack Wang on 12/17/20.
//

#import "GTNormalTableViewCell.h"

@implementation GTNormalTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        [self.contentView addSubview:({
            self.titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 15, 300, 50)];
//            self.titleLabel .backgroundColor=[UIColor redColor];
            self.titleLabel.font=[UIFont systemFontOfSize:16];
            self.titleLabel.textColor=[UIColor blackColor];
            self.titleLabel;
        })];
        [self.contentView addSubview:({
            self.sourceLabel=[[UILabel alloc] initWithFrame:CGRectMake(20, 80, 50, 20)];
//            self.sourceLabel.backgroundColor=[UIColor redColor];
            self.sourceLabel.font=[UIFont systemFontOfSize:12];
            self.sourceLabel.textColor=[UIColor grayColor];
            self.sourceLabel;
        })];
        [self.contentView addSubview:({
            self.commentLabel=[[UILabel alloc] initWithFrame:CGRectMake(100, 80, 50, 20)];
//            self.commentLabel .backgroundColor=[UIColor redColor];
            self.commentLabel.font=[UIFont systemFontOfSize:12];
            self.commentLabel.textColor=[UIColor grayColor];
            self.commentLabel;
        })];
        [self.contentView addSubview:({
            self.timeLabel=[[UILabel alloc] initWithFrame:CGRectMake(150, 80, 50, 20)];
//            self.timeLabel .backgroundColor=[UIColor redColor];
            self.timeLabel.font=[UIFont systemFontOfSize:12];
            self.timeLabel.textColor=[UIColor grayColor];
            self.timeLabel;
        })];
        [self.contentView addSubview:({
            self.rightimageView=[[UIImageView alloc] initWithFrame:CGRectMake(330, 15, 70, 70)];
            self.rightimageView.backgroundColor=[UIColor redColor];
            self.rightimageView;
        })];
        
        [self.contentView addSubview:({
            self.deleteButton=[[UIButton alloc] initWithFrame:CGRectMake(290, 80, 30, 20)];
            self.deleteButton.backgroundColor=[UIColor blueColor];
            [self.deleteButton setTitle:@"x" forState:UIControlStateNormal];
            [self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
            self.deleteButton;
        })];
        
    }
    return self;
}

- (void)layoutTableViewCell{
    self.titleLabel.text = @"geektimeIOS";
    self.sourceLabel.text = @"geektimeSource";
    [self.sourceLabel sizeToFit];
    self.commentLabel.text = @"geektimeLabel";
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 15, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    self.timeLabel.text = @"geektimeTime";
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 15, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    self.rightimageView.image=[UIImage imageNamed:@"icon.bundle/timg.jpeg"];
}

@end