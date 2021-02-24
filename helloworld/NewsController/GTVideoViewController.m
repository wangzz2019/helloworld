//
//  GTVideoViewController.m
//  helloworld
//
//  Created by Jack Wang on 11/11/20.
//

#import "GTVideoViewController.h"

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
    flowLayout.itemSize=CGSizeMake((self.view.frame.size.width-10)/2,300);
    
    collectionView.delegate=self;
    collectionView.dataSource=self;
    collectionView.backgroundColor = [UIColor whiteColor];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.view addSubview:collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor redColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item %3 == 0){
        return CGSizeMake(self.view.frame.size.width, 300);
    }else{
        return CGSizeMake((self.view.frame.size.width-10)/2, 300);
    }
}

@end
