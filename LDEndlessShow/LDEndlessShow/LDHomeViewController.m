//
//  LDHomeViewController.m
//  LDEndlessShow
//
//  Created by 李东 on 16/4/1.
//  Copyright © 2016年 XDCodeLee. All rights reserved.
//

#import "LDHomeViewController.h"
#import "LDHeaderViewController.h"
#import "LDSecondViewController.h"

@interface LDHomeViewController ()

@property (nonatomic, strong) NSArray * animationNames;
@end

@implementation LDHomeViewController

- (NSArray *)animationNames
{
    if (_animationNames == nil)
    {
        _animationNames = @[@"普通无限轮播", @"cube", @"pageCurl", @"pageUnCurl", @"fade", @"push", @"moveIn", @"reveal", @"oglFlip", @"suckEffect", @"rippleEffect", @"cameralrisHollowOpen", @"cameralrisHollowClose"];
    }
    return _animationNames;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithTitle:@"动画开启" style:UIBarButtonItemStylePlain target:self action:@selector(didClickLeftBtn)];
    self.navigationItem.rightBarButtonItem = leftItem;
    
    self.tableView.rowHeight = 44;
}

- (void)didClickLeftBtn
{
    if ([self.navigationItem.rightBarButtonItem.title isEqualToString:@"动画开启"]) {
        self.navigationItem.rightBarButtonItem.title = @"动画关闭";
    }else{
        self.navigationItem.rightBarButtonItem.title = @"动画开启";
    }    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.animationNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]  initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    NSDate *object = self.animationNames[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSIndexPath * idxPath = [tableView indexPathForSelectedRow];
    if (idxPath.row == 0)
    {
        LDHeaderViewController * headerViewVc = [[LDHeaderViewController alloc] init];
        headerViewVc.typeName = nil;
        [self.navigationController pushViewController:headerViewVc animated:YES];
    }else
    {
        NSString * typeName = self.animationNames[indexPath.row];
        if ([self.navigationItem.rightBarButtonItem.title isEqualToString:@"动画开启"])
        {
            LDSecondViewController * animationViewVc = [[LDSecondViewController alloc] init];
            animationViewVc.typeName = typeName;
            [self.navigationController pushViewController:animationViewVc animated:YES];
        }else
        {
            LDHeaderViewController * headerViewVc = [[LDHeaderViewController alloc] init];
            headerViewVc.typeName = typeName;
            [self.navigationController pushViewController:headerViewVc animated:YES];
        
        }
        
    
    }

}

@end
