//
//  MRTableViewController.m
//  myMakeMoneyStudy
//
//  Created by mingxianwei on 2017/6/14.
//  Copyright © 2017年 Miricle. All rights reserved.
//

#import "MRTableViewController.h"

@interface MRTableViewController ()
@property (nonatomic,strong)NSIndexPath * selectedIndexPath;
@property (nonatomic,copy) NSArray * dataSource;

@end

@implementation MRTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"动画";
    self.tableView.rowHeight = 55;
    self.tableView.sectionHeaderHeight = 50;
    self.dataSource = @[@"低俗色情",
                        @"广告骚扰"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

/*
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
