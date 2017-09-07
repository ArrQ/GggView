//
//  Model.m
//  GggView
//
//  Created by ArrQ on 2017/9/6.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "Model.h"

@implementation Model

- (instancetype)initWithDic:(NSDictionary *)dic{

    if (self = [super init]) {
        
        self.img = dic[@"img"];
        self.title = dic[@"title"];
        
    }
    
    return self;

}

@end
