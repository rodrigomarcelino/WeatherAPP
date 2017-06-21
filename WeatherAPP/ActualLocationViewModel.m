//
//  ActualLocationViewModel.m
//  WeatherAPP
//
//  Created by Rodrigo on 14/06/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

#import "ActualLocationViewModel.h"
#include "WeatherService.h"
#include "Weather.h"

@implementation ActualLocationViewModel

-(void)GetLocation{
    locationManagerApp=[[CLLocationManager alloc] init];
    
    locationManagerApp.delegate = self;
    locationManagerApp.distanceFilter = kCLDistanceFilterNone;
    locationManagerApp.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        [locationManagerApp requestAlwaysAuthorization];
    }
    
    [locationManagerApp startUpdatingLocation];
    CLLocation *location1 = [locationManagerApp location];
    CLLocationCoordinate2D coordinate = [location1 coordinate];
    NSString* latValue;
    NSString* longValue;
    latValue= [NSString stringWithFormat:@"%f", coordinate.latitude];
    longValue= [NSString stringWithFormat:@"%f", coordinate.longitude];
    [self RequestWeatherByLocation :latValue :longValue];
}

-(void)RequestWeatherByLocation:(NSString*)lat : (NSString*)lon{
    
    [[WeatherService sharedInstance] GetWeatherWithCoordinates:lat :lon success:^(Weather* weather){
        
        self.weather = weather;
    }failure:^(NSError *error) {
        //[self errorAlert];
    }];
}

-(void)RequestWeather:(void (^)(Weather* weather))success failure:(void (^)(NSError *error))failure{
    
    locationManagerApp=[[CLLocationManager alloc] init];
    
    locationManagerApp.delegate = self;
    locationManagerApp.distanceFilter = kCLDistanceFilterNone;
    locationManagerApp.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        [locationManagerApp requestAlwaysAuthorization];
    }
    
    [locationManagerApp startUpdatingLocation];
    CLLocation *location1 = [locationManagerApp location];
    CLLocationCoordinate2D coordinate = [location1 coordinate];
    NSString* latValue;
    NSString* longValue;
    latValue= [NSString stringWithFormat:@"%f", coordinate.latitude];
    longValue= [NSString stringWithFormat:@"%f", coordinate.longitude];
    
    [[WeatherService sharedInstance] GetWeatherWithCoordinates:latValue :longValue success:^(Weather* weather){
        
        success (weather);
    }failure:^(NSError *error) {
        //[self errorAlert];
    }];
}



@end
