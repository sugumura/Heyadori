#import "COSViewController.h"

@interface COSViewController ()

@end

@implementation COSViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self showUIImagePicker];
}

- (void)showUIImagePicker
{
    // カメラが使用可能かどうか判定する
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        return;
    }
    
    // UIImagePickerControllerのインスタンスを生成
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    
    // デリゲートを設定
    imagePickerController.delegate = self;
    
    // 画像の取得先をカメラに設定
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    // 画像取得後に編集するかどうか（デフォルトはNO）
    imagePickerController.allowsEditing = YES;
    
    // 撮影画面をモーダルビューとして表示する
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

// 画像が選択された時に呼ばれるデリゲートメソッド
- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    // モーダルビューを閉じる
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // 渡されてきた画像をフォトアルバムに保存
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(targetImage:didFinishSavingWithError:contextInfo:), NULL);
}

// 画像の選択がキャンセルされた時に呼ばれるデリゲートメソッド
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    // モーダルビューを閉じる
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // キャンセルされたときの処理を記述・・・
}

// 画像の保存完了時に呼ばれるメソッド
- (void)targetImage:(UIImage *)image
didFinishSavingWithError:(NSError *)error
        contextInfo:(void *)context
{
    if (error) {
        // 保存失敗時の処理
    } else {
        // 保存成功時の処理
    }
}

@end