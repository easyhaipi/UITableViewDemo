//
//  TableView3Controller.m
//  UITableViewDemo
//
//  Created by taobaichi on 16/7/29.
//  Copyright © 2016年 taobaichi. All rights reserved.
//

#import "TableView3Controller.h"

@interface TableView3Controller ()<UITableViewDataSource,UITableViewDelegate>



@property (nonatomic, strong) UITableView *tableView;
@end

@implementation TableView3Controller

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor cyanColor];
    self.title = @"Tableview视图Cell进入动画 从底部往上弹";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
   
    [self.view addSubview:self.tableView];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self animateTable];
}

//@"Tableview视图Cell进入动画 从底部往上弹"
-(void)animateTable
{
    [self.tableView reloadData];
    NSArray *cells = self.tableView.visibleCells;
    float tableHeight = self.tableView.bounds.size.height;
    
    for (UITableViewCell *cell in cells) {
        cell.transform = CGAffineTransformMakeTranslation(0, tableHeight);
    }
    
    int index = 0;
  
    for (UITableViewCell *cell in cells) {
       [UIView animateWithDuration:1.0 delay: 0.05 * index options:0.8 animations:^{
           cell.transform = CGAffineTransformMakeTranslation(0, 0);
       } completion:nil];
        index += 1;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID = @"cell3";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"数据填充%ld",(long)indexPath.row];
    
    
    
    
    return cell;
}

@end
