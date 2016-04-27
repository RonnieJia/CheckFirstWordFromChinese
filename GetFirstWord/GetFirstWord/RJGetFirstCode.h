//
//  RJGetFirstCode.h
//  GetFirstWord
//
//  Created by jia on 16/4/27.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RJGetFirstCode : NSObject
char pinyinFirstLetter(unsigned short hanzi);
+ (NSString *)getFirstWord:(NSString *)chinese;
@end
