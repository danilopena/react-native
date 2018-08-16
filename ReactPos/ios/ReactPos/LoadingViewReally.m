//
//  LoadingViewReally.m
//  RNTLoadingDemo
//
//  Created by Danilo Pena on 14/08/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "LoadingViewReally.h"

#if __has_include(<React/RCTEventDispatcher.h>)
#import <React/RCTEventDispatcher.h>
#elif __has_include(“RCTEventDispatcher.h”)
#import “RCTEventDispatcher.h”
#else
#import “React/RCTEventDispatcher.h” // Required when used as a Pod in a Swift project
#endif

@implementation LoadingViewReally {
  
  RCTEventDispatcher *_eventDispatcher;
  UIView *_chieldView;
}

RCT_EXPORT_MODULE()

- (UIView *)view
{
  return [self makeLoading];
}

- (UIView *)makeLoading {
  return [self loadingViewWithBgColor:@"#000000" andSquareColor:@"#FFFFFF" andTextLoading:@"Carregando..."];
}

- (UIView *)loadingViewWithBgColor: (NSString *)color andSquareColor: (NSString *)squareColor andTextLoading: (NSString *) loadingText
{
  UIView *loadingView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 150, 15)];
  loadingView.backgroundColor = [self colorFromHexString: color];
  
  UIView *squareView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 150, 150)];
  squareView.center = loadingView.center;
  squareView.layer.cornerRadius = 10;
  squareView.backgroundColor = [self colorFromHexString: squareColor];
  
  UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
  spinner.frame = CGRectMake(0, 0, 40, 40);
  spinner.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.5, 1.5);
  spinner.hidesWhenStopped = YES;
  spinner.center = CGPointMake(squareView.frame.size.width /2, (squareView.frame.size.height/2) - 20);
  
  UILabel *labelLoading = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 25)];
  labelLoading.text = loadingText;
  labelLoading.textAlignment = NSTextAlignmentCenter;
  labelLoading.center = CGPointMake((squareView.frame.size.width / 2), squareView.frame.size.height - 35);
  
  [squareView addSubview: spinner];
  [squareView addSubview: labelLoading];
  [loadingView addSubview: squareView];
  [spinner startAnimating];
  
  return loadingView;
}

- (UIColor *)colorFromHexString:(NSString *)hexString {
  unsigned rgbValue = 0;
  NSScanner *scanner = [NSScanner scannerWithString:hexString];
  [scanner setScanLocation:1]; // bypass '#' character
  [scanner scanHexInt:&rgbValue];
  return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:0.8];
}


@end
