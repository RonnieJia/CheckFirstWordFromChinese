//
//  TestViewController.m
//  GetFirstWord
//
//  Created by jia on 16/4/27.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "TestViewController.h"
#import "RJGetFirstCode.h"
#import "Person.h"

@interface TestViewController ()
@property (nonnull, strong) NSMutableArray *persons;
@end

@implementation TestViewController
@synthesize dataArr =_dataArr;
@synthesize sortedArrForArrays =_sortedArrForArrays;
@synthesize sectionHeadsKeys =_sectionHeadsKeys;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getSectionAndCellData];
    //创建tableView
    [self createTableView];
}

#pragma mark create method
- (void)getSectionAndCellData {
    //创建要显示的数据
    _dataArr = [[NSMutableArray alloc]init];
    _sortedArrForArrays = [[NSMutableArray alloc]init];
    _sectionHeadsKeys = [[NSMutableArray alloc]init];     //initialize a array to hold keys like A,B,C ...
    self.persons = [NSMutableArray array];
    
    //add test data
    [_dataArr addObject:@"郭靖"];
    [_dataArr addObject:@"黄蓉"];
    [_dataArr addObject:@"杨过"];
    [_dataArr addObject:@"苗若兰"];
    [_dataArr addObject:@"令狐冲"];
    [_dataArr addObject:@"小龙女"];
    [_dataArr addObject:@"胡斐"];
    [_dataArr addObject:@"水笙"];
    [_dataArr addObject:@"任盈盈"];
    [_dataArr addObject:@"白琇"];
    [_dataArr addObject:@"狄云"];
    [_dataArr addObject:@"石破天"];
    [_dataArr addObject:@"殷素素"];
    [_dataArr addObject:@"张翠山"];
    [_dataArr addObject:@"张无忌"];
    [_dataArr addObject:@"青青"];
    [_dataArr addObject:@"袁冠南"];
    [_dataArr addObject:@"萧中慧"];
    [_dataArr addObject:@"袁承志"];
    [_dataArr addObject:@"乔峰"];
    [_dataArr addObject:@"王语嫣"];
    [_dataArr addObject:@"段玉"];
    [_dataArr addObject:@"虚竹"];
    [_dataArr addObject:@"苏星河"];
    [_dataArr addObject:@"丁春秋"];
    [_dataArr addObject:@"庄聚贤"];
    [_dataArr addObject:@"阿紫"];
    [_dataArr addObject:@"阿朱"];
    [_dataArr addObject:@"阿碧"];
    [_dataArr addObject:@"鸠魔智"];
    [_dataArr addObject:@"萧远山"];
    [_dataArr addObject:@"慕容复"];
    [_dataArr addObject:@"慕容博"];
    [_dataArr addObject:@"Jim"];
    [_dataArr addObject:@"Lily"];
    [_dataArr addObject:@"Ethan"];
    [_dataArr addObject:@"Green小"];
    [_dataArr addObject:@"Green大"];
    [_dataArr addObject:@"DavidSmall"];
    [_dataArr addObject:@"DavidBig"];
    [_dataArr addObject:@"James"];
    [_dataArr addObject:@"Kobe Brand"];
    [_dataArr addObject:@"Kobe Crand"];
    
    //引用getChineseStringArr,并传入参数,最后将值赋给sortedArrForArrays
    
    for (int i = 0; i<_dataArr.count; i++) {
        NSString *name = _dataArr[i];
        Person *p = [[Person alloc] init];
        p.name = name;
        p.age = random()%60;
        [self.persons addObject:p];
        
    }
    self.sortedArrForArrays = [self getChineseStringArr:self.persons];
    
}

- (void)createTableView {
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource =self;
    _tableView.delegate =self;
    [self.view addSubview:_tableView];
    
}

#pragma mark tableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  [[self.sortedArrForArrays objectAtIndex:section]count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.sortedArrForArrays count];
}

//为section添加标题

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [_sectionHeadsKeys objectAtIndex:section];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.sectionHeadsKeys;
}

//创建tableView的cell

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId =@"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    //sortedArrForArrays存放cell值的动态数组,首先将数组中得值赋给一个静态数组
    if ([self.sortedArrForArrays count] > indexPath.section) {
        NSArray *arr = [self.sortedArrForArrays objectAtIndex:indexPath.section];
        if ([arr count] > indexPath.row) {
            //之后,将数组的元素取出,赋值给数据模型
            Person *per = [arr objectAtIndex:indexPath.row];
            //给cell赋给相应地值,从数据模型处获得
            cell.textLabel.text = [NSString stringWithFormat:@"%@--%zd",per.name,per.age];
        } else {
            NSLog(@"arr out of range");
        }
    } else {
         NSLog(@"sortedArrForArrays out of range");
    }
    return cell;
    
}

//固定代码,每次使用只需要将数据模型替换就好,这个方法是获取首字母,将填充给cell的值按照首字母排序
- (NSMutableArray *)getChineseStringArr:(NSMutableArray *)arrToSort {
    
    for(int i =0; i < arrToSort.count; i++) {
        Person *p = [arrToSort objectAtIndex:i];
        if (p.name == nil) {
            p.name = @"";
        }
        if(![p.name isEqualToString:@""]) {
            //join(链接) the pinYin (letter字母) 链接到首字母
            NSString *pinYinResult = [NSString string];
            //按照数据模型中row的个数循环
            for(int j =0;j < p.name.length; j++) {
                NSString *singlePinyinLetter = [[NSString stringWithFormat:@"%c",
                                                 pinyinFirstLetter([p.name characterAtIndex:j])]uppercaseString];
                pinYinResult = [pinYinResult stringByAppendingString:singlePinyinLetter];
            }
            p.pinYin = pinYinResult;
            
        } else {
            p.pinYin =@"";
        }
    }
    //sort(排序) the ChineseStringArr by pinYin(首字母)
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"pinYin"ascending:YES]];
    [self.persons sortUsingDescriptors:sortDescriptors];
    
    NSMutableArray *arrayForArrays = [NSMutableArray array];
    BOOL checkValueAtIndex=NO; //flag to check
    
    NSMutableArray *TempArrForGrouping =nil;
    for(int index =0; index < [self.persons count]; index++) {
        Person *per = self.persons[index];
        NSMutableString *strchar = [NSMutableString stringWithString:per.pinYin];
        NSString *sr= [strchar substringToIndex:1];
        
        //sr containing here the first character of each string  (这里包含的每个字符串的第一个字符)
        NSLog(@"%@",sr);
        
        //here I'm checking whether the character already in the selection header keys or not  (检查字符是否已经选择头键)
        if(![_sectionHeadsKeys containsObject:[sr uppercaseString]]) {
            [_sectionHeadsKeys addObject:[sr uppercaseString]];
            TempArrForGrouping = [NSMutableArray array];
            checkValueAtIndex = NO;
        }
        if([_sectionHeadsKeys containsObject:[sr uppercaseString]]) {
            [TempArrForGrouping addObject:[self.persons objectAtIndex:index]];
            
            if(checkValueAtIndex ==NO) {
                [arrayForArrays addObject:TempArrForGrouping];
                checkValueAtIndex = YES;
            }
        }
    }
    return arrayForArrays;
    
}



@end
