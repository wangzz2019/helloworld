//
//  GTVideoViewController.m
//  helloworld
//
//  Created by Jack Wang on 11/11/20.
//

#import "GTVideoViewController.h"
#import "GTVideoCoverView.h"

@interface GTVideoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation GTVideoViewController

- (instancetype) init{
    self=[super init];
    if (self){
        self.tabBarItem.title=@"video";
        self.tabBarItem.image=[UIImage imageNamed:@"icon.bundle/video@2x.png"];
        self.tabBarItem.selectedImage=[UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView=[[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    flowLayout.minimumLineSpacing=10;
    flowLayout.minimumInteritemSpacing=10;
    flowLayout.itemSize=CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.width / 16 * 9);
    
    collectionView.delegate=self;
    collectionView.dataSource=self;
    collectionView.backgroundColor = [UIColor whiteColor];
    
    [collectionView registerClass:[GTVideoCoverView class] forCellWithReuseIdentifier:@"GTVideoCoverView"];
    [self.view addSubview:collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"GTVideoCoverView" forIndexPath:indexPath];
//    cell.backgroundColor=[UIColor redColor];
    if ([cell isKindOfClass:[GTVideoCoverView class]]){
//    http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4
        [((GTVideoCoverView*)cell) layoutWithVideoCoverUrl:@"icon.bundle/videoCover@3x.png" videoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    }
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.item %3 == 0){
//        return CGSizeMake(self.view.frame.size.width, 300);
//    }else{
//        return CGSizeMake((self.view.frame.size.width-10)/2, 300);
//    }
//}

@end
