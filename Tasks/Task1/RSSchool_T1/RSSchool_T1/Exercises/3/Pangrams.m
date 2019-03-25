#import "Pangrams.h"

@implementation Pangrams

// Complete the pangrams function below.
- (BOOL)pangrams:(NSString *)string {
    
    //NSArray *letters = [[NSArray alloc] initWithObjects:@"a", @"b", @"c", @"d" @"e" @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", nil];
    
    NSInteger letters = 26;
    
    NSMutableSet *set = [[NSMutableSet alloc] init];
    
    NSMutableString *str = [[NSMutableString alloc] initWithString:[[[string componentsSeparatedByString:@" "] componentsJoinedByString:@""] lowercaseString]];
    
    for (NSInteger x = 0; x < [str length]; x++) {
        
        [set addObject:[NSString stringWithFormat:@"%c", [str characterAtIndex:x]]];
        
    }
    
    NSInteger number = [set count];

    [set release];
    
    [str release];
    
    return number == letters;
    
}

@end



