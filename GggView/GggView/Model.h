//
//  Model.h
//  GggView
//
//  Created by ArrQ on 2017/9/6.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property(nonatomic,copy) NSString *img;
@property(nonatomic,copy) NSString *title;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
