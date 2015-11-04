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

//加载完成后被调用，重写该代码
-(void)viewDidLoad
{
    [super viewDidLoad];    //重写该代码必须调用父类的该方法
    
    
    //========================使用代码创建按钮1
    //使用alloc init初始化的按钮，就是custom类型的，一旦被指定，不能修改其类型
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 150, 100, 100)];
    
    //如果创建其他类型的按钮
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:btn1];
    btn1.center=CGPointMake(10, 20);    //改变center的位置
    
    //将btn赋给属性Iconbutton
    self.iconButton=btn;
    
    //设置背景颜色
    btn.backgroundColor=[UIColor redColor];
    
    //设置背景图片
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_01"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_02"] forState:UIControlStateHighlighted];
    
    //设置按钮文字
    [btn setTitle:@"点我啊" forState:UIControlStateNormal];
    [btn setTitle:@"摸我干啥" forState:UIControlStateHighlighted];
    
    //设置文字颜色
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    //将button加到界面上
    [self.view addSubview:btn];

}







#pragma mark-操作

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}



/*========================位移1（上下左右的代码）
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

//=================位移2（利用控件的tag属性和switch进行代码优化）



//-(IBAction)Move:(UIButton *)button
//{
//    CGRect frame=self.iconButton.frame;
//    
//    switch (button.tag) {
//        case top:
//            frame.origin.y -=20;
//            break;
//        case right:
//            frame.origin.x +=20;
//            break;
//        case left:
//            frame.origin.x -=20;
//            break;
//        case bottom:
//            frame.origin.y +=20;
//            break;
//
//    }
//    
//    self.iconButton.frame=frame;
//
//}

//farame属性，通常用于实例化控件，指定初始位置（因为Xcode的自动布局功能）

//-如果需要改变控件位置，可以使用center属性
//-如果需要改变控件大小，可以使用bounds属性

//=====利用center位移

-(IBAction)Move:(UIButton *)button
{
    CGPoint center=self.iconButton.center;

    switch (button.tag) {
        case top:
            center.y -=20;
            break;
        case right:
            center.x +=20;
            break;
        case left:
            center.x -=20;
            break;
        case bottom:
            center.y +=20;
            break;

    }

    self.iconButton.center=center;

}



//=================位移的代码优化2（利用控件的transform属性和Transform方法进行位移）
/*

- (IBAction)Move:(UIButton *)button
{

    //CGAffineTransform为系统定义的一个结构体.定义了四个CGFloat a,b,c,d和两个偏移量CGfloat tx和CGFloat ty，UIView中包含了transform这个属性

    //1、将需要偏移的量存在CGAffineTransform类型的变量中
    //此方法非实例方法或者类方法。y轴偏离-100，x不变
    //2、将此偏移量赋值给目标frame
   // self.iconButton.transform = CGAffineTransformMakeTranslation(0, -100);
    //CGAffineTransformMakeTranslation只会针对原有位置进行改变，多次执行无效
    CGFloat xDelta,yDelta;
    
    //如果按钮是上下键，则x偏移量不变，y改变
    if (button.tag==0||button.tag==2) {
        yDelta=(button.tag==0)?-20:20;
        //如果tag是0，上键，y偏移-20，否则便偏移20
    }
    
    if (button.tag==1||button.tag==3) {
        xDelta=(button.tag==3)?-20:20;
        //如果tag是3，左键，x偏移-20，否则便偏移20
    }
    
    //修改icon的transform
    //CGAffineTransformTranslate可以以原来的transform为原点，多次变换位置
    self.iconButton.transform=CGAffineTransformTranslate(self.iconButton.transform, xDelta, yDelta);
}
*/



//=================放大缩小1（使用控件的bounds属性进行放大缩小）

//-(IBAction)Zoom:(UIButton *)buttton
//{
//    
//    //与操作frame方法类似，只不过改变了bounds.size.width和height
//    CGRect bounds=self.iconButton.bounds;
//    if (buttton.tag) {
//        bounds.size.width +=20;
//        bounds.size.height +=20;
//    }
//    else
//    {
//        bounds.size.width -=20;
//        bounds.size.height -=20;
//    }
//    
//    //开始一个动画
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1.0];  //设置动画时长
//    
//    self.iconButton.bounds=bounds;
//    
//    [UIView commitAnimations];
//}

//=================放大缩小2（使用控件的transform属性和Transform方法进行放大缩小）

-(IBAction)Zoom:(UIButton *)buttton
{
    //如果button的tag为4，即加号，则scale放大为1.2
    CGFloat scale=(buttton.tag==4)?1.2:0.8;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    self.iconButton.transform=CGAffineTransformScale(self.iconButton.transform, scale, scale);
    //后面两个参数是x与y放大的比例
    
    NSLog(@"%@",NSStringFromCGAffineTransform(self.iconButton.transform));
    
    [UIView commitAnimations];
}

- (IBAction)Rotate:(UIButton *)button {
    
    //在OC开发中，角度一律使用弧度制，逆时针是负值
    //180度=M_PI
    CGFloat angle=(button.tag==1)? M_PI_4:- M_PI_4;//向右旋转转正45度，向左转负45
    self.iconButton.transform=CGAffineTransformRotate(self.iconButton.transform, angle);
}




@end
