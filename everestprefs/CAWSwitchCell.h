#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface PSTableCell : UITableViewCell
@end
@interface PSControlTableCell : PSTableCell
- (UIControl *)control;
@end
@interface PSSwitchTableCell : PSControlTableCell
- (id)initWithStyle:(int)style reuseIdentifier:(id)identifier specifier:(id)specifier;
@end

@interface CAWSwitchCell : PSSwitchTableCell
@end