/* =============================================
 *                    Everest
 *
 *                   Developer -
 *              Christopher Anderson
 *
 *                    Credits -
 *  https://github.com/daltoniam/DCAnimationKit
 * ============================================= */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "EverestAnimations.h"

@interface SBIconView : UIView
-(void)_startEverestAnimation;
-(void)_handleTap;
@end

CGFloat animationDuration;
CGFloat offset = 0.0;

%hook SBIconView
%new
-(void)_startEverestAnimation {
	// [%c(EverestAnimations) squeezeAnimationForIconView:self withDuration:animationDuration]; offset = 0.3;
	// [%c(EverestAnimations) fadeOutAnimationForIconView:self withDuration:animationDuration];
	// [%c(EverestAnimations) spinAnimationForIconView:self withDuration:animationDuration];
	// [%c(EverestAnimations) flipVerticalOnceAnimationForIconView:self withDuration:animationDuration];
	// [%c(EverestAnimations) flipVerticalAnimationForIconView:self withDuration:animationDuration];
	// [%c(EverestAnimations) flipHorizontalOnceAnimationForIconView:self withDuration:animationDuration];
	// [%c(EverestAnimations) flipHorizontalAnimationForIconView:self withDuration:animationDuration];
	// [%c(EverestAnimations) rotateClockwiseAnimationForIconView:self withDuration:animationDuration];
	// [%c(EverestAnimations) rotateCounterClockwiseAnimationForIconView:self withDuration:animationDuration];
	// [%c(EverestAnimations) tadaAnimationForIconView:self withDuration:animationDuration];
	// [%c(EverestAnimations) bounceAnimationForIconView:self withDuration:animationDuration];
	// [%c(EverestAnimations) pulseAnimationForIconView:self withDuration:animationDuration];
	[%c(EverestAnimations) swingAnimationForIconView:self withDuration:animationDuration];
	// [%c(EverestAnimations) hingeAnimationForIconView:self withDuration:animationDuration];
	// [%c(EverestAnimations) dropAnimationForIconView:self withDuration:animationDuration];
}

-(void)tapGestureDidChange:(UITapGestureRecognizer *)sender {
	if (sender.state == UIGestureRecognizerStateEnded) {
		[self _startEverestAnimation];

		[NSTimer scheduledTimerWithTimeInterval:animationDuration - offset repeats:NO block:^(NSTimer *timer){
			self.layer.transform = CATransform3DIdentity;
			[self _handleTap];
		}];
	}
}
%end

%ctor {
	NSLog(@"chris everest loaded");

	// Settings
	animationDuration = 0.8f;
}