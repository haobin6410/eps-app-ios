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
#import "HBShow.h"

@interface HBPlanAuditController ()

@property (nonatomic, strong) NSMutableArray *dataArray;

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
    [HBHttp GET:@"/api/plan/planaudit/" parameters:nil success:^(id responseObject) {
        NSArray *objects = (NSArray *)responseObject;
        NSRange range = NSMakeRange(0,  objects.count);
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        [self.dataArray insertObjects:objects atIndexes:indexSet];
        
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSError *error) {
        
    }];
}

- (void)loadMoreData
{
    [HBHttp GET:@"/api/plan/planaudit/" parameters:nil success:^(id responseObject) {
        [self.dataArray addObjectsFromArray:responseObject];
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [HBShow showFailure:@"成功了"];
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    [header beginRefreshing];
    
    self.tableView.mj_header = header;
    
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    self.tableView.mj_footer = footer;
    
    //NSLog(@"%@", self.dataArray);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    UIBarButtonItem *leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"返回" icon:@"back-icon" hightIcon:@"back-icon-selected" target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

- (void)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellid =@"plan_audit_cell_id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
        
        NSDictionary *dic = self.dataArray[indexPath.row];
        cell.textLabel.text = dic[@"MaterialCode"];
        cell.detailTextLabel.text = dic[@"MaterialDesc"];
    }
    
    
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
