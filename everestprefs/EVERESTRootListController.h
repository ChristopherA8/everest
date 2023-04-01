#import <Preferences/PSListController.h>

@interface EVERESTRootListController : PSListController
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIView *headerView;
@property (nonatomic, retain) UIImageView *iconView;
-(void)discord;
-(void)paypal;
-(void)sourceCode;
-(void)website;
@end
