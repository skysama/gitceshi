//
//  BaseTableView.h
//  GZHProject
//
//  Created by gzh on 17/5/1.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^selectRowBlock)(UITableView *tableview ,NSIndexPath *indexPath ,NSArray *dataArray);

@interface BaseTableView : UIView

@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,copy)selectRowBlock selectBlock;

-(instancetype)initWithFrame:(CGRect)frame WithSelctRowBlock:(selectRowBlock)selctrowBlock;


@end
