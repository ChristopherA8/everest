#import "EVERESTRootListController.h"
#import <Foundation/Foundation.h>

@implementation EVERESTRootListController

- (instancetype)init {
  self = [super init];

  if (self) {
    self.navigationItem.titleView = [UIView new];
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.text = @"Everest";
    [self.navigationItem.titleView addSubview:self.titleLabel];

    self.iconView =
        [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    self.iconView.contentMode = UIViewContentModeScaleAspectFit;
    self.iconView.image = [UIImage
        imageWithContentsOfFile:
            @"/Library/PreferenceBundles/everestprefs.bundle/icon@3x.png"];
    self.iconView.translatesAutoresizingMaskIntoConstraints = NO;
    self.iconView.alpha = 0.0;
    [self.navigationItem.titleView addSubview:self.iconView];

    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(easterEgg)];
    doubleTap.numberOfTapsRequired = 2; 
    [self.view addGestureRecognizer:doubleTap];

    self.headerView =
        [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 180)]; // 180
    self.headerView.clipsToBounds = YES;
    self.headerView.layer.cornerRadius = 12;
    UIImageView *headerImageView =
        [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 180)];
    headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    headerImageView.clipsToBounds = YES;
    headerImageView.layer.masksToBounds = YES;
    headerImageView.layer.cornerRadius = 12;
    // headerImageView.autoresizingMask = (UIViewAutoresizingFlexibleWidth |
    //                                     UIViewAutoresizingFlexibleLeftMargin
    //                                     |
    //                                     UIViewAutoresizingFlexibleRightMargin);
    if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
      headerImageView.image = [UIImage
          imageWithContentsOfFile:@"/Library/PreferenceBundles/"
                                  @"everestprefs.bundle/everest_light.png"];
    } else {
      headerImageView.image = [UIImage
          imageWithContentsOfFile:@"/Library/PreferenceBundles/"
                                  @"everestprefs.bundle/everest_dark.png"];
    }

    headerImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.headerView addSubview:headerImageView];
    // 1500x750 banner.png image size

    [NSLayoutConstraint activateConstraints:@[
      // Title
      [self.titleLabel.topAnchor
          constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
      [self.titleLabel.leadingAnchor
          constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
      [self.titleLabel.trailingAnchor
          constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
      [self.titleLabel.bottomAnchor
          constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],

      // tiny header icon
      [self.iconView.topAnchor
          constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
      [self.iconView.leadingAnchor
          constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
      [self.iconView.trailingAnchor
          constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
      [self.iconView.bottomAnchor
          constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],

      // header banner
      [headerImageView.topAnchor
          constraintEqualToAnchor:self.headerView.topAnchor
                         constant:15],
      [headerImageView.leadingAnchor
          constraintEqualToAnchor:self.headerView.leadingAnchor
                         constant:20],
      [headerImageView.trailingAnchor
          constraintEqualToAnchor:self.headerView.trailingAnchor
                         constant:-20],
      [headerImageView.bottomAnchor
          constraintEqualToAnchor:self.headerView.bottomAnchor
                         constant:-15],
    ]];
  }
  return self;
}

-(void)easterEgg {
	animation = (int)arc4random_uniform(9) + 1;
	if (animation == 1) {
		[%c(EverestAnimations) shrinkAnimationForIconView:self.headerView withDuration:duration];
	} else if (animation == 2) {
		[%c(EverestAnimations) flipVerticalAnimationForIconView:self.headerView withDuration:duration];
	} else if (animation == 3) {
		[%c(EverestAnimations) flipHorizontalAnimationForIconView:self.headerView withDuration:duration];
	} else if (animation == 4) {
		[%c(EverestAnimations) rotateClockwiseAnimationForIconView:self.headerView withDuration:duration];
	} else if (animation == 5) {
		[%c(EverestAnimations) rotateCounterClockwiseAnimationForIconView:self.headerView withDuration:duration];
	} else if (animation == 6) {
		[%c(EverestAnimations) tadaAnimationForIconView:self.headerView withDuration:duration];
	} else if (animation == 7) {
		[%c(EverestAnimations) pulseAnimationForIconView:self.headerView withDuration:duration];
	} else if (animation == 8) {
		[%c(EverestAnimations) swingAnimationForIconView:self.headerView withDuration:duration];
	} else if (animation == 9) {
	}
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  CGFloat const offsetY = scrollView.contentOffset.y;

  if (offsetY > 100) {
    [UIView animateWithDuration:0.2
                     animations:^{
                       self.iconView.alpha = 1.0;
                       self.titleLabel.alpha = 0.0;
                     }];
  } else {
    [UIView animateWithDuration:0.2
                     animations:^{
                       self.iconView.alpha = 0.0;
                       self.titleLabel.alpha = 1.0;
                     }];
  }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  tableView.tableHeaderView = self.headerView;
  return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (NSArray *)specifiers {
  if (!_specifiers) {
    _specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
  }

  return _specifiers;
}

- (void)discord {
  NSURL *discord = [NSURL URLWithString:@"https://discord.gg/zHN7yuGqYr"];
  [[UIApplication sharedApplication] openURL:discord
                                     options:@{}
                           completionHandler:nil];
}

- (void)paypal {
  NSURL *paypal = [NSURL URLWithString:@"https://paypal.me/chr1sdev"];
  [[UIApplication sharedApplication] openURL:paypal
                                     options:@{}
                           completionHandler:nil];
}

- (void)sourceCode {
  NSURL *source =
      [NSURL URLWithString:@"https://github.com/ChristopherA8/everest"];
  [[UIApplication sharedApplication] openURL:source
                                     options:@{}
                           completionHandler:nil];
}

- (void)website {
  NSURL *source = [NSURL URLWithString:@"https://christopher.jp.net"];
  [[UIApplication sharedApplication] openURL:source
                                     options:@{}
                           completionHandler:nil];
}

@end
