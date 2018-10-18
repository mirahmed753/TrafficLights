//
//  ViewController.h
//  TrafficLights
//
//  Created by Mir M. Ahmed on 10/18/18.
//  Copyright © 2018 Mir M. Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSTimer *timer;
    NSTimer *scoreTimer;
    
    int timerInt;
    int scoreInt; 
}

@property (weak, nonatomic) IBOutlet UIImageView *trafficLight;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)startStop:(id)sender;

@end

