//
//  LDHomeViewController.m
//  LDEndlessShow
//
//  Created by 李东 on 16/4/1.
//  Copyright © 2016年 XDCodeLee. All rights reserved.
//

#import "LDHomeViewController.h"
#import "LDHeaderViewController.h"

@interface LDHomeViewController ()

@end

@implementation LDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]  initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = @"无限轮播演示";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    LDHeaderViewController * headerViewVc = [[LDHeaderViewController alloc] init];
    [self.navigationController pushViewController:headerViewVc animated:YES];

}

@end
