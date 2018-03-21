//
//  view1.h
//  GZHProject
//
//  Created by gzh on 17/5/11.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^selectRowBlock)(UITableView *tableView, NSIndexPath *indexPath, NSArray *dataArray);
@interface view1 : UIView
@property (nonatomic, strong) UITableView                  *tableView;
@property (nonatomic, copy  ) selectRowBlock                selectBlock;

- (instancetype)initWithFrame:(CGRect)frame withSelectRowBlock:(selectRowBlock)selectRowBlock;

@end
