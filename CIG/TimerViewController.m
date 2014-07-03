//
//  TimerViewController.m
//  CIG
//
//  Created by Shawn Norman on 2014-06-12.
//  Copyright (c) 2014 Shawn Norman. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@end

const int initialMinutes = 4;
const int initialSeconds = 0;
const int maxMinutes = 99;
const int maxSeconds = 59;

@implementation TimerViewController

static TimerViewController *singleTimerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// Initialize the steppers and set the timer text.
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _minuteStepper.value = initialMinutes;
    _minuteStepper.wraps = YES;
    _minuteStepper.autorepeat = YES;
    _currentMinutes = _minuteStepper.value;
    
    _secondStepper.value = initialSeconds;
    _secondStepper.wraps = YES;
    _secondStepper.autorepeat = YES;
    _currentSeconds = _secondStepper.value;
    
    _minuteStepper.maximumValue = maxMinutes;
    _secondStepper.maximumValue = maxSeconds;
    
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    [self setTimeText];
}

// Start the timer.
- (IBAction)start:(id)sender
{
    if(!_timer.isValid)
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
}

// Reduce the seconds by 1.
- (void)timerFired
{
    if((_currentMinutes>0 || _currentSeconds>=0) && _currentMinutes>=0)
    {
        if(_currentSeconds==0)
        {
            _currentMinutes-=1;
            _currentSeconds=maxSeconds;
        }
        else if(_currentSeconds>0)
        {
            _currentSeconds-=1;
        }
        if(_currentMinutes>-1)
            [self setTimeText];
    }
    else
    {
        [_timer invalidate];
    }
}

// Stop the timer.
- (IBAction)stop:(id)sender
{
    [_timer invalidate];
}

// Reset the timer to the value of the steppers.
- (IBAction)reset:(id)sender
{
    [_timer invalidate];
    _currentMinutes = _minuteStepper.value;
    _currentSeconds = _secondStepper.value;
    [self setTimeText];
}

// Change the minute value to reflect the stepper increment.
- (IBAction)minuteValueChanged:(UIStepper *)sender
{
    [_timer invalidate];
    _currentMinutes = [sender value];
    _currentSeconds = _secondStepper.value;
    [self setTimeText];
}

// Change the second value to reflect the stepper increment.
- (IBAction)secondValueChanged:(UIStepper *)sender
{
    [_timer invalidate];
    _currentMinutes = _minuteStepper.value;
    _currentSeconds = [sender value];
    [self setTimeText];
}

// Set the UILabel for the time.
- (void)setTimeText
{
    [_progress setText:[NSString stringWithFormat:@"%d%@%02d",_currentMinutes,@":",_currentSeconds]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
