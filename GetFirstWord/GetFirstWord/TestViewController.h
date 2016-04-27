//
//  TestViewController.h
//  GetFirstWord
//
//  Created by jia on 16/4/27.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
    UITableView *_tableView;
    
}
@property (nonatomic,retain)NSMutableArray *dataArr;

@property (nonatomic,retain)NSMutableArray *sortedArrForArrays;

@property (nonatomic,retain)NSMutableArray *sectionHeadsKeys;
@end
