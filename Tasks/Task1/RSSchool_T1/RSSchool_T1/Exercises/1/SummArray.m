#import "SummArray.h"

@implementation SummArray

// Complete the summArray function below.
- (NSNumber *)summArray:(NSArray *)array {
    NSInteger summ = 0;
    for (NSNumber *element in array) {
        summ += [element integerValue];
        [element release];
    }
    return @(summ);
}

@end
