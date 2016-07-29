//
//  ViewController.m
//  UITableViewDemo
//
//  Created by taobaichi on 16/7/29.
//  Copyright © 2016年 taobaichi. All rights reserved.
//

#import "ViewController.h"


#import "TableView1Controller.h"
#import "TableView2Controller.h"
#import "TableView3Controller.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;



@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.title = @"UITableViewDemo";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    _titleArray = [NSArray arrayWithObjects:@"UITableViewCell自动布局autoLayout1",@"自动布局autoLayout 学习2", @"Tableview视图Cell进入动画 从底部往上弹",nil];
  
    
    
    
    // tableview 的一些属性
//# 1.隐藏分割线
//# 2.隐藏多余Cell
    //##❤在ViewController初始化时候加载 如viewDidLoad
    //隐藏分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //隐藏多余的cell
    self.tableView.tableFooterView = [[UIView alloc] init];

    
    
    

 
   


}


//# 3.分割线头部顶到底、分割线颜色
///##❤分割线头部顶到底、分割线颜色
//启动、旋转、视图大小位置发生改变、增加子视图等..都会调用
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.layoutMargins = UIEdgeInsetsZero;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = [UIColor redColor]; //分割线颜色
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

////没当cell即将出现屏幕时候都会调用此方法
//func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//    cell.separatorInset = UIEdgeInsetsZero
//    cell.layoutMargins = UIEdgeInsetsZero
//}

////每当cell即将出现屏幕时候都会调用此方法
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.layoutMargins = UIEdgeInsetsZero;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = [UIColor redColor]; //分割线颜色
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = _titleArray[indexPath.row];
    
    
    
//# 4.自定义点击后效果 Cell 背景等更改
    //##❤在cellForRowAtIndexPath方法使用
    //点击Cell时，没有点击效果
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //系统默认的颜色  .Blue蓝色-默认 .Grap灰色 .None 无色
    //点击Cell时，自定义选中后的背景视图
    //背景颜色
    cell.selectedBackgroundView = [[UIView alloc] init];
    cell.selectedBackgroundView.backgroundColor = [UIColor orangeColor];
    //背景图片
//    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    
    //cell 右边的辅助的提示
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator; //>
    
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//# 5.类似button点击效果 Cell - 闪一下
    //##❤在 didSelectRowAtIndexPath 方法内使用
    //点击Cell时 一闪而过 适合转场时候交互 -
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES]; // - true 动画慢吞吞，适合不转场时
    switch (indexPath.row) {
        case 0:
        {
            TableView1Controller *vc = [[TableView1Controller alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            TableView2Controller *vc = [[TableView2Controller alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            TableView3Controller *vc = [[TableView3Controller alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
