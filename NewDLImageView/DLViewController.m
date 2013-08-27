//
//  DLViewController.m
//  NewDLImageView
//
//  Created by David Lee on 4/10/13.
//  Copyright (c) 2013 David Lee. All rights reserved.
//

#import "DLViewController.h"

@interface DLViewController ()

@end

@implementation DLViewController

//GETTEST
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    imageView = [[DLImageView alloc] initWithFrame:CGRectMake(0, 0, 320, SCREENSIZE.height)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.autoresizesSubviews = YES;
    imageView.autoresizingMask =
    UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:imageView];
    [imageView release];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0, 0, 80, 40);
    [btn setTitle:@"重新下载" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(dldImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dldImage
{
    [[SDImageCache sharedImageCache] clearMemory];
    [[SDImageCache sharedImageCache] clearDisk];
    [imageView setImageWithURL:[NSURL URLWithString:IMAGEURL] placeholderImage:[UIImage imageNamed:@"ip5back"]];
}

@end
