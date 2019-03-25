#import "Diagonal.h"

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
    NSInteger summ1 = 0;
    NSInteger summ2 = 0;
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity:[array count]];

    [array enumerateObjectsUsingBlock:^(NSString *str, NSUInteger index, BOOL *stop) {
        [newArray addObject:[str componentsSeparatedByString:@" "]];
    }];
    
    for (int x = 0; x < [newArray count];  x++) {
         summ1 += [(NSNumber *)newArray[x][x]  integerValue];
         summ2 += [(NSNumber *)newArray[([newArray count] - x - 1)][x] integerValue];
     }
    [newArray release];
    
    
    return @(abs(summ1 - summ2));
    
}

@end
