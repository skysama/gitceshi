//
//  ZHConverListViewController.m
//  GZHProject
//
//  Created by gzh on 2018/1/16.
//  Copyright © 2018年 gzh. All rights reserved.
//

#import "ZHConverListViewController.h"
#import "ZHChatViewController.h"
@interface ZHConverListViewController ()

@end

@implementation ZHConverListViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.hidesBottomBarWhenPushed = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    设置要显示哪些类型的会话
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                        @(ConversationType_DISCUSSION),
                                        @(ConversationType_CHATROOM),
                                        @(ConversationType_GROUP),
                                        @(ConversationType_APPSERVICE),
                                        @(ConversationType_SYSTEM)]];
    
        //设置需要将哪些类型的会话在会话列表中聚合显示
    [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),
                                          @(ConversationType_GROUP)]];
    
}
//点击tableviewcell的方法
-(void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath{
    
//   聚合显示指的是此类型所有会话，在会话列表中聚合显示成一条消息，点击进去会显示此类型的具体会话列表。
    if (conversationModelType == RC_CONVERSATION_MODEL_TYPE_COLLECTION) {
        ZHChatViewController *textVC = [[ZHChatViewController alloc]init];
//        textVC.isEnteredToCollectionViewController = YES;
        NSArray *array = [NSArray arrayWithObject:[NSNumber numberWithInt:model.conversationModelType]];
        [textVC setDisplayConversationTypeArray:array];
//        [textVC setCollectionConversationType:nil];
        [self.navigationController pushViewController:textVC animated:YES];
        
    }else if (conversationModelType == RC_CONVERSATION_MODEL_TYPE_NORMAL){
        ZHChatViewController *conversationVC = [[ZHChatViewController alloc]init];
        conversationVC.conversationType = model.conversationType;
            //设置是否显示昵称
        conversationVC.displayUserNameInCell = NO;
        conversationVC.targetId = model.targetId;
        conversationVC.title = model.conversationTitle;
        [self.navigationController pushViewController:conversationVC animated:YES];
    }
    
    
    
    
//    ZHChatViewController *conversationVC = [[ZHChatViewController alloc]init];
//    conversationVC.conversationType = model.conversationType;
//    conversationVC.targetId = model.targetId;
//    conversationVC.title = @"想显示的会话标题";
//    [self.navigationController pushViewController:conversationVC animated:YES];
    
}

- (void)willDisplayConversationTableCell:(RCConversationBaseCell *)cell
                             atIndexPath:(NSIndexPath *)indexPath{
    RCConversationCell *cell1 = (RCConversationCell *)cell;
    cell1.conversationTitle.textColor = [UIColor redColor];
    cell1.portraitStyle = RC_USER_AVATAR_CYCLE;
    RCConversationModel *model=
    self.conversationListDataSource[indexPath.row];
    if (model.conversationType == ConversationType_PRIVATE || model.conversationType == ConversationType_PUSHSERVICE  || model.conversationType == ConversationType_SYSTEM) {
        ((RCConversationCell *)cell).isShowNotificationNumber = YES;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
