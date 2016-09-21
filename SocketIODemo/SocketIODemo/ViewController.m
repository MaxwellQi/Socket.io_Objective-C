//
//  ViewController.m
//  SocketIODemo
//
//  Created by zhangqi on 20/9/2016.
//  Copyright © 2016 MaxwellQi. All rights reserved.
//

#import "ViewController.h"
#import <SocketIOClientSwift/SocketIOClientSwift-Swift.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://10.12.23.232:9000"];
    SocketIOClient *socket = [[SocketIOClient alloc] initWithSocketURL:url options:@{@"log": @YES, @"forcePolling": @YES}];
    
    [socket on:@"connect" callback:^(NSArray* data, SocketAckEmitter* ack) {
        [socket emit:@"login" withItems:@[@"qizhang123"]];
    }];
    
    [socket on:@"login" callback:^(NSArray* data, SocketAckEmitter* ack) {
        
    }];
    [socket connect];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
