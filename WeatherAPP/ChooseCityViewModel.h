//
//  ChooseCityViewModel.h
//  WeatherAPP
//
//  Created by Rodrigo on 19/06/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Weather.h"

@interface ChooseCityViewModel : NSObject

@property(strong,nonatomic)Weather* weather;

-(void)RequestWeatherByCit:(NSString*)city;
-(void)RequestWeatherByCity:(NSString*)city success:(void (^)(Weather* weather))success failure:(void (^)(NSError *error))failure;

@end
