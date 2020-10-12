//
//  SceneDelegate.m
//  helloworld
//
//  Created by Jack Wang on 9/24/20.
//

#import "SceneDelegate.h"
#import "ViewController.h"

@interface SceneDelegate()<UITabBarControllerDelegate>

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    UIWindowScene *windowScene=(UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame=windowScene.coordinateSpace.bounds;
    
    ViewController *vc=[[ViewController alloc] init];
    vc.tabBarItem.title=@"news";
    vc.tabBarItem.image=[UIImage imageNamed:@"icon.bundle/page@2x.png"];
    vc.tabBarItem.selectedImage=[UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
    
    UITabBarController *tabbarController =  [[UITabBarController alloc] init];
    UINavigationController *navigationController=[[UINavigationController alloc] initWithRootViewController:tabbarController];
    
    UIViewController *c1=[[UIViewController alloc] init];
    c1.view.backgroundColor=[UIColor redColor];
    c1.tabBarItem.title=@"news";
    c1.tabBarItem.image=[UIImage imageNamed:@"icon.bundle/page@2x.png"];
    c1.tabBarItem.selectedImage=[UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
    
    UIViewController *c2=[[UIViewController alloc] init];
    c2.view.backgroundColor=[UIColor greenColor];
    c2.tabBarItem.title=@"video";
    c2.tabBarItem.image=[UIImage imageNamed:@"icon.bundle/video@2x.png"];
    c2.tabBarItem.selectedImage=[UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];
    
    UIViewController *c3=[[UIViewController alloc] init];
    c3.view.backgroundColor=[UIColor yellowColor];
    c3.tabBarItem.title=@"recommandation";
    c3.tabBarItem.image=[UIImage imageNamed:@"icon.bundle/like@2x.png"];
    c3.tabBarItem.selectedImage=[UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
    
    UIViewController *c4=[[UIViewController alloc] init];
    c4.view.backgroundColor=[UIColor blueColor];
    c4.tabBarItem.title=@"setting";
    c4.tabBarItem.image=[UIImage imageNamed:@"icon.bundle/home@2x.png"];
    c4.tabBarItem.selectedImage=[UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    
    tabbarController.delegate = self;
    
    [tabbarController setViewControllers:@[vc,c2,c3,c4]];
    self.window.rootViewController=navigationController;
    [self.window makeKeyAndVisible];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"did select");
    //printf("did select from printf");
};

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
