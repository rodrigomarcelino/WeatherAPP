//
//  WeatherService.h
//  WeatherAPP
//
//  Created by Rodrigo on 12/06/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Weather.h"

@interface WeatherService : NSObject

+ (id)sharedInstance;
-(NSURLSessionDataTask *) GetWeatherWithCity:(NSString *)city success:(void (^)(Weather* now))success failure:(void (^)(NSError *error))failure;
-(NSURLSessionDataTask *) GetWeatherWithCoordinates:(NSString *)lat :(NSString *)lon success:(void (^)(Weather* now))success failure:(void (^)(NSError *error))failure;
@end
