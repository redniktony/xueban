//
//  MBProgressHUD+Add.h
//  视频客户端
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Add)
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;
+ (void)showMessage:(NSString *)text view:(UIView *)view;
+ (void)hideHUD;

+ (void)hideHUDForView:(UIView *)view;

+ (MBProgressHUD *)showProgress:(NSString *)title toView:(UIView *)view afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showProgress:(UIView *)view;
@end
