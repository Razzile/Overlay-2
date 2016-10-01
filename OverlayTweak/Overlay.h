//
//  Overlay.h
//  Overlay
//
//  Created by callum taylor on 06/09/2015.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FancyTabBar.h"
@interface Overlay : UIViewController <FancyTabBarDelegate>

- (void)createUI;

@end