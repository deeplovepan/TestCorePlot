//
//  ViewController.m
//  TestCorePlot
//
//  Created by Pan Peter on 13/4/19.
//  Copyright (c) 2013年 Pan Peter. All rights reserved.
//

#import "ViewController.h"
#import "CorePlot-CocoaTouch.h"

@interface ViewController () <CPTPlotDataSource>
{
    CPTGraphHostingView *hostView;
    NSMutableArray *plotDataArray;
}
@end

@implementation ViewController

-(void)setupPoint
{
    CPTScatterPlot *dataSourceLinePlot = [[CPTScatterPlot alloc] init];
    dataSourceLinePlot.dataSource = self;
    [hostView.hostedGraph addPlot:dataSourceLinePlot];

    CPTMutableLineStyle *lineStyle = [dataSourceLinePlot.dataLineStyle mutableCopy] ;
    lineStyle.lineWidth = 3.0;
    lineStyle.lineColor = [CPTColor greenColor];
    dataSourceLinePlot.dataLineStyle = lineStyle;
}

-(void)setupGraph
{
     CPTGraph *graph = [[CPTXYGraph alloc] initWithFrame:hostView.bounds];
     hostView.hostedGraph = graph;
    [self setupPoint];
    
}

-(void)generateData
{
    if ( plotDataArray == nil ) {
        plotDataArray = [NSMutableArray array];
        
        for ( NSUInteger i = 0; i < 11; i++ ) {
            NSNumber *x = [NSNumber numberWithDouble:i];
            NSNumber *y = [NSNumber numberWithDouble:i*3];
            [plotDataArray addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:x, @"x", y, @"y", nil]];
        }
        
    }
    
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    hostView = [(CPTGraphHostingView *) [CPTGraphHostingView alloc] initWithFrame:CGRectMake(10, 10, 300, 300)];
    hostView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:hostView];
    [self generateData];
    [self setupGraph];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CPTPlotDataSource

-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plotnumberOfRecords {
    return plotDataArray.count;
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
{
    NSNumber *num = nil;
    
    num = [plotDataArray[index] valueForKey:(fieldEnum == CPTScatterPlotFieldX ? @"x":@"y")];
    
    return num;
}


@end
