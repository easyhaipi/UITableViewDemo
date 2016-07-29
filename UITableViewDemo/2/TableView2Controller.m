//
//  TableView2Controller.m
//  UITableViewDemo
//
//  Created by taobaichi on 16/7/29.
//  Copyright © 2016年 taobaichi. All rights reserved.
//

#import "TableView2Controller.h"

#import "Table2ViewCell.h"
@interface TableView2Controller ()<UITableViewDataSource,UITableViewDelegate>



@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *contentArray;
@end

@implementation TableView2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.title = @"自动布局";
    _titleArray = [NSArray arrayWithObjects:@"biaoti1",@"标题2",@"3",@"34",nil];
    _contentArray = [NSArray arrayWithObjects:@"长文字",@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",@"萝莉萝卜萝莉萝卜萝莉萝卜萝莉萝卜萝莉萝卜萝莉萝卜萝莉萝卜萝莉萝卜萝莉萝卜萝莉萝卜萝莉萝卜萝莉萝卜萝莉萝卜萝莉萝卜",@"长文字", nil];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 160;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:self.tableView];
    
    
    

    
    

 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table data 数据代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * ID = @"cell2";
      Table2ViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"Table2ViewCell" owner:nil options:nil]lastObject];
        
    }
    
    cell.titleLabel.text = _titleArray[indexPath.row];
    cell.contentLable.text = _contentArray[indexPath.row];
    
    
    return cell;
}

@end
