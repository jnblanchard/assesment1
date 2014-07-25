#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *componentOneTextField;  // Left-most opening textfield
@property (weak, nonatomic) IBOutlet UITextField *componentTwoTextField;  // Right-most opening textfield
@property (weak, nonatomic) IBOutlet UILabel *resultTextLabel;            // Product is stored and shown on this label
@end

@implementation ViewController
BOOL negativeStateOne = NO;
BOOL negativeStateTwo = NO;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)negativeStateForComponentOne:(id)sender {
    if(negativeStateOne == NO) {
        negativeStateOne = YES;
        self.componentOneTextField.text = [@"-" stringByAppendingString:self.componentOneTextField.text];
    }else {
        self.componentOneTextField.text = [self.componentOneTextField.text stringByReplacingOccurrencesOfString:@"-" withString:@""];
        negativeStateOne = NO;
    }
}

- (IBAction)negativeStateForComponentTwo:(id)sender {
    if(negativeStateTwo == NO) {
        negativeStateTwo = YES;
        self.componentTwoTextField.text = [@"-" stringByAppendingString:self.componentTwoTextField.text];
    }else {
        negativeStateTwo = NO;
        self.componentTwoTextField.text = [self.componentTwoTextField.text stringByReplacingOccurrencesOfString:@"-" withString:@""];
    }
}

/* multiplyComponents() - instance method (Multiply Button)    */
/* Action connected to "Multiply button on opening view        */
/* Close all texts fields                                      */
/* Cast the textfield's text as float and compute product      */
/* If the result is negative make background red               */
/* Else the result is positive or 0 make background green      */
/* Set label text to the product                               */
- (IBAction)multiplyComponents:(id)sender {
    [self.componentOneTextField resignFirstResponder];                      // Close textfield One
    [self.componentTwoTextField resignFirstResponder];                      // Close textfield Two
    float componentOne = [self.componentOneTextField.text floatValue];          // Cast textfield One text as float
    float componentTwo = [self.componentTwoTextField.text floatValue];          // Cast textfield Two text as float
    float result = componentOne * componentTwo;                               // Compute the product of cast float

    if(result < 0)                                                          // Switch - IF negative make label background red
    {
        self.resultTextLabel.backgroundColor = [UIColor redColor];
    }
    else {
        self.resultTextLabel.backgroundColor = [UIColor greenColor];        // Switch - IF positive or 0 make label background green
    }

    self.resultTextLabel.text = [NSString stringWithFormat:@"%.02f", result];  // Display product in label textfield
}

@end
