//
//  SAMHUDWindow.h
//  SAMHUDView
//
//  Created by Sam Soffes on 3/17/11.
//  Copyright 2011-2014 Sam Soffes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIWindow.h>

@interface SAMHUDWindow : UIWindow

@property (nonatomic, assign) BOOL hidesVignette;

+ (SAMHUDWindow *)defaultWindow;

@end
