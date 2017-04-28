//
//  BMBaseScanningController.m
//  扫描封装
//
//  Created by ___liangdahong on 2017/4/28.
//  Copyright © 2017年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BMBaseScanningController.h"
#import <AVFoundation/AVFoundation.h>

@interface BMBaseScanningController () <AVCaptureMetadataOutputObjectsDelegate>

@property (strong, nonatomic) AVCaptureSession           *session;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *previewLayer;
@property (strong, nonatomic) AVCaptureMetadataOutput    *output;

@end

@implementation BMBaseScanningController

#pragma mark -

#pragma mark - init

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];

    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]
        || authStatus == AVAuthorizationStatusRestricted
        || authStatus == AVAuthorizationStatusDenied) {
        NSLog(@"没有相机 或者 没有相机权限");
        return ;
    }
    [self creatScanning];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self startScanning];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self closureScanning];
}

#pragma mark - getters setters

- (AVCaptureMetadataOutput *)output {
    if (!_output) {
        _output = [[AVCaptureMetadataOutput alloc] init];
        // 设置代理 在主线程里刷新
        [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
        __weak typeof(self) wself = self;
        [[NSNotificationCenter defaultCenter] addObserverForName:AVCaptureInputPortFormatDescriptionDidChangeNotification
                                                          object:nil
                                                           queue:[NSOperationQueue currentQueue]
                                                      usingBlock: ^(NSNotification *_Nonnull note) {
                                                          __strong typeof(wself) self = wself;
                                                          self.output.rectOfInterest = [self.previewLayer metadataOutputRectOfInterestForRect:[self rectOfInterest]];
                                                      }];
    }
    return _output;
}

- (CGRect)rectOfInterest {
    return CGRectMake(0, 0, 1, 1);
}

- (AVCaptureSession *)session {
    if (!_session) {
        _session = [AVCaptureSession new];
    }
    return _session;
}

- (AVCaptureVideoPreviewLayer *)previewLayer {
    if (!_previewLayer) {
        _previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
        _previewLayer.videoGravity = AVLayerVideoGravityResize;
        // 必须添加
        _previewLayer.frame = [self screenBounds];
        _previewLayer.connection.videoOrientation = [self videoOrientationFromCurrentDeviceOrientation];
    }
    return _previewLayer;
}

#pragma mark - 系统delegate

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    if (metadataObjects.count) {
        // 停止扫描
        if (metadataObjects.count) {
            [self closureScanning];
            AVMetadataMachineReadableCodeObject *metadataObject = metadataObjects[0];
            [self captureWithValueString:metadataObject.stringValue];
        }
    }
}

#pragma mark - 自定义delegate

#pragma mark - 公有方法

- (void)startScanning {
    [self.session startRunning];
    [self.view.layer insertSublayer:self.previewLayer atIndex:0];
}

- (void)closureScanning {
    [self.session stopRunning];
    [self.previewLayer removeFromSuperlayer];
}

- (void)captureWithValueString:(NSString *)valueString {

}

#pragma mark - 私有方法

// 创建扫描
- (void)creatScanning {
    
    // 获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // 创建输入流
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    
    // 初始化链接对象
    self.session = [[AVCaptureSession alloc] init];
    
    // 高质量采集率
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];
    
    [self.session addInput:input];
    [self.session addOutput:self.output];
    
    // 设置扫码支持的编码格式
    self.output.metadataObjectTypes = @[
                                    AVMetadataObjectTypeUPCECode,
                                    AVMetadataObjectTypeCode39Code,
                                    AVMetadataObjectTypeCode39Mod43Code,
                                    AVMetadataObjectTypeEAN13Code,
                                    AVMetadataObjectTypeEAN8Code,
                                    AVMetadataObjectTypeCode93Code ,
                                    AVMetadataObjectTypeCode128Code ,
                                    AVMetadataObjectTypePDF417Code,
                                    AVMetadataObjectTypeQRCode,
                                    AVMetadataObjectTypeAztecCode];
    
    [self.view.layer insertSublayer:self.previewLayer atIndex:0];
}

- (CGRect)screenBounds {
    UIScreen *screen = [UIScreen mainScreen];
    if (![screen respondsToSelector:@selector(fixedCoordinateSpace)]
        && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGRectMake(0, 0, CGRectGetHeight(screen.bounds), CGRectGetWidth(screen.bounds));
    }
    return screen.bounds;
}

- (AVCaptureVideoOrientation)videoOrientationFromCurrentDeviceOrientation {
    
    switch ([[UIApplication sharedApplication] statusBarOrientation]) {
        case UIInterfaceOrientationPortrait:
            return AVCaptureVideoOrientationPortrait;
            break;
        case UIInterfaceOrientationLandscapeLeft:
            return AVCaptureVideoOrientationLandscapeLeft;
            break;
        case UIInterfaceOrientationLandscapeRight:
            return AVCaptureVideoOrientationLandscapeRight;
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            return AVCaptureVideoOrientationPortraitUpsideDown;
            break;
        default:
            return AVCaptureVideoOrientationPortrait;
            break;
    }
}

#pragma mark - 事件响应

@end
