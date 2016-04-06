//
//  LDHeaderViewController.m
//  LDEndlessShow
//
//  Created by 李东 on 16/3/31.
//  Copyright © 2016年 XDCodeLee. All rights reserved.
//

#import "LDHeaderViewController.h"
#import "LDHeaderView.h"
#import "UIView+endlessShow.h"
#import "UIView+Animation.h"
#import "LDAnimationView.h"

@interface LDHeaderViewController () <LDHeaderViewDelegate, LDAnimationViewDelegate>

@property (nonatomic, strong) UIView * redView;
@end

@implementation LDHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"无限轮播框架";    
    NSString * img1 = @"view01";
    NSString * img2 = @"view02";
    NSString * img3 = @"view03";
    NSString * img4 = @"view04";
    NSString * img5 = @"view05";
    NSString * img6 = @"view06";
    NSMutableArray * array = [[NSMutableArray alloc] initWithObjects:img1, img2, img3, img4, img5, img6, nil];
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    //传入代理即可实现点击事件
    if (self.typeName == nil)
    {
        self.tableView.tableHeaderView = [UIView endlessWithframe:CGRectMake(0, 0, self.view.bounds.size.width, 200) withImageArray:array withTarget:self];
    }else
    {
        self.tableView.tableHeaderView = [UIView endlessAnimationWithRect:CGRectMake(0, 0, self.view.bounds.size.width, 200) withArray:array target:self animationTypeName:self.typeName];
    }
    
}
#pragma mark - headerView delegate
- (void)headerView:(LDHeaderView *)headerView didSeletedAtIndex:(NSInteger)index withImages:(NSArray *)imgs
{
    NSString * message = [NSString stringWithFormat:@"您点击了第%zd张图片",index];
    UIAlertController * alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertVc addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil]];
    [alertVc addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertVc animated:YES completion:nil];
}
#pragma mark - animation delegate
- (void)animationView:(LDAnimationView *)animationView didSeletedAtIndex:(NSInteger)index
{
    NSString * message = [NSString stringWithFormat:@"您点击了第%zd张图片",index];
    UIAlertController * alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertVc addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil]];
    [alertVc addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertVc animated:YES completion:nil];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    cell.textLabel.text = [NSString stringWithFormat:@"演示%zd",indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
