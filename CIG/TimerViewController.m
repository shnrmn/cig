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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _delegate = [[UIApplication sharedApplication] delegate];
    
    _minuteStepper.value = 4;
    _minuteStepper.wraps = YES;
    _minuteStepper.autorepeat = YES;
    _currMinutes = _minuteStepper.value;
    
    _secondStepper.value = 0;
    _secondStepper.wraps = YES;
    _secondStepper.autorepeat = YES;
    _currSeconds = _secondStepper.value;
    
    _minuteStepper.maximumValue = 99;
    _secondStepper.maximumValue = 59;
    
    [self.view setBackgroundColor:_delegate.brandWhite];
    
    [self setTimeText];
}

- (IBAction)start:(id)sender
{
    if(!_timer.isValid)
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
}

- (void)timerFired
{
    if((_currMinutes>0 || _currSeconds>=0) && _currMinutes>=0)
    {
        if(_currSeconds==0)
        {
            _currMinutes-=1;
            _currSeconds=59;
        }
        else if(_currSeconds>0)
        {
            _currSeconds-=1;
        }
        if(_currMinutes>-1)
            [self setTimeText];
    }
    else
    {
        [_timer invalidate];
    }
}

- (IBAction)stop:(id)sender
{
    [_timer invalidate];
}

- (IBAction)reset:(id)sender
{
    [_timer invalidate];
    _currMinutes = _minuteStepper.value;
    _currSeconds = _secondStepper.value;
    [self setTimeText];
}

- (IBAction)minuteValueChanged:(UIStepper *)sender
{
    [_timer invalidate];
    _currMinutes = [sender value];
    _currSeconds = _secondStepper.value;
    [self setTimeText];
}

- (IBAction)secondValueChanged:(UIStepper *)sender
{
    [_timer invalidate];
    _currMinutes = _minuteStepper.value;
    _currSeconds = [sender value];
    [self setTimeText];
}

- (void)setTimeText
{
    [_progress setText:[NSString stringWithFormat:@"%d%@%02d",_currMinutes,@":",_currSeconds]];
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
