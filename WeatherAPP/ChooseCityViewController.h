//
//  ChooseCityViewController.h
//  WeatherAPP
//
//  Created by Rodrigo on 19/06/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface ChooseCityViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak,nonatomic) NSString *search;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) MBProgressHUD *hud;

@end
