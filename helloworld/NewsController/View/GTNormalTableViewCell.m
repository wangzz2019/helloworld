//
//  GTNormalTableViewCell.m
//  helloworld
//
//  Created by Jack Wang on 12/17/20.
//

#import "GTNormalTableViewCell.h"
#import "GTListitem.h"
#import "GTScreen.h"
#import "SDWebImage.h"


@implementation GTNormalTableViewCell


- (void)awakeFromNib {
	[super awakeFromNib];
	// Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];

	// Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
	self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self.contentView addSubview:({
			self.titleLabel=[[UILabel alloc] initWithFrame:UIRect(20, 15, 300, 50)];
//            self.titleLabel .backgroundColor=[UIColor redColor];
			self.titleLabel.font=[UIFont systemFontOfSize:16];
			self.titleLabel.textColor=[UIColor blackColor];
			self.titleLabel;
		})];
		[self.contentView addSubview:({
			self.sourceLabel=[[UILabel alloc] initWithFrame:UIRect(20, 80, 50, 20)];
//            self.sourceLabel.backgroundColor=[UIColor redColor];
			self.sourceLabel.font=[UIFont systemFontOfSize:12];
			self.sourceLabel.textColor=[UIColor grayColor];
			self.sourceLabel;
		})];
		[self.contentView addSubview:({
			self.commentLabel=[[UILabel alloc] initWithFrame:UIRect(100, 80, 50, 20)];
//            self.commentLabel .backgroundColor=[UIColor redColor];
			self.commentLabel.font=[UIFont systemFontOfSize:12];
			self.commentLabel.textColor=[UIColor grayColor];
			self.commentLabel;
		})];
		[self.contentView addSubview:({
			self.timeLabel=[[UILabel alloc] initWithFrame:UIRect(150, 80, 50, 20)];
//            self.timeLabel .backgroundColor=[UIColor redColor];
			self.timeLabel.font=[UIFont systemFontOfSize:12];
			self.timeLabel.textColor=[UIColor grayColor];
			self.timeLabel;
		})];
		[self.contentView addSubview:({
			self.rightimageView=[[UIImageView alloc] initWithFrame:UIRect(330, 15, 70, 70)];
			self.rightimageView.backgroundColor=[UIColor redColor];
			self.rightimageView;
		})];

		[self.contentView addSubview:({
			self.deleteButton=[[UIButton alloc] initWithFrame:UIRect(290, 80, 30, 20)];
//            self.deleteButton.backgroundColor=[UIColor blueColor];
			[self.deleteButton setTitle:@"x" forState:UIControlStateNormal];
			[self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
			[self.deleteButton addTarget:self action:@selector(deletebuttonClick) forControlEvents:UIControlEventTouchUpInside];
			self.deleteButton.layer.cornerRadius=10;
			self.deleteButton.layer.masksToBounds =YES;

			self.deleteButton.layer.borderColor=[UIColor lightGrayColor].CGColor;
			self.deleteButton.layer.borderWidth=2;

			self.deleteButton;
		})];

	}
	return self;
}

- (void)layoutTableViewCellWithItem:(GTListItem *)item {

	BOOL hasRead = [[NSUserDefaults standardUserDefaults] boolForKey:item.uniqueKey];

	if (hasRead) {
		self.titleLabel.textColor=[UIColor greenColor];
	}else{
		self.titleLabel.textColor=[UIColor blackColor];
	}

//    self.titleLabel.text = item.v4;
//    self.sourceLabel.text = item.v5;

	self.titleLabel.text = item.title;

	self.sourceLabel.text = item.authorName;
	[self.sourceLabel sizeToFit];


	self.commentLabel.text = item.category;
	[self.commentLabel sizeToFit];
	self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 15, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);


	self.timeLabel.text = item.date;

	[self.timeLabel sizeToFit];
	self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 15, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);

//	self.rightimageView.image=[UIImage imageNamed:@"icon.bundle/timg.jpeg"];
    
//    NSThread *downloadImageThread = [[NSThread alloc] initWithBlock:^{
//
//        }];
//
//        downloadImageThread.name = @"downloadImageThread";
//        [downloadImageThread start];
//
//        dispatch_queue_global_t downloadQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//        dispatch_queue_main_t mainQueue = dispatch_get_main_queue();
//
//        dispatch_async(downloadQueue, ^{
//            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//            dispatch_async(mainQueue, ^{
//                self.rightimageView.image = image;
//            });
//        });
    
    [self.rightimageView sd_setImageWithURL:[NSURL URLWithString:item.picUrl]
                                      completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                                            //处理业务逻辑，通过cacheType判断图片是否命中缓存
                                      }];
}

- (void)deletebuttonClick {
//    NSLog(@"I click the button");
	if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
		[self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
	}
}

@end
