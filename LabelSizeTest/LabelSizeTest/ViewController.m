//
//  ViewController.m
//  LabelSizeTest
//
//  Created by Xunqf on 16/3/7.
//  Copyright © 2016年 荀青锋. All rights reserved.
//

#import "ViewController.h"
#import "XQFLiteralLiveCell.h"
#import <UITableView+FDTemplateLayoutCell.h>

static NSString *const cellIdentifer = @"TextLiveCellIdentifer";

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) XQFLiteralLiveCell *prototypeCell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithWhite:0.898 alpha:1.000];
    self.title = @"体育直播";
    
    CGRect rect = [UIScreen mainScreen].bounds;
    self.tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[XQFLiteralLiveCell class] forCellReuseIdentifier:cellIdentifer];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    self.prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifer];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XQFLiteralLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    [cell setData:nil indexPath:indexPath];
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    return [tableView fd_heightForCellWithIdentifier:cellIdentifer configuration:^(XQFLiteralLiveCell *cell) {
//        [cell setData:nil indexPath:indexPath];
//    }];
    return [self.prototypeCell setData:nil indexPath:indexPath];;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
