//
//  Overlay.m
//  Overlay
//
//  Created by callum taylor on 06/09/2015.
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Overlay.h"
#import "FancyTabBar.h"
#import "Coordinate.h"
#import "UIImage+ImageEffects.h"
#import "UIView+Screenshot.h"
#import <substrate.h>

@interface FBDisplayManager : NSObject
+(id)mainDisplay;
@end

@interface FBSceneManager : NSObject
+(id)sharedInstance;
-(UIView*)_rootWindowForDisplay:(FBDisplayManager*)display;
@end

MSHookInterface(SpringBoard, OverlayProxy, NSObject);

@implementation Overlay

- (void)createUI {
    UIView *rootView = [[objc_getClass("FBSceneManager") sharedInstance]
                        _rootWindowForDisplay:[objc_getClass("FBDisplayManager") mainDisplay]];
    self.view = rootView;
    
    FancyTabBar *tab = [[FancyTabBar alloc] initWithFrame:self.view.bounds];
    [tab setUpChoices:self choices:@[@"Select Process", @"Search", @"Settings", @"Quit"]
                    withMainButtonImage:[UIImage imageWithColor:[UIColor redColor]]
                    andMainButtonCustomOrigin:
                    CGPointMake(CGRectGetMidX(rootView.frame)-20, CGRectGetMaxY(rootView.frame) - 100)];
    
    tab.delegate = self;
    [rootView addSubview:tab];
}


- (void)didCollapse {
   
}


- (void)didExpand {
   
}


- (void)optionsButton:(UIButton*)optionButton didSelectItem:(int)index {
    [[optionButton superview] removeFromSuperview];
}

- (void)test {
    exit(0);
}

@end


@implementation OverlayProxy

-(void)applicationDidFinishLaunching:(id)application {
    [super applicationDidFinishLaunching:application];
    
    Overlay *overlay = [[Overlay alloc] init];
    [overlay createUI];
}

@end