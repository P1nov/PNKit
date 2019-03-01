//
//  PNViewController.m
//  PNKit
//
//  Created by wefint on 02/28/2019.
//  Copyright (c) 2019 wefint. All rights reserved.
//

#import "PNViewController.h"
#import <PNKit/PNPopoverView.h>
#import <PNKit/PNRowAction.h>

@interface PNViewController ()

@property (nonatomic, strong) PNPopoverView *popoverView;

@end

@implementation PNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self.view addSubview:self.popoverView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (PNPopoverView *)popoverView{

    if (!_popoverView) {
        _popoverView = [[PNPopoverView alloc] initWithOrigin:CGPointMake(200, 300) width:100 direction:PNArrowDirectionUpMiddle];

        PNRowActionConfig *config1 = [PNRowActionConfig configWithTitle:@"title1" icon:nil font:nil color:nil];
        PNRowAction *action1 = [PNRowAction actionWithConfig:config1 handler:^(PNRowAction * _Nonnull action) {

            NSLog(@"第1个action");
        }];
        [_popoverView.rowActions addObject:action1];

        PNRowActionConfig *config2 = [PNRowActionConfig configWithTitle:@"title2" icon:nil font:nil color:nil];
        PNRowAction *action2 = [PNRowAction actionWithConfig:config2 handler:^(PNRowAction * _Nonnull action) {

            NSLog(@"第2个action");
        }];
        [_popoverView.rowActions addObject:action2];

        PNRowActionConfig *config3 = [PNRowActionConfig configWithTitle:@"title3" icon:nil font:nil color:nil];
        PNRowAction *action3 = [PNRowAction actionWithConfig:config3 handler:^(PNRowAction * _Nonnull action) {

            NSLog(@"第3个action");
        }];
        [_popoverView.rowActions addObject:action3];
    }

    return _popoverView;
}

@end
