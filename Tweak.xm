/* =============================================
 *                    Everest
 *
 *                   Developer -
 *              Christopher Anderson
 *
 *          Some animations taken from -
 *  https://github.com/daltoniam/DCAnimationKit
 * ============================================= */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>
#import "EverestAnimations.h"

@interface SBIconView : UIView
-(void)_startEverestAnimation:(int)option;
-(void)_handleTap;
@end

HBPreferences *preferences;
CGFloat duration = 0.8f;
CGFloat offset = 0.0f;
int animation = 1;

%hook SBIconView
%new
-(void)_startEverestAnimation:(int)option {
	if (option == 0) { // isRandom
		animation = (int)arc4random_uniform(12) + 1;
	} else {
		animation = [preferences integerForKey:@"animation"];
	}
	
	if (animation == 1) {
		[%c(EverestAnimations) shrinkAnimationForIconView:self withDuration:duration];
	} else if (animation == 2) {
		[%c(EverestAnimations) fadeOutAnimationForIconView:self withDuration:duration];
	} else if (animation == 3) {
		[%c(EverestAnimations) flipVerticalAnimationForIconView:self withDuration:duration];
	} else if (animation == 4) {
		[%c(EverestAnimations) flipVerticalOnceAnimationForIconView:self withDuration:duration];
	} else if (animation == 5) {
		[%c(EverestAnimations) flipHorizontalAnimationForIconView:self withDuration:duration];
	} else if (animation == 6) {
		[%c(EverestAnimations) flipHorizontalOnceAnimationForIconView:self withDuration:duration];
	} else if (animation == 7) {
		[%c(EverestAnimations) rotateClockwiseAnimationForIconView:self withDuration:duration];
	} else if (animation == 8) {
		[%c(EverestAnimations) rotateCounterClockwiseAnimationForIconView:self withDuration:duration];
	} else if (animation == 9) {
		[%c(EverestAnimations) tadaAnimationForIconView:self withDuration:duration];
	} else if (animation == 10) {
		[%c(EverestAnimations) pulseAnimationForIconView:self withDuration:duration];
	} else if (animation == 11) {
		[%c(EverestAnimations) swingAnimationForIconView:self withDuration:duration];
	} else if (animation == 12) {
		[%c(EverestAnimations) squeezeAnimationForIconView:self withDuration:duration];
	}
}

-(void)tapGestureDidChange:(UITapGestureRecognizer *)sender {
	if (sender.state == UIGestureRecognizerStateEnded) {
		if (![preferences boolForKey:@"enabled"]) return [self _handleTap];

		duration = [preferences floatForKey:@"duration"];
		[self _startEverestAnimation:[preferences integerForKey:@"animation"]];
		[NSTimer scheduledTimerWithTimeInterval:duration - offset repeats:NO block:^(NSTimer *timer){
			self.layer.transform = CATransform3DIdentity;
			offset = 0.0f;
			[self _handleTap];
		}];
	}
}
%end

%ctor {
	preferences = [[HBPreferences alloc] initWithIdentifier:@"com.christopher.everestprefs"];
	[preferences registerFloat:&duration default:0.8f forKey:@"duration"];
	[preferences registerDefaults:@{
        @"enabled": @YES,
        @"animation": @0
    }];
}