//
//  GTRecommendViewController.m
//  helloworld
//
//  Created by Jack Wang on 11/22/20.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController () <UIScrollViewDelegate,UIGestureRecognizerDelegate>

@end

@implementation GTRecommendViewController

- (instancetype) init{
    self=[super init];
    if (self) {
        self.tabBarItem.title=@"recommandation";
        self.tabBarItem.image=[UIImage imageNamed:@"icon.bundle/like@2x.png"];
        self.tabBarItem.selectedImage=[UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIScrollView *scrollView=[[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor=[UIColor lightGrayColor];
    scrollView.contentSize= CGSizeMake(self.view.bounds.size.width*5, self.view.bounds.size.height);
//    scrollView.showsHorizontalScrollIndicator=NO;
    
    NSArray *colorArray = @[[UIColor redColor],[UIColor blueColor],[UIColor yellowColor],[UIColor lightGrayColor],[UIColor grayColor]];
    for (int i=0;i<5;i++){
        [scrollView addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width*i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            
            [view addSubview:({
                UIView *view=[[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
                view.backgroundColor=[UIColor yellowColor];
                UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
                tapGesture.delegate=self;
                [view addGestureRecognizer:tapGesture];
                view;
            })];
            
            view.backgroundColor=[colorArray objectAtIndex:i];
            view;
        })];
    }
    scrollView.pagingEnabled=YES;
    scrollView.delegate=self;
    [self.view addSubview:scrollView];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}

- (void) viewClick{
    NSLog(@"viewClick");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewDidScroll - %@",@(scrollView.contentOffset.x));
}

// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"BeginDragging");
}

// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"EndDragging");
}
// called on finger up as we are moving
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
}
// called when scroll view grinds to a halt
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
