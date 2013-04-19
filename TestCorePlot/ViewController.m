//
//  ViewController.m
//  TestCorePlot
//
//  Created by Pan Peter on 13/4/19.
//  Copyright (c) 2013年 Pan Peter. All rights reserved.
//

#import "ViewController.h"
#import "CorePlot-CocoaTouch.h"

@interface ViewController ()
{
    CPTGraphHostingView *hostView;
}
@end

@implementation ViewController

-(void)setupGraph
{
     CPTGraph *graph = [[CPTXYGraph alloc] initWithFrame:hostView.bounds];
     hostView.hostedGraph = graph;

}   

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    hostView = [(CPTGraphHostingView *) [CPTGraphHostingView alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
    hostView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:hostView];
    [self setupGraph];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
