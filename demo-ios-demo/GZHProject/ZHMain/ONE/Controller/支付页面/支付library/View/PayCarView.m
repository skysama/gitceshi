//
//  PayCarView.m
//  PayInPwdDemo
//
//  Created by gzh on 17/1/11.
//  Copyright © 2017年 IOS-Sun. All rights reserved.
//

#import "PayCarView.h"
#import "PaymentCell.h"

@interface  PayCarView()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, assign) CGFloat interHeight;

@end

@implementation PayCarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/





#pragma mark -

- (NSMutableArray *)rightContents {
    if (!_rightContents) {
        _rightContents = [NSMutableArray array];
        //        _rightContents =[NSMutableArray arrayWithObjects:@"X",@"Y", nil];
    }
    return _rightContents;
}
#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initDefaultData];
        //        [self setNeedsLayout];
    }
    return self;
}
-(NSArray*)leftTitles{
    NSArray  *array=@[@"余额",@"支付宝",@"微信"];
    _leftTitles =array ;
    return _leftTitles;
}
- (void)initDefaultData {
    
    _leftTitles=@[@"x",@"y"];
    //    self.title = @"付款详情";
    self.backgroundColor = [UIColor colorWithWhite:1. alpha:.95];
    self.detailTable.dataSource = self;
    self.detailTable.delegate = self;
}


#pragma mark - tableviewDatesource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.leftTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * payCell = @"payCell";
    
    PaymentCell * cell = [PaymentCell paymentCellWithTableView:tableView reuseIdentifier:payCell];
    
    UILabel * titleLabel = [cell viewWithTag:121];
//    UILabel * detailLabel = [cell viewWithTag:122];
    
    NSString * payMean = self.leftTitles[indexPath.row];
//    if ([payMean isEqualToString:@"付款方式"]) {
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    }
    titleLabel.text = payMean;
    
//    NSString * detailTxt = self.rightContents[indexPath.row];
   
    
//    detailLabel.text = detailTxt;
    
    return cell;
}

#pragma mark - tableviewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    CGFloat maxHeight = self.detailTable.frame.size.height;
//    NSInteger count = self.leftTitles.count;
//    NSInteger cellHeight = maxHeight/count;
//    if (cellHeight > 50) {
//        
//        cellHeight = 50;
//        
//        CGFloat tableHeight = cellHeight * count;
//        
//        CGRect tableFrame = self.detailTable.frame;
//        tableFrame.size.height = tableHeight;
//        self.detailTable.frame = tableFrame;
//        
//        self.interHeight = maxHeight - tableHeight;
    
//        self.changeFrameBlock(self.interHeight);
//    }
    
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * payMean = self.leftTitles[indexPath.row];
//    if ([payMean isEqualToString:@"付款方式"]) {
    
        //        NSArray *array =@[@"X",@"Y"];
   
        self.choosePaycard(payMean);
        
//    }
}




@end
