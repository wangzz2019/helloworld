//
//  ViewController.m
//  helloworld
//
//  Created by Jack Wang on 9/24/20.
//

#import "ViewController.h"
#import "GTNormalTableViewCell.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@interface TestView : UIView

@end

@implementation TestView
- (instancetype) init{
    self=[super init];
    if (self){}
    return self;
};
- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
};
- (void)didMoveToSuperview{
    [super didMoveToSuperview];
};
- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
};
- (void)didMoveToWindow{
    [super didMoveToWindow];
};
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    UITableView *tbv=[[UITableView alloc] initWithFrame:self.view.bounds];
    
    tbv.dataSource=self;
    tbv.delegate = self;
    
    
//    TestView *tv=[[TestView alloc] init];
//    tv.backgroundColor = [UIColor greenColor];
//    tv.frame=CGRectMake(150, 150, 100, 100);
    [self.view addSubview:tbv];
//    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
//    [tv addGestureRecognizer:tapGesture];
//    [self.view addSubview:({
//        UILabel *label=[[UILabel alloc] init];
//        label.text=@"Hello World";
//        [label sizeToFit];
//        label.center=CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height/2);
//        label;
//    })];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *uivc= [[UIViewController alloc] init];
    uivc.title = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    [self.navigationController pushViewController:uivc animated:YES];
};

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
};

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
};

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GTNormalTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"id"];
    
    if (!cell){
        cell=[[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    
//    cell.textLabel.text = [NSString stringWithFormat:@"Title - %@",@(indexPath.row)];
    
//    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
//    cell.textLabel.text=@"Title";
//    cell.detailTextLabel.text=@"Subtitle";
//    cell.imageView.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
    [cell layoutTableViewCell];
    return cell;
    
};

//- (void) pushController{
//    UIViewController *vc=[[UIViewController alloc] init];
//    vc.view.backgroundColor=[UIColor whiteColor];
//    vc.navigationItem.title=@"Content";
//    vc.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"rightbutton" style:UIBarButtonItemStylePlain target:self action:nil];
//    [self.navigationController pushViewController:vc animated:YES];
//};
     

@end
