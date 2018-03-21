//
//  ZHCellDataAdapter.h
//  GZHProject
//
//  Created by gzh on 17/5/11.
//  Copyright © 2017年 gzh. All rights reserved.
//  适配celldata

#import <Foundation/Foundation.h>

@interface ZHCellDataAdapter : NSObject

@property(nonatomic,weak)UITableView *tableView;

@property(nonatomic,weak)UICollectionView *collectionView;


@property(nonatomic,weak)NSIndexPath *indexPath;


@property(nonatomic,strong) NSString *cellReuseridentifier;


@property(nonatomic,strong)id data;


@property(nonatomic,assign)CGFloat cellHeight;

@property(nonatomic,assign)NSInteger cellType;
/*
 tableView
 */
+(ZHCellDataAdapter*)zh_cellDataAdapterWithReuserIdentifier:(NSString*)cellReuserIdentifiers data:(id)data cellHeight:(CGFloat)cellHeight cellType:(NSInteger)cellType;

+(ZHCellDataAdapter*)zh_CollectionCellDataAdaperWithReuserIdentifier:(NSString*)cellReuserIdentifier data:(id)data  cellType:(NSInteger)cellType;





@end
