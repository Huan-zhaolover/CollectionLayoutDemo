//
//  SecondViewController.m
//  PrensntationDemo
//
//  Created by Yutao on 15/12/25.
//  Copyright © 2015年 YTYT. All rights reserved.
//

#import "SecondViewController.h"
#import "YTTransitioningDelegate.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self==[super initWithCoder:aDecoder]) {
        self.modalPresentationStyle=UIModalPresentationCustom;
        self.transitioningDelegate=[YTTransitioningDelegate shareTanstation];
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)didclckBackButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
