
#import "RNLoadingView.h"

@implementation RNLoadingView

#define UIColorFromRGB(rgbValue) \
    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
        green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
        blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
    alpha:1.0]


- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

- (UIView *)view {
    UIColor *colorBg = [[UIColor alloc] initWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.7];
    
    UIColor *colorSquare = [[UIColor alloc] initWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.7];
    
    [self makeLoading: @"#000000" andSquareColor: @"#FFFFFF" andTextLoading: @"Carregando..."];
}

- (UIView *)loadingViewWithBgColor: (NSString *)color andSquareColor: (NSString *)squareColor andTextLoading: (NSString *) loadingText)
{
    UIView *loadingView = [[UIView alloc] initWithFrame: self.view.bounds];
    loadingView.backgroundColor = [self colorFromHexString: color];
    
    UIView *squareView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 150, 150)];
    squareView.center = self.view.center;
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

RCT_EXPORT_METHOD(printHello) {
    RCTLogInfo(@"Teste react");
}

- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:0.8];
}

@end
  
