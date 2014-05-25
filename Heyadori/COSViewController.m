#import "COSViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "COuiView.h"

@implementation COSViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    imagePicker = [[UIImagePickerController alloc] init];
    
    //UIパーツを置くView「ARueView」を非表示にしておく。表示したい場合は消す
    [couiView removeFromSuperview];
}

//カメラ画像表示+オーバーレイ
-(IBAction)CameraOn:(id)sender {
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        //ムービーモードにする
        imagePicker.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *)kUTTypeMovie , nil];
        //クオリティを最大にする
        imagePicker.videoQuality = UIImagePickerControllerQualityTypeHigh;
        //撮影最大時間を  300 秒にする
        imagePicker.videoMaximumDuration = 300;
        
        // 画像取得後に編集するかどうか（デフォルトはNO）
        imagePicker.allowsEditing = YES;
        
        imagePicker.showsCameraControls = NO;
        //オーバーレイ
        imagePicker.cameraOverlayView = couiView;
        
        [self presentModalViewController:imagePicker animated:NO];
    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
