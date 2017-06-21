//
//  ActualLocationViewController.m
//  WeatherAPP
//
//  Created by Rodrigo on 13/06/17.
//  Copyright © 2017 Rodrigo. All rights reserved.
//

#import "ActualLocationViewController.h"
#import "WeatherTableViewCell.h"
#import "ActualLocationViewModel.h"
#include "Weather.h"

@interface ActualLocationViewController ()

@property (strong, nonatomic) ActualLocationViewModel* ViewModel;
@property (strong,nonatomic) Weather* weather;

@end

@implementation ActualLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.labelText = @"Loading";
    
    self.ViewModel = [ActualLocationViewModel new];
        
        [self.ViewModel RequestWeather :^(Weather* weather1) {
            self.weather = weather1;
            [self.tableView reloadData];
            [_hud hide:NO];
        }failure:^(NSError *error) {
            [self errorAlert:@""];
            [_hud hide:NO];
        }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Manager the number of sections in the application
        return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeatherCell"];
    
    if(_weather){
    cell.city.text = [NSString stringWithFormat:@"%@ - %@",self.weather.city, self.weather.country];
    cell.temp.text = [NSString stringWithFormat:@"Temp - %@°", self.weather.temp];
    cell.temp_max.text = [NSString stringWithFormat:@"Máx - %@°", self.weather.temp_max];
    cell.temp_min.text = [NSString stringWithFormat:@"Min - %@°", self.weather.temp_min];
    cell.humidity.text = [NSString stringWithFormat:@"Umidade - %@", self.weather.humidity];
    }
    return cell;
}

-(void) errorAlert:(NSString*) message{
    //Show
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Ocorreu um erro!"
                                  message:(@"%@",message)
                                  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* Ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action){
                                                   [alert dismissViewControllerAnimated:YES completion:nil];
                                               }];
    [alert addAction:Ok];
    [self presentViewController:alert animated:YES completion:nil];
    
}

@end
