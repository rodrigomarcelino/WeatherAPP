//
//  ChooseCityViewModel.m
//  WeatherAPP
//
//  Created by Rodrigo on 19/06/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

#import "ChooseCityViewModel.h"
#include "WeatherService.h"

@implementation ChooseCityViewModel

-(void)RequestWeatherByCit:(NSString*)city{
    
    [[WeatherService sharedInstance] GetWeatherWithCity:city success:^(Weather* weather){
        self.weather= weather;
        
    }failure:^(NSError *error) {
        //[self errorAlert];
    }];
}

-(void)RequestWeatherByCity:(NSString*)city success:(void (^)(Weather* weather))success failure:(void (^)(NSError *error))failure{
    
    [[WeatherService sharedInstance] GetWeatherWithCity:city success:^(Weather* weather){
        self.weather= weather;
        success(weather);
        
    }failure:^(NSError *error) {
        failure(error);
    }];
}

@end
