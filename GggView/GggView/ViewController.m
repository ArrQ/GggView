//
//  ViewController.m
//  GggView
//
//  Created by ArrQ on 2017/9/6.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "ViewController.h"
#import "GggTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.tableView];
    
    NSArray *arr = @[
                     
                     @{@"img":@"cell_000",@"title":@"你妹"
                       },
                     @{@"img":@"cell_000",@"title":@"你妹"
                       },
                     @{@"img":@"cell_000",@"title":@"你妹"
                       },
                     @{@"img":@"cell_000",@"title":@"你妹"
                       },
                     @{@"img":@"cell_000",@"title":@"你妹"
                       }
                     
                     ];
    
   self.dataArray = [arr copy];
    

}

- (NSMutableArray *)dataArray{

    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }

    return _dataArray;
}


#pragma mark ---  tableView delegate


- (UITableView *)tableView {
    
    if (!_tableView) {
        CGRect frame = [UIScreen mainScreen].bounds;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64+49, frame.size.width, frame.size.height-64-49) style:UITableViewStylePlain];
        
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[GggTableViewCell class] forCellReuseIdentifier:@"homecell"];
        
    }
    return _tableView;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    GggTableViewCell *homeCell_000 = [tableView dequeueReusableCellWithIdentifier:@"homecell"];
    homeCell_000.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (!homeCell_000) {
        homeCell_000.selectionStyle = UITableViewCellSelectionStyleNone;
        homeCell_000.backgroundColor = [UIColor whiteColor];
        homeCell_000 = [[GggTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"homecell"];
        
        
    }
    
    NSDictionary *dic = self.dataArray[indexPath.row];
    
    Model *model = [[Model alloc]initWithDic:dic];

    [homeCell_000 setCell:model addIndexPath:indexPath];
    
    
    
    
    
    return homeCell_000;
    
    
}

//去除tableView 悬浮办法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sectionHeaderHeight;
    sectionHeaderHeight = 20+64;
    if (scrollView == _tableView) {
        //去掉UItableview的section的headerview黏性
        if (scrollView.contentOffset.y<=sectionHeaderHeight && scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
