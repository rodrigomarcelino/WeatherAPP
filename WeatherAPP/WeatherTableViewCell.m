//
//  WeatherTableViewCell.m
//  WeatherAPP
//
//  Created by Rodrigo on 14/06/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

#import "WeatherTableViewCell.h"

@interface WeatherTableViewCell()

@end

@implementation WeatherTableViewCell

-(void)awakeFromNib {
    [super awakeFromNib];
    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:self.frame];
    [backgroundImage setImage:[UIImage imageNamed:@"bg.jpg"]];
    [backgroundImage setContentMode:UIViewContentModeScaleAspectFill];
    [self insertSubview:backgroundImage atIndex:0];
}

@end
