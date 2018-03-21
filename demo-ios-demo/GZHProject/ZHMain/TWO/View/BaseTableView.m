//
//  BaseTableView.m
//  GZHProject
//
//  Created by gzh on 17/5/1.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "BaseTableView.h"


@interface BaseTableView ()<UITableViewDataSource,UITableViewDelegate>{
    BOOL isShowAnimation;
}
@property(nonatomic,strong)NSMutableArray *titleArray;
@property(nonatomic,strong)NSMutableArray *classNameArray;
@property(nonatomic,strong)NSMutableArray *dataArray;

@property(nonatomic,strong)NSMutableArray *statusFrames;

@end

@implementation BaseTableView

-(UITableView*)talbleview{
    
    if (!_tableview) {
        _tableview =[[UITableView alloc]init];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorColor =[UIColor redColor];
        
       
    }
    _tableview.tableFooterView =[UIView new];
    return _tableview;
}

-(instancetype)initWithFrame:(CGRect)frame WithSelctRowBlock:(selectRowBlock)selctrowBlock{
    
    if (self = [super initWithFrame:frame]) {
        //赋值
        self.selectBlock = selctrowBlock;
        self.tableview.hidden =NO;
    }
    
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cellid"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",(long)indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%ld",indexPath.row);
   
    
}

@end
