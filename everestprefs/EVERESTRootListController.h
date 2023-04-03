#import <Preferences/PSListController.h>
#import "EverestAnimations.h"

int animation;
CGFloat duration = 0.8f;

@interface EVERESTRootListController : PSListController
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIView *headerView;
@property (nonatomic, retain) UIImageView *iconView;
-(void)easterEgg;
-(void)discord;
-(void)paypal;
-(void)sourceCode;
-(void)website;
@end
