//
//  ZHBaseCell.h
//  GZHProject
//
//  Created by gzh on 17/5/11.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZHCellDataAdapter.h"
@class  ZHBaseCell;
@protocol ZHBaseCellDelegate <NSObject>

@optional

-(void)zh_customCell:(ZHBaseCell*)cell action:(id)action;

@end

@interface ZHBaseCell : UITableViewCell

@property(nonatomic,weak)id <ZHBaseCellDelegate> delegate;
@property(nonatomic,weak)ZHCellDataAdapter *dataAdapter;
@property (nonatomic, weak) id                        data;
@property (nonatomic, weak) NSIndexPath              *indexPath;
@property (nonatomic, weak) UITableView              *tableView;
@property (nonatomic, weak) UIViewController         *controller;
@property (nonatomic      ) BOOL                      displayCell;

- (void)zh_setupCell;

- (void)zh_buildSubview;

- (void)zh_loadContent;

+ (ZHCellDataAdapter *)ba_dataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier
                                                        data:(id)data
                                                  cellHeight:(CGFloat)height
                                                        type:(NSInteger)type;

- (void)zh_setWeakReferenceWithCellDataAdapter:(ZHCellDataAdapter *)dataAdapter
                                          data:(id)data
                                     indexPath:(NSIndexPath *)indexPath
                                     tableView:(UITableView *)tableView;

- (void)zh_selectedEvent;

- (void)zh_updateWithNewCellHeight:(CGFloat)height
                          animated:(BOOL)animated;





@end
