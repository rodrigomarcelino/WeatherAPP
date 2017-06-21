//
//  WeatherTableViewCell.h
//  WeatherAPP
//
//  Created by Rodrigo on 14/06/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weather.h"

@class WeatherTableViewCell;

@protocol CartDeliveryAddressTableViewCellDelegate <NSObject>

@end

@interface WeatherTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *temp;
@property (weak, nonatomic) IBOutlet UILabel *humidity;
@property (weak, nonatomic) IBOutlet UILabel *temp_min;
@property (weak, nonatomic) IBOutlet UILabel *temp_max;

@end
