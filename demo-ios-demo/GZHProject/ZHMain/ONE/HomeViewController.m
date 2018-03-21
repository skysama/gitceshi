//
//  HomeViewController.m
//  GZHProject
//
//  Created by gzh on 17/5/11.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "HomeViewController.h"
#import "view1.h"
@interface HomeViewController ()
@property(nonatomic,strong)view1 *mainview;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"首页";
    self.view.backgroundColor = [UIColor blueColor];
    
    _mainview = [[view1 alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) withSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray) {
        _mainview.backgroundColor = [UIColor yellowColor];
    }];
 
    
    
    [self.view addSubview:_mainview];
    
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
