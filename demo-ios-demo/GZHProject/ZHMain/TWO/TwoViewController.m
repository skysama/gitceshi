//
//  TwoViewController.m
//  GZHProject
//
//  Created by gzh on 17/3/3.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "TwoViewController.h"
#import "GiftViewController.h"
#import "BaseTableView.h"
#import "ZHTwoLeftViewController.h"
#import "ZHTwoRightViewController.h"
@interface TwoViewController ()
@property(nonatomic,strong)BaseTableView *tableview;

@property(nonatomic,strong)NSArray *titlearray;

@property (nonatomic, weak)UIViewController *ShowingVC;

@end

@implementation TwoViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self showingvc:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   self.title = @"two";
    _titlearray= @[@"礼物",@"测试"];
    
    ZHTwoLeftViewController *left = [[ZHTwoLeftViewController alloc]init];
    ZHTwoRightViewController *right = [[ZHTwoRightViewController alloc]init];
    [self addChildViewController:left];
    [self addChildViewController:right];
    
    
    [self initview];
    
}

- (void)showingvc:(int)index{
//    移除view
    [self.ShowingVC.view removeFromSuperview];
    UIViewController *newVC = self.childViewControllers[index];
    newVC.view.frame = self.view.bounds;
    [self.view addSubview:newVC.view];
    self.ShowingVC = newVC;
}

-(void)initview{
    
}

-(BaseTableView*)tableview{
    if (!_tableview) {
        _tableview =[[BaseTableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) WithSelctRowBlock:^(UITableView *tableview, NSIndexPath *indexPath, NSArray *dataArray) {
            
            NSLog(@"%@,%@,%@",tableview,indexPath,dataArray);
        
        }];
        
        [self.view addSubview:_tableview];
    }
    return _tableview;
    
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
