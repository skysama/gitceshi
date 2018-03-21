//
//  ZHCellDataAdapter.m
//  GZHProject
//
//  Created by gzh on 17/5/11.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "ZHCellDataAdapter.h"

@implementation ZHCellDataAdapter


+(ZHCellDataAdapter*)zh_cellDataAdapterWithReuserIdentifier:(NSString *)cellReuserIdentifiers data:(id)data cellHeight:(CGFloat)cellHeight cellType:(NSInteger)cellType{
    
    ZHCellDataAdapter *dataAdapter =[[self class] new];
    dataAdapter.cellReuseridentifier = cellReuserIdentifiers;
    dataAdapter.data = data;
    dataAdapter.cellHeight = cellHeight;
    dataAdapter.cellType = cellType;
    
    return dataAdapter;
    
}

+(ZHCellDataAdapter*)zh_CollectionCellDataAdaperWithReuserIdentifier:(NSString *)cellReuserIdentifier data:(id)data cellType:(NSInteger)cellType{
    ZHCellDataAdapter *dataAdapter = [[self class]new];
    dataAdapter.cellReuseridentifier = cellReuserIdentifier;
    dataAdapter.data = data;
    dataAdapter.cellType = cellType;
    
    
    return dataAdapter;
    
    
}



@end
