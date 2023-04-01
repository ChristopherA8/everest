#include "EverestAnimations.h"

@implementation EverestAnimations
+ (void)shrinkAnimationForIconView:(UIView *)iconView
                       withDuration:(float)duration {
  [UIView animateWithDuration:duration * 0.3f
      delay:0.0f
      options:UIViewAnimationOptionCurveLinear
      animations:^{
        CGFloat minimumSize = 0.00001f;
        iconView.transform =
            CGAffineTransformMakeScale(minimumSize, minimumSize);
      }
      completion:^(BOOL finished) {
        if (finished) {
          // Enlarge transform to oversize
          [UIView animateWithDuration:duration * 0.25f
              delay:0.0f
              options:UIViewAnimationOptionCurveEaseOut
              animations:^{
                CGFloat oversize = 1.3f;
                iconView.transform = CGAffineTransformScale(
                    CGAffineTransformIdentity, oversize, oversize);
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
+ (void)fadeOutAnimationForIconView:(UIView *)iconView
                       withDuration:(float)duration {
  [UIView animateWithDuration:duration
                        delay:0.0f
                      options:UIViewAnimationOptionCurveLinear
                   animations:^{
                     // float degrees = 3 * 360;
                     // iconView.transform =
                     // CGAffineTransformMakeRotation(degrees * M_PI/180);
                     iconView.transform =
                         CGAffineTransformMakeScale(0.00001f, 0.00001f);
                   }
                   completion:nil];
}
+ (void)spinAnimationForIconView:(UIView *)iconView
                    withDuration:(float)duration {
}
+ (void)flipVerticalOnceAnimationForIconView:(UIView *)iconView
                                withDuration:(float)duration {
  [UIView animateWithDuration:duration
                        delay:0.0
                      options:UIViewAnimationOptionCurveEaseInOut
                   animations:^(void) {
                     iconView.transform = CGAffineTransformMakeScale(1, -1);
                   }
                   completion:nil];
}
+ (void)flipVerticalAnimationForIconView:(UIView *)iconView
                            withDuration:(float)duration {
  [UIView animateWithDuration:duration * 0.5
      delay:0.0
      options:UIViewAnimationOptionCurveEaseInOut
      animations:^(void) {
        iconView.transform = CGAffineTransformMakeScale(1, -1);
      }
      completion:^(BOOL finished) {
        [UIView animateWithDuration:duration * 0.5
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^(void) {
                           iconView.transform =
                               CGAffineTransformMakeScale(1, 1);
                         }
                         completion:nil];
      }];
}
+ (void)flipHorizontalOnceAnimationForIconView:(UIView *)iconView
                                  withDuration:(float)duration {
  [UIView animateWithDuration:duration
                        delay:0.0
                      options:UIViewAnimationOptionCurveEaseInOut
                   animations:^(void) {
                     iconView.transform = CGAffineTransformMakeScale(-1, 1);
                   }
                   completion:nil];
}
+ (void)flipHorizontalAnimationForIconView:(UIView *)iconView
                              withDuration:(float)duration {
  [UIView animateWithDuration:duration * 0.5
      delay:0.0
      options:UIViewAnimationOptionCurveEaseInOut
      animations:^(void) {
        iconView.transform = CGAffineTransformMakeScale(-1, 1);
      }
      completion:^(BOOL finished) {
        [UIView animateWithDuration:duration * 0.5
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^(void) {
                           iconView.transform =
                               CGAffineTransformMakeScale(1, 1);
                         }
                         completion:nil];
      }];
}
+ (void)rotateClockwiseAnimationForIconView:(UIView *)iconView
                               withDuration:(float)duration {
  [UIView animateWithDuration:duration * 0.5
      delay:0.0
      options:UIViewAnimationOptionCurveEaseIn
      animations:^(void) {
        float degrees = 180; // the value in degrees
        iconView.transform = CGAffineTransformMakeRotation(degrees * PI / 180);
      }
      completion:^(BOOL finished) {
        [UIView animateWithDuration:duration * 0.5
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^() {
                           float degrees = 0; // the value in degrees
                           iconView.transform = CGAffineTransformMakeRotation(
                               degrees * PI / 180);
                         }
                         completion:nil];
      }];
}
+ (void)rotateCounterClockwiseAnimationForIconView:(UIView *)iconView
                                      withDuration:(float)duration {
  [UIView animateWithDuration:duration * 0.5
      delay:0.0
      options:UIViewAnimationOptionCurveEaseIn
      animations:^(void) {
        float degrees = 181; // the value in degrees (if anyone knows how to
                             // rotate backwards in CoreAnimation lemme know)
        iconView.transform = CGAffineTransformMakeRotation(degrees * PI / 180);
      }
      completion:^(BOOL finished) {
        [UIView animateWithDuration:duration * 0.5
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^() {
                           float degrees = 1; // the value in degrees (doesn't
                                              // even make a full rotation lol)
                           iconView.transform = CGAffineTransformMakeRotation(
                               degrees * PI / 180);
                         }
                         completion:nil];
      }];
}
+(void)tadaAnimationForIconView:(UIView *)iconView withDuration:(float)duration {
  [iconView tada:NULL];
}
+(void)bounceAnimationForIconView:(UIView *)iconView withDuration:(float)duration {
  [iconView bounce:NULL];
}
+(void)pulseAnimationForIconView:(UIView *)iconView withDuration:(float)duration {
  [iconView pulse:NULL];
}
+(void)swingAnimationForIconView:(UIView *)iconView withDuration:(float)duration {
  [iconView swing:NULL];
}
+(void)hingeAnimationForIconView:(UIView *)iconView withDuration:(float)duration {
  [iconView hinge:NULL];
}
+(void)dropAnimationForIconView:(UIView *)iconView withDuration:(float)duration {
  [iconView drop:NULL];
}
+(void)squeezeAnimationForIconView:(UIView *)iconView withDuration:(float)duration {
  [UIView animateWithDuration:duration // * 0.3f
      delay:0.0f
      options:UIViewAnimationOptionCurveEaseOut
      animations:^{
        CGFloat minimumSize = 0.001f;
        iconView.transform =
            CGAffineTransformMakeScale(minimumSize, 1);
      }
      completion:nil];
}
@end