//
//  AppDelegate.h
//  GZHProject
//
//  Created by gzh on 17/3/3.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property(nonatomic,strong)NSMutableArray *firendArray;
@property(nonatomic,strong)NSMutableArray *groupsArray;
- (void)saveContext;
+(AppDelegate*)shareAppDelegate;

@end

