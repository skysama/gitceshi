//
//  ZHPickViewController.m
//  GZHProject
//
//  Created by gzh on 17/5/15.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "ZHPickViewController.h"
#import "STPickerSingle.h"
#import "STPickerDate.h"
#import "STPickerArea.h"

@interface ZHPickViewController ()<UITextFieldDelegate,STPickerAreaDelegate, STPickerSingleDelegate, STPickerDateDelegate>
@property (retain, nonatomic)  UITextField *textArea;
@property (retain, nonatomic)  UITextField *textSingle;
@property (retain, nonatomic)  UITextField *textDate;
@end

@implementation ZHPickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textArea =[[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 30)];
    [self.view addSubview:self.textArea];

    self.textArea.backgroundColor =[UIColor yellowColor];
    self.textSingle =[[UITextField alloc]initWithFrame:CGRectMake(100, 150, 200, 30)];
    [self.view addSubview:self.textSingle];
    self.textSingle.backgroundColor =[UIColor redColor];
    self.textDate =[[UITextField alloc]initWithFrame:CGRectMake(100, 200, 200, 30)];
    [self.view addSubview:self.textDate];
    self.textDate.backgroundColor =[UIColor greenColor] ;

    
    self.textDate.delegate = self;
    self.textSingle.delegate = self;
    self.textArea.delegate = self;
    
}

#pragma mark - --- delegate 视图委托 ---

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.textArea) {
        [self.textArea resignFirstResponder];
        
        
        STPickerArea *pickerArea = [[STPickerArea alloc]init];
        [pickerArea setDelegate:self];
        [pickerArea setContentMode:STPickerContentModeCenter];
        [pickerArea show];
        
    }
    
    if (textField == self.textSingle) {
        [self.textSingle resignFirstResponder];
        
        NSMutableArray *arrayData = [NSMutableArray array];
        for (int i = 1; i < 1000; i++) {
            NSString *string = [NSString stringWithFormat:@"%d", i];
            [arrayData addObject:string];
        }
        
        STPickerSingle *pickerSingle = [[STPickerSingle alloc]init];
        [pickerSingle setArrayData:arrayData];
        [pickerSingle setTitle:@"请选择价格"];
        [pickerSingle setTitleUnit:@"人民币"];
        [pickerSingle setContentMode:STPickerContentModeCenter];
        [pickerSingle setDelegate:self];
        [pickerSingle show];
    }
    
    
    if (textField == self.textDate) {
        [self.textDate resignFirstResponder];
        
        STPickerDate *pickerDate = [[STPickerDate alloc]init];
        [pickerDate setYearLeast:2000];
        [pickerDate setYearSum:50];
        [pickerDate setDelegate:self];
        [pickerDate show];
    }
    
}

- (void)pickerArea:(STPickerArea *)pickerArea province:(NSString *)province city:(NSString *)city area:(NSString *)area
{
    NSString *text = [NSString stringWithFormat:@"%@ %@ %@", province, city, area];
    self.textArea.text = text;
}

- (void)pickerSingle:(STPickerSingle *)pickerSingle selectedTitle:(NSString *)selectedTitle
{
    NSString *text = [NSString stringWithFormat:@"%@ 人民币", selectedTitle];
    self.textSingle.text = text;
}

- (void)pickerDate:(STPickerDate *)pickerDate year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    NSString *text = [NSString stringWithFormat:@"%zd年%zd月%zd日", year, month, day];
    self.textDate.text = text;
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
