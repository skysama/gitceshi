//
//  ZHBaseCell.m
//  GZHProject
//
//  Created by gzh on 17/5/11.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "ZHBaseCell.h"



@implementation ZHBaseCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self zh_setupCell];
        
        [self zh_buildSubview];
    }
    
    return self;

    
}
- (void)zh_setupCell
{
    
}

- (void)zh_buildSubview
{
    
}

- (void)zh_loadContent
{
    
}

- (void)zh_selectedEvent
{
    
}

+ (ZHCellDataAdapter *)zh_dataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier
                                                        data:(id)data
                                                  cellHeight:(CGFloat)height
                                                        type:(NSInteger)type
{
    NSString *tmpReuseIdentifier = reuseIdentifier.length <= 0? NSStringFromClass([self class]) : reuseIdentifier;
    return [ZHCellDataAdapter zh_cellDataAdapterWithReuserIdentifier:tmpReuseIdentifier data:data cellHeight:height cellType:type];
}

- (void)zh_setWeakReferenceWithCellDataAdapter:(ZHCellDataAdapter *)dataAdapter
                                          data:(id)data
                                     indexPath:(NSIndexPath *)indexPath
                                     tableView:(UITableView *)tableView
{
    _dataAdapter = dataAdapter;
    _data        = data;
    _indexPath   = indexPath;
    _tableView   = tableView;
}

- (void)ba_updateWithNewCellHeight:(CGFloat)height
                          animated:(BOOL)animated
{
    if (self.tableView && self.dataAdapter)
    {
        if (animated)
        {
            self.dataAdapter.cellHeight = height;
            [self.tableView beginUpdates];
            [self.tableView endUpdates];
            
        }
        else
        {
            self.dataAdapter.cellHeight = height;
            [self.tableView reloadData];
        }
        
    }
    
}



@end
