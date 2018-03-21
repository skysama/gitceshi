//
//  ZHTabbarViewController.m
//  GZHProject
//
//  Created by gzh on 17/3/3.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "ZHTabbarViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "HomeViewController.h"
@interface ZHTabbarViewController ()

@end

@implementation ZHTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpAllViewController];
}
-(void)setUpAllViewController{
    
    HomeViewController *one=[[HomeViewController alloc]init];
    TwoViewController *two =[[TwoViewController alloc]init];
    ThreeViewController *three =[[ThreeViewController alloc]init];
    FourViewController *four =[[FourViewController alloc]init];
    [self setUpOneChildViewController:one Image:[UIImage imageNamed:@"Home"] selectedImage:nil title:@"one"];
    [self setUpOneChildViewController:two Image:[UIImage imageNamed:@"message"] selectedImage:nil title:@"two"];

    [self setUpOneChildViewController:three Image:[UIImage imageNamed:@"search"] selectedImage:nil title:@"three"];
    
    [self setUpOneChildViewController:four Image:[UIImage imageNamed:@"my"] selectedImage:nil title:@"four"];
    
    
    
    
}

-(void)setUpOneChildViewController:(UIViewController *)Controller Image:(UIImage *)Image selectedImage:(UIImage *)selectedImage title:(NSString *)title{
    
    Controller.tabBarItem.title = title;
    
    Controller.tabBarItem.image = [Image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    Controller.tabBarItem.selectedImage = selectedImage;
    UINavigationController *WCGnav = [[UINavigationController alloc]initWithRootViewController:Controller];
    
    [self addChildViewController:WCGnav];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
