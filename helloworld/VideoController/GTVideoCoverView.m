//
//  GTVideoCoverView.m
//  helloworld
//
//  Created by Jack Wang on 7/13/21.
//

#import "GTVideoCoverView.h"
#import "AVFoundation/AVFoundation.h"

@interface GTVideoCoverView()

@property(nonatomic,strong,readwrite) AVPlayerItem *videoItem;
@property(nonatomic,strong,readwrite) AVPlayer *avPlayer;
@property(nonatomic,strong,readwrite) AVPlayerLayer *playerLayer;
@property(nonatomic,strong,readwrite) UIImageView *coverView;
@property(nonatomic,strong,readwrite) UIImageView *playButton;
@property(nonatomic,copy,readwrite) NSString *videoUrl;
@end

@implementation GTVideoCoverView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,frame.size.width,frame.size.height)];
            _coverView;
        })];
        
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-50)/2,(frame.size.height-50)/2,50,50)];
            _playButton.image=[UIImage imageNamed:@"icon.bundle/videoPlay@3x.png"];
            _playButton;
        })];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGesture];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    }
    return self;
}

- (void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - public method
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl{
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _playButton.image = [UIImage imageNamed:@"icon.bundle/videoPlay@3x.png"];
    _videoUrl = videoUrl;
}

#pragma mark -
- (void)_tapToPlay{
    NSURL *videoURL = [NSURL URLWithString:_videoUrl];
    AVAsset * asset = [AVAsset assetWithURL:videoURL];
    _videoItem = [AVPlayerItem playerItemWithAsset:asset];
    _avPlayer = [AVPlayer playerWithURL:videoURL];
    
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    _playerLayer.frame=_coverView.bounds;
    [_coverView.layer addSublayer:_playerLayer];
    [_avPlayer play];
    NSLog(@"");
}

- (void)_handlePlayEnd{
//    NSLog(@"");
    [_playerLayer removeFromSuperlayer];
    _videoItem=nil;
    _avPlayer = nil;
}

@end
