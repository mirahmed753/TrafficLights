//
//  ViewController.m
//  TrafficLights
//
//  Created by Mir M. Ahmed on 10/18/18.
//  Copyright © 2018 Mir M. Ahmed. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    scoreInt = 0;
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
}


- (IBAction)startStop:(id)sender {
    
    // if the score is 0, the user is playing the game for the first time or
    // the user has hit the reset button
    if(scoreInt == 0) {
        timerInt = 3;
        
        // display empty traffic light image
        self.trafficLight.image = [UIImage imageNamed:@"trafficLight.png"];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startCounter) userInfo:nil repeats:YES];
        
        // disable button so the user is unable to repeatedly press Start
        self.startButton.enabled = NO;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
        [self.startButton setTitle:@"" forState:UIControlStateNormal];
    }
    
    else {
        [scoreTimer invalidate];
        
        [self.startButton setTitle:@"Restart" forState:UIControlStateNormal];
    }
    
    // restart the timer and the score
    if(timerInt == 0) {
        scoreInt = 0;
        timerInt = 3;
    }
}


-(void)startCounter {
    timerInt -= 1;
    
    if(timerInt == 2) {
        self.trafficLight.image = [UIImage imageNamed:@"trafficLight3.png"];
    }
    
    else if(timerInt == 1) {
        self.trafficLight.image = [UIImage imageNamed:@"trafficLight2.png"];
    }
    
    else if(timerInt == 0) {
        self.trafficLight.image = [UIImage imageNamed:@"trafficLight1.png"];
        
        [timer invalidate];
        
        // enable button so the user is able to hit the Stop button
        self.startButton.enabled = YES;
        [self.startButton setTitle:@"Stop" forState:UIControlStateNormal];
        
        scoreTimer = [NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(scoreCounter) userInfo:nil repeats:YES];
    }
}

-(void)scoreCounter {
    scoreInt += 1;
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
}

@end
