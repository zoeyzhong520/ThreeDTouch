//
//  PreviewDetailViewController.m
//  ThreeDTouch
//
//  Created by 仲召俊 on 2018/11/17.
//  Copyright © 2018 zhongzhaojun. All rights reserved.
//

#import "PreviewDetailViewController.h"

@interface PreviewDetailViewController ()

@property (nonatomic, strong) NSArray *previewActions;

@end

@implementation PreviewDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"PreviewDetail";
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height/4, self.view.bounds.size.width, self.view.bounds.size.height/2)];
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.numberOfLines = 0;
    label.text = [NSString stringWithFormat:@"文本内容：%@",self.content ?: @""];
    [self.view addSubview:label];
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    return self.previewActions;
}

#pragma mark - lazy
- (NSArray *)previewActions {
    if (!_previewActions) {
        if (@available(iOS 9.0, *)) {
            UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"删除" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
                NSLog(@"删除");
            }];
            
            UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"选择" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
                NSLog(@"选择");
            }];
            
            UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"预览返回" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
                NSLog(@"预览返回");
            }];
            
            _previewActions = @[action1,action2,action3];
            
        } else {
            // Fallback on earlier versions 
        }
    }
    return _previewActions;
}

@end
