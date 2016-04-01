//
//  LDHeaderViewController.m
//  LDEndlessShow
//
//  Created by 李东 on 16/3/31.
//  Copyright © 2016年 XDCodeLee. All rights reserved.
//

#import "LDHeaderViewController.h"
#import "LDHeaderView.h"

@interface LDHeaderViewController () <LDHeaderViewDelegate>

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
    self.automaticallyAdjustsScrollViewInsets = NO;
    LDHeaderView * headerView = [[LDHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 250) withImagesArray:array];
    headerView.delegate = self;
    self.tableView.tableHeaderView = headerView;
}
//实现headerView的代理方法
- (void)headerView:(LDHeaderView *)headerView didSeletedAtIndex:(NSInteger)index withImages:(NSArray *)imgs
{
    NSLog(@"点击了第几张图片%zd",index);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
