//
//  AppDelegate.h
//  GggView
//
//  Created by ArrQ on 2017/9/6.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

