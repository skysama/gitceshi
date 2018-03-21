//
//  ZHImageController.m
//  GZHProject
//
//  Created by gzh on 17/5/15.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "ZHImageController.h"
#import "BDImagePicker.h"
#import "SJAvatarBrowser.h"
#import <TZImageManager.h>
#import <TZVideoPlayerController.h>
@interface ZHImageController ()

@end

@implementation ZHImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *textImageBtn =[[UIButton alloc]initWithFrame:CGRectMake(100, 200, 80, 80)];
//    [textImageBtn setTitle:@"获取相册" forState:UIControlStateNormal];
    [textImageBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [textImageBtn setBackgroundColor: [UIColor yellowColor]];
    textImageBtn.clipsToBounds =YES;
    textImageBtn.layer.cornerRadius = 5;
    [self.view addSubview:textImageBtn];
    
    
    UIButton *headerChangeBtn =[[UIButton alloc]initWithFrame:CGRectMake(100, 300, 80, 30)];
    [headerChangeBtn setTitle:@"更换头像" forState:UIControlStateNormal];
    [headerChangeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [headerChangeBtn setBackgroundColor: [UIColor greenColor]];
    headerChangeBtn.clipsToBounds =YES;
    headerChangeBtn.layer.cornerRadius = 5;
    [self.view addSubview:headerChangeBtn];
    
    
    
    [[textImageBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(UIButton *textimgebtn) {
        if (textImageBtn.imageView.image) {
              [SJAvatarBrowser  showImage:textImageBtn.imageView];
        }
        
      
        
        
    }];
    
//    修改头像 
    [[headerChangeBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(UIButton *button) {
        
        [BDImagePicker  showImagePickerFromViewController:self allowsEditing:YES finishAction:^(UIImage *image) {
            
            if (image) {
                [textImageBtn setImage:image forState:UIControlStateNormal];
            }
            
        }];
        
        
    }];
    
    
    
    
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
