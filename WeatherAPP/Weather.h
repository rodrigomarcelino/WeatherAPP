//
//  Weather.h
//  WeatherAPP
//
//  Created by Rodrigo on 12/06/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property(nonatomic, strong) NSString *city;
@property(nonatomic, strong) NSString *temp;
@property(nonatomic, strong) NSString *humidity;
@property(nonatomic, strong) NSString *temp_min;
@property(nonatomic, strong) NSString *temp_max;
@property(nonatomic, strong) NSString *country;
@property(nonatomic, strong) NSString *time;

-(id)initWithDictionary:(NSDictionary *)sourceDictionary;

@end
