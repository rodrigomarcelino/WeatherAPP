//
//  ActualLocationViewController.h
//  WeatherAPP
//
//  Created by Rodrigo on 13/06/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface ActualLocationViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) MBProgressHUD *hud;

@end
