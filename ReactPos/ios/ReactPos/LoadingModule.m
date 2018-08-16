//
//  LoadingModule.m
//  ReactPos
//
//  Created by Danilo Pena on 14/08/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "LoadingModule.h"

@implementation LoadingModule

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(getString: (RCTResponseSenderBlock) callBack) {
  NSString * string = @"Foi";
  
  callBack(@[string]);
}

@end
