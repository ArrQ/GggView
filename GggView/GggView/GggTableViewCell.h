//
//  GggTableViewCell.h
//  GggView
//
//  Created by ArrQ on 2017/9/6.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface GggTableViewCell : UITableViewCell<SDPhotoBrowserDelegate>

@property(nonatomic,strong) UIImageView *imgView;
@property(nonatomic,strong) UILabel *titleLab;
@property(nonatomic,strong) NSIndexPath *indexPath;

@property(nonatomic,strong) NSArray *dataSource;

- (void)setCell:(Model *)model addIndexPath:(NSIndexPath *)indexPath;


@end
