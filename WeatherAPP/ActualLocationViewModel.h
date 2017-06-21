//
//  ActualLocationViewModel.h
//  WeatherAPP
//
//  Created by Rodrigo on 14/06/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#include "Weather.h"

@interface ActualLocationViewModel : NSObject <CLLocationManagerDelegate>{
    CLLocationManager *locationManagerApp;
}

@property(strong,nonatomic)Weather* weather;

-(Weather*)GetLocation;
-(void)RequestWeatherByLocation:(NSString*)lat : (NSString*)lon;
-(void)RequestWeather:(void (^)(Weather* weather))success failure:(void (^)(NSError *error))failure;

@end
