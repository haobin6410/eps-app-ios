//
//  HBProfileController.m
//  EPS
//
//  Created by 郝斌 on 16/4/9.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import "HBProfileController.h"
#import "UIBarButtonItem+HB.h"
#import "UIImage+HB.h"

@interface HBProfileController ()

@end

@implementation HBProfileController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    UIBarButtonItem *leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"返回" icon:@"back-icon" hightIcon:@"back-icon-selected" target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    self.title = @"个人信息";
}

- (void)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    }
    else if (section == 1){
        return 3;
    }
    else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     static NSString *cellid = @"profile_cell_id";
    
    // 创建cell方法一：
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
//    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
    
    //创建cell方法二：
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellid];
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid forIndexPath:indexPath];
    if(indexPath.section == 0)
    {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
        cell.imageView.image = [UIImage imageWithName:@"default_photo"];
        CGSize itemSize = CGSizeMake(70, 70);
        UIGraphicsBeginImageContext(itemSize);
        CGRect imageRect = CGRectMake(0, 0, itemSize.width, itemSize.height);
        [cell.imageView.image drawInRect:imageRect];
        cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        // 变成圆形头像
        cell.imageView.layer.cornerRadius = 35;
        cell.imageView.layer.masksToBounds = YES;
        cell.textLabel.text = @"郝斌";
        cell.detailTextLabel.text = @"采购部>价格科";
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.frame = CGRectMake(0, 0, cell.frame.size.width, 100);
        return cell;
    }
    else if(indexPath.section == 1)
    {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellid];
        
        if(indexPath.row == 0)
        {
            cell.textLabel.text = @"用户名";
            cell.detailTextLabel.text = @"haobin";
        }
        else if(indexPath.row == 1)
        {
            cell.textLabel.text = @"手机";
            cell.detailTextLabel.text = @"13488657189";
        }
        else if(indexPath.row == 2)
        {
            cell.textLabel.text = @"邮件";
            cell.detailTextLabel.text = @"haobin@1caitong.com";
        }
        return cell;
    }
    else if(indexPath.section == 2)
    {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.textLabel.text = @"退出登录";
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    return cell.frame.size.height;
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
