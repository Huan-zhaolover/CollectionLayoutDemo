//
//  ViewController.m
//  CollectionDmo
//
//  Created by Yutao on 15/12/24.
//  Copyright © 2015年 YTYT. All rights reserved.
//

#import "ViewController.h"
#import "CollectionController.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
     if ([segue.identifier isEqualToString:@"waterflowlauout"]) {
         CollectionController *vc=[segue destinationViewController];
         vc.flag=1;
         
     }
     if ([segue.identifier isEqualToString:@"ciclelayout"]) {
         CollectionController *vc=[segue destinationViewController];
         vc.flag=2;
         
     }
     if ([segue.identifier isEqualToString:@"linelayout"]) {
         CollectionController *vc=[segue destinationViewController];
         vc.flag=3;
         
     }
     if ([segue.identifier isEqualToString:@"stacklayout"]) {
         CollectionController *vc=[segue destinationViewController];
         vc.flag=4;
         
     }
     
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
