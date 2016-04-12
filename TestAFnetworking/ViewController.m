//
//  ViewController.m
//  TestAFnetworking
//
//  Created by MACBOOK AIR on 4/11/16.
//  Copyright © 2016 NamLD. All rights reserved.
//

#import "ViewController.h"
#import "AFURLSessionManager.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://game.sabi.vn/api/games/getDataHome.aspx?zip=1&token=edugame@idtvn&c=10"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            //NSLog(@"response : %@\n responseObject : %@", response, responseObject);
            NSLog(@" game : %@", [[[[responseObject valueForKey:@"data"] valueForKey:@"game"] objectAtIndex:0] valueForKey:@"content"]);
        }
    }];
    [dataTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
