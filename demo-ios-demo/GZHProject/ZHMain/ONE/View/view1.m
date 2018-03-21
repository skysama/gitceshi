//
//  view1.m
//  GZHProject
//
//  Created by gzh on 17/5/11.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "view1.h"
#import "ZHNetwokingViewController.h"
#import "ZHPickViewController.h"
#import "ZHImageController.h"
#import "ZHVerifyCodeController.h"
#import "ZHMapViewController.h"
#import "OneViewController.h"
#import "ZHPayViewController.h"
#import "ZHConverListViewController.h"
#import "ZHPopViewController.h"
@interface view1 ()<
UITableViewDelegate,
UITableViewDataSource
>
@property(nonatomic,strong)NSArray *titleArray;
@end

@implementation view1
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
                _tableView.frame = CGRectMake(0, 0, WIDTH,HEIGHT);
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor redColor];
        
        [self addSubview:_tableView];
        
        
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (instancetype)initWithFrame:(CGRect)frame withSelectRowBlock:(selectRowBlock)selectRowBlock
{
    if (self = [super initWithFrame:frame])
    {
        self.selectBlock = selectRowBlock;
        
        self.tableView.hidden = NO;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    if (indexPath.row ==0) {
        cell.textLabel.text = @"AFN的网络请求封装";

    }else if (indexPath.row ==1){
        cell.textLabel.text = @"pickview的封装 日期选择器";
    }else if (indexPath.row ==2){
        cell.textLabel.text = @"图片的处理 获取相册图片";
        
    }else if (indexPath.row ==3){
        cell.textLabel.text = @"获取短信验证码";
    }else if (indexPath.row ==4){
        cell.textLabel.text = @"百度地图";
    }else if (indexPath.row == 5){
        cell.textLabel.text = @"RAC的应用";
    }else if (indexPath.row == 6){
    
        cell.textLabel.text = @"支付页面";
    }else if (indexPath.row == 7){
        
        cell.textLabel.text = @"聊天";
    }else if (indexPath.row == 8){
        
        cell.textLabel.text = @"pop控件封装";
    }
    else{
          cell.textLabel.text = [NSString stringWithFormat:@"view1 第 %ld 行", indexPath.row];
    }
  
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%ld",(long)indexPath.row);
    
    switch (indexPath.row) {
        case 0:
        {
            ZHNetwokingViewController *vc =[ZHNetwokingViewController new];
            [[self getCurrentViewController].navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:{
            ZHPickViewController *vc =[ZHPickViewController new];
              [[self getCurrentViewController].navigationController pushViewController:vc animated:YES];
        }
            
            break;
        case 2:{
            ZHImageController *vc =[ZHImageController new];
           [[self getCurrentViewController].navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:{
            ZHVerifyCodeController *vc =[ZHVerifyCodeController new];
             [[self getCurrentViewController].navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:{
            ZHMapViewController *vc =[ZHMapViewController new];
            [[self getCurrentViewController].navigationController pushViewController:vc animated:YES];

        }
            break;
        case 5:{
            OneViewController *vc = [OneViewController new];
            [[self getCurrentViewController].navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6:{
            ZHPayViewController *vc = [ZHPayViewController new];
            [[self getCurrentViewController].navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 7:{
            ZHConverListViewController *vc = [ZHConverListViewController new];
             [vc setCollectionConversationType:@[@(ConversationType_SYSTEM),@(ConversationType_PRIVATE)]];
            [[self getCurrentViewController].navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 8:{
            ZHPopViewController *vc = [ZHPopViewController new];
            [[self getCurrentViewController].navigationController pushViewController:vc animated:YES];
            
        }
            break;
            
        default:
            break;
    }
   
}

/** 获取当前View的控制器对象 */
-(UIViewController *)getCurrentViewController{
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}
-(NSArray*)titleArray{
    
    if (!_titleArray) {
        _titleArray = [NSArray arrayWithObjects:@"AFN的网络封装", nil];
    
    }
    return _titleArray;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
