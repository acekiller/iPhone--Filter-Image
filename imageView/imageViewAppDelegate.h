//
//  imageViewAppDelegate.h
//  imageView
//
//  Created by Hung Phi on 7/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class imageViewViewController;

@interface imageViewAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet imageViewViewController *viewController;

@end
