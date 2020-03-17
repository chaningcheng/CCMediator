//
//  CCViewController.m
//  CCMediator
//
//  Created by chaningcheng on 03/17/2020.
//  Copyright (c) 2020 chaningcheng. All rights reserved.
//

#import "CCViewController.h"
#import <CCMediator/CCMediator.h>
#import "CCMediator+CCDemoInterface.h"

@interface CCViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy  ) NSArray<NSString *> *dataSource;

@end

@implementation CCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UIViewController *vc = [CCMediator.mediator pushDemoModuleViewControllerWithParameter:@{@"name" : @"cc"}];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 1) {
        [CCMediator.mediator mediatorPresentDemoModuleViewController];
    } else if (indexPath.row == 2) {
        NSURL *url = [NSURL URLWithString:@"cxxc://CCDemoModule/pushDemoModuleViewController:?name=cc"];
        UIViewController *vc = [CCMediator.mediator performActionWithURL:url];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        NSURL *url = [NSURL URLWithString:@"https://www.baidu.com?name=cc"];
        UIViewController *vc = [CCMediator.mediator performActionWithURL:url];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                  style:UITableViewStylePlain];
        [_tableView registerClass:UITableViewCell.class
           forCellReuseIdentifier:@"UITableViewCell"];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = UIView.new;
    }
    return _tableView;
}

- (NSArray<NSString *> *)dataSource {
    return @[@"target - action open external",
             @"target - action open internal",
             @"native URL open",
             @"web URL open"];
}

@end
