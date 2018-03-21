//
//  ZHZHseCollectionCell.h
//  GZHProject
//
//  Created by gzh on 17/5/11.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHCellDataAdapter.h"

@class ZHBaseCollectionCell;

@protocol ZHZHseCollectionCellDelegate <NSObject>

- (void)zh_customCollectionCell:(ZHBaseCollectionCell *)cell action:(id)action;

@end
@interface ZHZHseCollectionCell : UICollectionViewCell

@property (nonatomic, weak) id <ZHZHseCollectionCellDelegate>   delegate;
@property (nonatomic, weak) ZHCellDataAdapter                  *dataAdapter;
@property (nonatomic, weak) id                                  data;
@property (nonatomic, weak) NSIndexPath                        *indexPath;
@property (nonatomic, weak) UICollectionView                   *collectionView;
@property (nonatomic, weak) UIViewController                   *controller;
@property (nonatomic      ) BOOL                                displayCell;

- (void)ZH_setupCell;
- (void)ZH_buildSubview;
- (void)ZH_loadContent;
- (void)ZH_selectedEvent;
+ (ZHCellDataAdapter *)ZH_dataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier
                                                        data:(id)data
                                                  cellHeight:(CGFloat)height
                                                        type:(NSInteger)type;



@end
