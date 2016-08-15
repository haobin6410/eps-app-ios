//
//  HBPlanAuditController.m
//  EPS
//
//  Created by 郝斌 on 16/4/11.
//  Copyright © 2016年 hainx. All rights reserved.
//

#import "HBPlanAuditController.h"
#import "UIBarButtonItem+HB.h"
#import "HBHttp.h"
#import <MJRefresh.h>
#import <MJExtension.h>
#import "HBShow.h"
#import "HBPlanAuditCell.h"
#import "HBPlanModel.h"
#import <UIView+SDAutoLayout.h>
#import <UITableView+SDAutoTableViewCellHeight.h>

@interface HBPlanAuditController () <HBPlanAuditCellDelegate, UISearchBarDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, assign) long maxDate;

@property (nonatomic, assign) int page;

@property (nonatomic, weak) UISearchBar *seachBar;

@end

@implementation HBPlanAuditController

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)loadNewData
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    self.maxDate = (long)[[NSDate date] timeIntervalSince1970];
    self.page = 1;
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"page"] = @(self.page);
    parameters[@"max_date"] = @(self.maxDate);
    parameters[@"material_desc"] = self.seachBar.text;
    
    [HBHttp GET:@"/api/plan/planaudit/" parameters:parameters success:^(id responseObject) {
        NSArray *objects = [HBPlanModel mj_objectArrayWithKeyValuesArray:responseObject];
//        NSRange range = NSMakeRange(0,  objects.count);
//        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
//        [self.dataArray insertObjects:objects atIndexes:indexSet];

        self.dataArray = [NSMutableArray array];
        [self.dataArray addObjectsFromArray:objects];
        
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer resetNoMoreData];
        
        [HBShow hide];
    } failure:^(NSError *error) {
        [HBShow showFailure:[NSString stringWithFormat:@"%@", error]];
    }];
}

- (void)loadMoreData
{
    self.page += 1;
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"page"] = @(self.page);
    parameters[@"max_date"] = @(self.maxDate);
    parameters[@"material_desc"] = self.seachBar.text;
    
    [HBHttp GET:@"/api/plan/planaudit/" parameters:parameters success:^(id responseObject) {
        NSArray *objects = [HBPlanModel mj_objectArrayWithKeyValuesArray:responseObject];
        if (objects != nil && objects.count > 0) {
            [self.dataArray addObjectsFromArray:objects];
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
        }
        else {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
    } failure:^(NSError *error) {
        [HBShow showFailure:[NSString stringWithFormat:@"%@", error]];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[HBPlanAuditCell class] forCellReuseIdentifier:NSStringFromClass([HBPlanAuditCell class])];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    
    UIBarButtonItem *leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"返回" icon:@"back-icon" hightIcon:@"back-icon-selected" target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    UIBarButtonItem *rightBarButtonItem =[[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.delegate = self;
    searchBar.placeholder = @"输入物料信息";
    searchBar.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 44);
    self.tableView.tableHeaderView = searchBar;
    self.seachBar = searchBar;
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchText = [NSString stringWithFormat:@"正在查询[%@]", searchBar.text];
    
    [HBShow showMessage:searchText isAutoHide:NO];
    
    [self loadNewData];
    
    [searchBar resignFirstResponder];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.seachBar resignFirstResponder];
}

- (void)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HBPlanAuditCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HBPlanAuditCell class]) forIndexPath:indexPath];
    
    HBPlanModel *planModel = self.dataArray[indexPath.row];
    cell.model = planModel;
    cell.delegate = self;
    cell.indexPath = indexPath;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HBPlanModel *planModel = self.dataArray[indexPath.row];
    
    // 推荐使用此普通简化版方法（一步设置搞定高度自适应，性能好，易用性好）
    return [self.tableView cellHeightForIndexPath:indexPath model:planModel keyPath:@"model" cellClass:[HBPlanAuditCell class] contentViewWidth:[self cellContentViewWith]];
}

- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)planAuditCell:(HBPlanAuditCell *)cell moreClick:(UIButton *)btn
{
    NSArray *indexPathArray = [NSArray arrayWithObject:cell.indexPath];
    [self.tableView reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationAutomatic];
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
