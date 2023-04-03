#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIView+DCAnimationKit.h"

#define PI 3.14159265358979323846264338327950

@interface EverestAnimations : NSObject
+(void)shrinkAnimationForIconView:(UIView *)iconView withDuration:(float)duration;
+(void)fadeOutAnimationForIconView:(UIView *)iconView withDuration:(float)duration;
+(void)spinAnimationForIconView:(UIView *)iconView withDuration:(float)duration;
+(void)flipVerticalOnceAnimationForIconView:(UIView *)iconView withDuration:(float)duration;
+(void)flipVerticalAnimationForIconView:(UIView *)iconView withDuration:(float)duration;
+(void)flipHorizontalOnceAnimationForIconView:(UIView *)iconView withDuration:(float)duration;
+(void)flipHorizontalAnimationForIconView:(UIView *)iconView withDuration:(float)duration;
+(void)rotateClockwiseAnimationForIconView:(UIView *)iconView withDuration:(float)duration;
+(void)rotateCounterClockwiseAnimationForIconView:(UIView *)iconView withDuration:(float)duration;
+(void)tadaAnimationForIconView:(UIView *)iconView withDuration:(float)duration;
+(void)bounceAnimationForIconView:(UIView *)iconView withDuration:(float)duration;
+(void)pulseAnimationForIconView:(UIView *)iconView withDuration:(float)duration;
+(void)swingAnimationForIconView:(UIView *)iconView withDuration:(float)duration;
+(void)hingeAnimationForIconView:(UIView *)iconView withDuration:(float)duration;
+(void)dropAnimationForIconView:(UIView *)iconView withDuration:(float)duration;
+(void)squeezeAnimationForIconView:(UIView *)iconView withDuration:(float)duration;
@end