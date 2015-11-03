//
//  ViewController.m
//  02_按钮操作
//
//  Created by APPLE on 15/11/3.
//  Copyright (c) 2015年 big nerd ranch. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,weak)  IBOutlet UIButton *iconButton;

typedef enum
{
    top=0,
    right,
    left,
    bottom
}Kdirect;

@end

@implementation ViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}



/*====================================================
- (IBAction)top{
    
   // self.iconButton.frame.origin.y -=20;
   //UIView中的属性frame是个CGRECT结构体，其中包括CGPoint结构体origin和一个CGSIZE的size
    //origin中包含x和y，修改位置可以通过frame.origin.x和frame.origin.y来修改
    //但在OC中不允许直接这么修改，要取出frame，修改完毕后再赋值回去
    
    CGRect frame=self.iconButton.frame;
    frame.origin.y -=20;
    self.iconButton.frame=frame;
}


- (IBAction)right{
    
    CGRect frame=self.iconButton.frame;
    frame.origin.x +=20;
    self.iconButton.frame=frame;
}

- (IBAction)bottom{
    
    CGRect frame=self.iconButton.frame;
    frame.origin.y +=20;
    self.iconButton.frame=frame;
}

- (IBAction)left
 {
    
    CGRect frame=self.iconButton.frame;
    frame.origin.x -=20;
    self.iconButton.frame=frame;
}
*/

//=================代码优化


-(IBAction)Move:(UIButton *)button
{
    CGRect frame=self.iconButton.frame;
    
    switch (button.tag) {
        case top:
            frame.origin.y -=20;
            break;
        case right:
            frame.origin.x +=20;
            break;
        case left:
            frame.origin.x -=20;
            break;
        case bottom:
            frame.origin.y +=20;
            break;

    }
    
    self.iconButton.frame=frame;

}



@end
