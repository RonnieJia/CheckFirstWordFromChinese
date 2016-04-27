//
//  ViewController.m
//  GetFirstWord
//
//  Created by jia on 16/4/27.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "ViewController.h"
#import "RJGetFirstCode.h"
#import "TestViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)NSMutableArray *sections;
@property (nonatomic, strong)NSMutableArray *rowArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.sectionHeaderHeight = 40;
    tableView.rowHeight = 35;
    
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
    [arr addObjectsFromArray:self.sections];//等价于[arr addObject:UITableViewIndexSearch];
    return arr;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sections[section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rows = self.rowArray[section];
    return rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSArray *row = self.rowArray[indexPath.section];
    cell.textLabel.text = row[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TestViewController *test = [[TestViewController alloc] init];
    [self presentViewController:test animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)rowArray {
    if (!_rowArray) {
        _rowArray = [NSMutableArray array];
        for (int i = 0; i < self.sections.count; i++) {
            NSMutableArray *array = [NSMutableArray array];
            for (int k = 0; k < random()%10+1; k++) {
                NSString *str = [NSString stringWithFormat:@"%@--%d",self.sections[i],k];
                [array addObject:str];
            }
            [_rowArray addObject:array];
        }
    }
    return _rowArray;
}

- (NSMutableArray *)sections {
    if (!_sections) {
        _sections = [NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    }
    return _sections;
}

@end
