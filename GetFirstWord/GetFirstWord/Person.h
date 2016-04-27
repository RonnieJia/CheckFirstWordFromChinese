//
//  Person.h
//  GetFirstWord
//
//  Created by jia on 16/4/27.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;


// 用来排序的字段
@property (nonatomic, copy) NSString *pinYin;
@end
