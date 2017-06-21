//
//  WelcomeViewController.h
//  WeatherAPP
//
//  Created by Rodrigo on 21/06/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface WelcomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *name;
- (IBAction)segue:(UIButton *)sender;
@property (nonatomic, retain) MBProgressHUD *hud;

@end
