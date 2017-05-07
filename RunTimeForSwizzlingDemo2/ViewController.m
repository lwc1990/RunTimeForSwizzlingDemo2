//
//  ViewController.m
//  RunTimeForSwizzlingDemo2
//
//  Created by syl on 2017/5/6.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Swizzling.h"
@interface ViewController ()<UIScrollViewDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testCollectionBtn];

    
}
-(void)testCollectionBtn
{
    //通过category+Swizzling的方法 在点击按钮时，收集按钮的一些信息
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [testBtn setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0 - 50,100,100,40)];
    [self.view addSubview:testBtn];
    testBtn.collectionTarget = YES;
    [testBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [testBtn setTitle:@"南瓜" forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)btnClick:(id)sender
{
    NSLog(@"点击了按钮");
}
-(void)viewWillAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
