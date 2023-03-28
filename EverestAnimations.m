#include "EverestAnimations.h"

@implementation EverestAnimations
+(void)squeezeAnimationForIconView:(UIView *)iconView withDuration:(float)duration {
  [UIView animateWithDuration:duration * 0.3f
      delay:0.0f
      options:UIViewAnimationOptionCurveLinear
      animations:^{
        CGFloat minimumSize = 0.00001f;
        iconView.transform = CGAffineTransformMakeScale(minimumSize, minimumSize);
      }
      completion:^(BOOL finished) {
        if (finished) {
          // Enlarge transform to oversize
          [UIView animateWithDuration:duration * 0.25f
              delay:0.0f
              options:UIViewAnimationOptionCurveEaseOut
              animations:^{
                CGFloat oversize = 1.3f;
                iconView.transform = CGAffineTransformScale(CGAffineTransformIdentity, oversize, oversize);
              }
              completion:^(BOOL finished) {
                // Bouncing back
                if (finished) {
                  [UIView animateWithDuration:duration * 0.25f
                                        delay:0.0f
                                      options:UIViewAnimationOptionCurveEaseOut
                                   animations:^{
                                     iconView.transform =
                                         CGAffineTransformIdentity;
                                   }
                                   completion:nil];
                }
              }];
        }
      }];
}
+(void)fadeOutAnimationForIconView:(UIView *)iconView withDuration:(float)duration {
  [UIView animateWithDuration:duration
      delay:0.0f
      options:UIViewAnimationOptionCurveLinear
      animations:^{
        // float degrees = 3 * 360;
        // iconView.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
        iconView.transform = CGAffineTransformMakeScale(0.00001f, 0.00001f);
      }
      completion:nil];
}
+(void)spinAnimationForIconView:(UIView *)iconView withDuration:(float)duration {
}
@end