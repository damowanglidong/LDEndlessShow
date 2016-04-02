//
//  LDSecondViewController.m
//  演示dynamic动画
//
//  Created by 李东 on 16/4/1.
//  Copyright © 2016年 XDCodeLee. All rights reserved.
//

#import "LDSecondViewController.h"
#import "UIView+Animation.h"
#import "LDAnimationView.h"

@interface LDSecondViewController () <UICollisionBehaviorDelegate, LDAnimationViewDelegate>

@property (nonatomic, strong) UIDynamicAnimator * animator;

@property (nonatomic, strong) UIGravityBehavior * gravity;

@property (nonatomic, strong) UIView * redView;

@property (nonatomic, strong) UICollisionBehavior * collBehavior;

@property (nonatomic, strong) NSMutableArray * arrayM;
@end

@implementation LDSecondViewController

- (UIGravityBehavior *)gravity {
    if (_gravity == nil) {
        _gravity = [[UIGravityBehavior alloc] initWithItems:@[self.redView]];
    }
 return _gravity;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.typeName;
    NSString * img1 = @"view01";
    NSString * img2 = @"view02";
    NSString * img3 = @"view03";
    NSString * img4 = @"view04";
    NSString * img5 = @"view05";
    NSString * img6 = @"view06";
    self.arrayM = [[NSMutableArray alloc] initWithObjects:img1, img2, img3, img4, img5, img6, nil];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.redView = [UIView endlessAnimationWithRect:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 265, self.view.bounds.size.width, 200) withArray:self.arrayM.copy target:self animationTypeName:self.typeName];
    [self.view addSubview: self.redView];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.gravity.magnitude = -0.5;
    [self.animator addBehavior:self.gravity];
    self.collBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.redView]];
    self.collBehavior.translatesReferenceBoundsIntoBoundary = YES;
    self.collBehavior.collisionDelegate = self;
    [self.collBehavior setTranslatesReferenceBoundsIntoBoundaryWithInsets:UIEdgeInsetsMake(64, 0, 0, 0)];
    self.collBehavior.collisionMode = UICollisionBehaviorModeEverything;
    [self.animator addBehavior:self.collBehavior];

}

- (void)collisionBehavior:(UICollisionBehavior*)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier
{
    
        self.tableView.tableHeaderView = self.redView;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    if (cell == nil) {
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
