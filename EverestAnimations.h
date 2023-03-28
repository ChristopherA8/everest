#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define PI 3.14159265358979323846264338327950

@interface EverestAnimations : NSObject
+(void)squeezeAnimationForIconView:(UIView *)icon withDuration:(float)duration;
+(void)fadeOutAnimationForIconView:(UIView *)icon withDuration:(float)duration;
+(void)spinAnimationForIconView:(UIView *)icon withDuration:(float)duration;
@end