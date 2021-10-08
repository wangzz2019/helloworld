//
//  GTVideoCoverView.m
//  helloworld
//
//  Created by Jack Wang on 7/13/21.
//

#import "GTVideoCoverView.h"
#import "GTVideoPlayer.h"
#import "GTVideoToolbar.h"

@interface GTVideoCoverView()
@property(nonatomic,strong,readwrite) UIImageView *coverView;
@property(nonatomic,strong,readwrite) UIImageView *playButton;
@property(nonatomic,copy,readwrite) NSString *videoUrl;
@property(nonatomic,copy,readwrite) GTVideoToolbar *toolbar;
@end

@implementation GTVideoCoverView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,frame.size.width,frame.size.height - GTVideoToolbarHeigh)];
            _coverView;
        })];
        
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-50)/2,(frame.size.height- GTVideoToolbarHeigh - 50)/2,50,50)];
            _playButton.image=[UIImage imageNamed:@"icon.bundle/videoPlay@3x.png"];
            _playButton;
        })];
        
        [self addSubview:({
            _toolbar = [[GTVideoToolbar alloc] initWithFrame:CGRectMake(0, _coverView.bounds.size.height, frame.size.width, GTVideoToolbarHeigh)];
            _toolbar;
        })];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGesture];
        
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    }
    return self;
}

- (void)dealloc{
    

}

#pragma mark - public method
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl{
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _playButton.image = [UIImage imageNamed:@"icon.bundle/videoPlay@3x.png"];
    _videoUrl = videoUrl;
    [_toolbar layoutWithModel:nil];
}

- (void)_tapToPlay{
//    NSURL *videoURL = [NSURL URLWithString:_videoUrl];
    [[GTVideoPlayer Player] playVideoWithUrl:_videoUrl attachView:_coverView];

}

@end
