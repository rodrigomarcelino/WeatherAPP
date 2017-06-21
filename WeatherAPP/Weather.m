//
//  Weather.m
//  WeatherAPP
//
//  Created by Rodrigo on 12/06/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

#import "Weather.h"


@implementation Weather:NSObject

@synthesize city, temp, humidity, temp_min, temp_max, country, time;


-(id)initWithDictionary:(NSDictionary *)sourceDictionary
{
    self = [super init];
    if (self != nil)
    {
        self.city = [sourceDictionary objectForKey:@"name"];
        self.temp = [[sourceDictionary objectForKey:@"main"] objectForKey:@"temp"];
        self.humidity = [[sourceDictionary objectForKey:@"main"] objectForKey:@"humidity"];
        self.temp_min = [[sourceDictionary objectForKey:@"main"] objectForKey:@"temp_min"];
        self.temp_max = [[sourceDictionary objectForKey:@"main"] objectForKey:@"temp_max"];
        self.country = [[sourceDictionary objectForKey:@"sys"] objectForKey:@"country"];
    }
    return self;
}

@end
