//
//  ZHZHseCollectionCell.m
//  GZHProject
//
//  Created by gzh on 17/5/11.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "ZHBaseCollectionCell.h"

@implementation ZHZHseCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self ZH_setupCell];
        
        [self ZH_buildSubview];
    }
    
    return self;
}

- (void)ZH_setupCell
{
    
}

- (void)ZH_buildSubview
{
    
}

- (void)ZH_loadContent
{
    
}

- (void)ZH_selectedEvent
{
    
}

+ (ZHCellDataAdapter *)ZH_dataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier
                                                        data:(id)data
                                                  cellHeight:(CGFloat)height
                                                        type:(NSInteger)type
{
    return [ZHCellDataAdapter zh_CollectionCellDataAdaperWithReuserIdentifier:reuseIdentifier data:data cellType:type];
}


@end
