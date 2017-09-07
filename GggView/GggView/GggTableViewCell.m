//
//  GggTableViewCell.m
//  GggView
//
//  Created by ArrQ on 2017/9/6.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "GggTableViewCell.h"
@implementation GggTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self customSubViews];
        
    }
    
    return self;
    
}


- (void)customSubViews{
    
    
    
    UIImageView *imgView_ = [[UIImageView alloc]init];
    
    [imgView_ setImage:[UIImage imageNamed:@"cell_000"]];
    imgView_.contentMode = UIViewContentModeScaleToFill;
    imgView_.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgClick:)];
    [imgView_ addGestureRecognizer:tap];

    [self addSubview:imgView_];

    self.imgView = imgView_;
    
    
    UILabel *lable_000 = [[UILabel alloc]init];
    
    lable_000.text = @"娱乐";
    [lable_000 sizeToFit];
    lable_000.font = [UIFont systemFontOfSize:14];
    lable_000.textAlignment = NSTextAlignmentLeft;
    lable_000.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    [self addSubview:lable_000];

    self.titleLab = lable_000;
    
    
}



- (void)setCell:(Model *)model addIndexPath:(NSIndexPath *)indexPath{
    
    self.indexPath = indexPath;
    
    [_imgView setImage:[UIImage imageNamed:model.img]];
    
    _titleLab.text = model.title;
    
}


- (void)imgClick:(UITapGestureRecognizer *)tap{

    UIImageView *tapView = (UIImageView *)tap.view;

    SDPhotoBrowser *photo = [SDPhotoBrowser new];
    
    photo.imageCount = _dataSource.count;
    
    photo.delegate = self;
    
    photo.currentImageIndex = tapView.tag;
    
    photo.sourceImagesContainerView = self;
    
    [photo show];



}


# pragma mark --- delegate-----

- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index{

    UIImageView *img = self.subviews[index];
    
    return img.image;

}


- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index{

    NSString *str = self.dataSource[index];

    return [NSURL URLWithString:str];
}






# pragma mark --- lay ----

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.left.equalTo(self).offset(5);
        make.centerY.equalTo(self.mas_centerY);
        
    }];
    
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.left.equalTo(_imgView.mas_right).offset(5);
        make.centerY.equalTo(self.mas_centerY);
        
    }];
    

    
    
}

@end
