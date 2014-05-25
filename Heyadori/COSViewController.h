//
//  CameraViewController.h
//  AfricanSafari
//
//  Created by Norifumi Kawamoto on 12/06/18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>

@class ALAssetsLibrary;
@class AVPlayer;
@class AVPlayerView;

@class COuiView;

@interface COSViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    IBOutlet COuiView *couiView;
}

-(IBAction)CameraOn:(id)sender;

@end
