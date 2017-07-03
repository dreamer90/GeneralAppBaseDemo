//
//  LVJTableViewProtocol.m
//  LJ_Patient
//
//  Created by hyfsoft on 2017/6/30.
//  Copyright © 2017年 LvJing. All rights reserved.
//

#import "LVJTableViewProtocol.h"

@implementation LVJTableViewProtocol

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return CGFLOAT_MIN;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [[UIView alloc] init];
}

#pragma mark - scrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if ([self.delegate respondsToSelector:@selector(scrollViewDidChangeScroll:)]) {
        [self.delegate scrollViewDidChangeScroll:scrollView];
    }
}

@end
