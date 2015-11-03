//
//  ViewController.m
//  01_加法计算器
//
//  Created by APPLE on 15/11/3.
//  Copyright (c) 2015年 big nerd ranch. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *AddNum1;
@property (weak, nonatomic) IBOutlet UITextField *AddNum2;
@property (weak, nonatomic) IBOutlet UILabel *SumNum;

@end

@implementation ViewController

-(IBAction)compute{

    //获取两个文本框中的string
    NSString *num1=self.AddNum1.text;
    NSString *num2=self.AddNum2.text;
    
    
    //intvalue转化为int型，两数字相加
    int sum=num1.intValue+num2.intValue;
    
    //相加后的int转化为string，赋值给label.text
    self.SumNum.text=[NSString stringWithFormat:@"%d",sum];
    
//    //关闭两个文本框的响应
//    [self.AddNum1 resignFirstResponder];
//    [self.AddNum2 resignFirstResponder];
//
    //用视图去关闭所有键盘
    [self.view endEditing:YES];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
