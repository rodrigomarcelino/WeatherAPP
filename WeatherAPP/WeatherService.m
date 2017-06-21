//
//  WeatherService.m
//  WeatherAPP
//
//  Created by Rodrigo on 12/06/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

#import "WeatherService.h"

@implementation WeatherService

+ (id)sharedInstance {
    static WeatherService *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

-(NSURLSessionDataTask *) GetWeatherWithCity:(NSString *)city success:(void (^)(Weather* now))success failure:(void (^)(NSError *error))failure{
    NSString *name = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)city, NULL, CFSTR("!*'();:@&=+$,/?%#[]"), kCFStringEncodingUTF8));
    NSString *link = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?q=%@&units=metric&APPID=4899f0f33f91ac6422946c7aaf7598d6",name];
    NSURL *URL = [NSURL URLWithString:link];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    return [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        if ([[responseObject objectForKey:@"Response"] isEqualToString:@"False"]) {
            success(NULL);
        }
        else {
            Weather* weather = [[Weather alloc]initWithDictionary:responseObject];
            success (weather);
        }
    }
                failure:^(NSURLSessionTask *operation, NSError *error) {
                    failure(error);
                    NSLog(@"Error: %@", error);
                }];
}

-(NSURLSessionDataTask *) GetWeatherWithCoordinates:(NSString *)lat :(NSString *)lon success:(void (^)(Weather* now))success failure:(void (^)(NSError *error))failure{
    NSString *link = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?lat=%@&lon=%@&units=metric&APPID=4899f0f33f91ac6422946c7aaf7598d6",lat,lon];
    NSURL *URL = [NSURL URLWithString:link];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    return [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        if ([[responseObject objectForKey:@"Response"] isEqualToString:@"False"]) {
            success(NULL);
        }
        else {
            Weather* weather = [[Weather alloc]initWithDictionary:responseObject];
            success (weather);
        }
    }
                failure:^(NSURLSessionTask *operation, NSError *error) {
                    NSLog(@"Error: %@", error);
                }];
}


@end
