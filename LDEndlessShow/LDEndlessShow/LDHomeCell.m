//
//  LDHomeCell.m
//  LDEndlessShow
//
//  Created by 李东 on 16/4/2.
//  Copyright © 2016年 XDCodeLee. All rights reserved.
//

#import "LDHomeCell.h"

@implementation LDHomeCell
+ (instancetype)homeCellWithTableView:(UITableView *)tableView
{
    static NSString * ID = @"cell";
    LDHomeCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[LDHomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 1, self.bounds.size.width * 1.5, 1)];
        view.backgroundColor = [UIColor grayColor];
        [self addSubview:view];
    }
    return self;
}
@end
