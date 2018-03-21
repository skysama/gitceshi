//
//  ZHLoginViewController.m
//  GZHProject
//
//  Created by gzh on 17/5/11.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "ZHLoginViewController.h"

@interface ZHLoginViewController ()

@end

@implementation ZHLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self initview];
}
-(void)initview{
    for (int i = 0; i<4; i++) {
        UIButton *loginstyleBtn =[[UIButton alloc]initWithFrame:CGRectMake(40+(WIDTH-40)/4*i, HEIGHT-150, 60, 60)];
        loginstyleBtn.layer.cornerRadius =30;
        loginstyleBtn.clipsToBounds = YES;
        [self.view addSubview:loginstyleBtn];
        loginstyleBtn.tag =i+100;
        switch (loginstyleBtn.tag) {
            case 100:
            {
                [loginstyleBtn setImage:[UIImage imageNamed:@"dengluye_qq"] forState:UIControlStateNormal];
            }
                break;
            case 101:{
                [loginstyleBtn setImage:[UIImage imageNamed:@"dengluye_weibo"] forState:UIControlStateNormal];
                
            }
                break;
            case 102:{
                [loginstyleBtn setImage:[UIImage imageNamed:@"dengluye_weixin"] forState:UIControlStateNormal];
            }
                break;
            case 103:{
                [loginstyleBtn setImage:[UIImage imageNamed:@"dengluye_shouji"] forState:UIControlStateNormal];
            }
                break;
            default:
                break;
        }
        
//        MU_WeakSelf;
        [[loginstyleBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(UIButton *button) {
            NSLog(@"%@,%ld",button,(long)button.tag);
            switch (button.tag) {
                case 100:
                {
                    [self qqLogin];
                }
                    break;
                case 101:
                {
                    [self weiBoLogin];
                }
                    break;
                case 102:{
                    [self weiXinLogin];
                }
                    break;
                case 103:{
//                    [weakSelf.navigationController pushViewController:phonevc animated:YES];
                }
                    break;
                default:
                    break;
            }
            
        }];
    }
    
    
    
}


-(void)qqLogin
{
    
    
    
//    
//    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_QQ currentViewController:nil completion:^(id result, NSError *error) {
//        if (error) {
//            
//        } else {
//            NSLog(@"-------%@",result);
//            UMSocialUserInfoResponse *resp = result;
//            
//            // 授权信息
//            NSLog(@"QQ uid: %@", resp.uid);
//            NSLog(@"QQ openid: %@", resp.openid);
//            NSLog(@"QQ accessToken: %@", resp.accessToken);
//            NSLog(@"QQ expiration: %@", resp.expiration);
//            
//            // 用户信息
//            NSLog(@"QQ name: %@", resp.name);
//            NSLog(@"QQ iconurl: %@", resp.iconurl);
//            NSLog(@"QQ gender: %@", resp.gender);
//            
//            // 第三方平台SDK源数据
//            NSLog(@"QQ originalResponse: %@", resp.originalResponse);
//            int sex;
//            if ([resp.gender isEqualToString:@"男"]) {
//                sex = 1;
//            }else{
//                sex = 0;
//            }
//            
//            [self thirdLoginWithToken:@"" withSex:[NSString stringWithFormat:@"%d",sex] withPlatform:@"qq" withOpenid:resp.openid withNickname:resp.name withHeadImage:resp.iconurl withUnionid:@"" withAccess_token:resp.accessToken];
//        }
//    }];
    
}
-(void)weiBoLogin
{
//    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_Sina currentViewController:nil completion:^(id result, NSError *error) {
//        if (error) {
//            
//        } else {
//            UMSocialUserInfoResponse *resp = result;
//            
//            // 授权信息
//            NSLog(@"Sina uid: %@", resp.uid);
//            NSLog(@"Sina accessToken: %@", resp.accessToken);
//            NSLog(@"Sina refreshToken: %@", resp.refreshToken);
//            NSLog(@"Sina expiration: %@", resp.expiration);
//            
//            // 用户信息
//            NSLog(@"Sina name: %@", resp.name);
//            NSLog(@"Sina iconurl: %@", resp.iconurl);
//            NSLog(@"Sina gender: %@", resp.gender);
//            
//            // 第三方平台SDK源数据
//            NSLog(@"Sina originalResponse: %@", resp.originalResponse);
//            int sex;
//            if ([resp.gender isEqualToString:@"男"]) {
//                sex = 1;
//            }else{
//                sex = 0;
//            }
//            
//            [self thirdLoginWithToken:@"" withSex:[NSString stringWithFormat:@"%d",sex] withPlatform:@"sina" withOpenid:resp.uid withNickname:resp.name withHeadImage:resp.iconurl withUnionid:@"" withAccess_token:resp.accessToken];
//        }
//    }];
    
    
    
}
-(void)weiXinLogin
{
//    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_WechatSession currentViewController:nil completion:^(id result, NSError *error) {
//        if (error) {
//            NSLog(@"1231231231231----");
//        } else {
//            UMSocialUserInfoResponse *resp = result;
//            
//            // 授权信息
//            NSLog(@"Wechat uid: %@", resp.uid);
//            NSLog(@"Wechat openid: %@", resp.openid);
//            NSLog(@"Wechat accessToken: %@", resp.accessToken);
//            NSLog(@"Wechat refreshToken: %@", resp.refreshToken);
//            NSLog(@"Wechat expiration: %@", resp.expiration);
//            
//            // 用户信息
//            NSLog(@"Wechat name: %@", resp.name);
//            NSLog(@"Wechat iconurl: %@", resp.iconurl);
//            NSLog(@"Wechat gender: %@", resp.gender);
//            
//            // 第三方平台SDK源数据
//            NSLog(@"Wechat originalResponse-----+++++++: %@", resp.originalResponse);
//            int sex;
//            if ([resp.gender isEqualToString:@"男"]) {
//                sex = 1;
//            }else{
//                sex = 0;
//            }
//            
//            [self thirdLoginWithToken:@"" withSex:[NSString stringWithFormat:@"%d",sex] withPlatform:@"wechat" withOpenid:resp.openid withNickname:resp.name withHeadImage:resp.iconurl withUnionid:[resp.originalResponse objectForKey:@"unionid"] withAccess_token:resp.accessToken];
//        }
//    }];
    
    
}

-(void)thirdLoginWithToken:(NSString *)token withSex:(NSString *)sex withPlatform:(NSString *)platfrom withOpenid:(NSString *)openid withNickname:(NSString *)nickname withHeadImage:(NSString *)headerImage withUnionid:(NSString *)unionid withAccess_token:(NSString *)access_token
{
    NSDictionary *dic = @{@"act":@"login_third",@"token":token,@"platform":platfrom,@"openid":openid,@"nickname":nickname,@"head_images":headerImage,@"unionid":unionid,@"access_token":access_token,@"sex":sex};
//    MyLog(@"%@",dic);
//    MU_WeakSelf;
//    [[BDRequestHttpController manager] postRequestURL:@"login.php" withParameters:dic withComplete:^(id data) {
//        MyLog(@"------%@",data);
//        if ([[data objectForKey:@"code"]intValue]==200) {
//            NSString *UidStr=[[data objectForKey:@"data"]objectForKey:@"uid"];
//            [[NSUserDefaults standardUserDefaults]setObject:UidStr forKey:@"UID"];
    
//            MainViewController *homeVc = [[MainViewController alloc] init];
//            SlideNavigationController *homeNav =[[SlideNavigationController alloc]initWithRootViewController:homeVc];
//            
//            weakSelf.view.window.rootViewController=homeNav;
//            
//            
//            LeftViewController *leftVC =[[LeftViewController alloc]init];
//            leftVC.view.backgroundColor =[UIColor whiteColor];
//            
//            [SlideNavigationController sharedInstance].leftMenu =leftVC;
//            
//            
//            [SlideNavigationController sharedInstance].menuRevealAnimationDuration=.20;
//            //
//            [weakSelf.view.window makeKeyAndVisible];
//        }
//    }];
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
