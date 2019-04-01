#import "KidnapperNote.h"

@implementation KidnapperNote

- (BOOL) checkMagazine:(NSString *)magaine note:(NSString *)note {
    
    BOOL result = NO;
    
    [magaine retain];
    
    [note retain];
    
    NSMutableCharacterSet *letters = [NSMutableCharacterSet whitespaceAndNewlineCharacterSet];
    
    [letters formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];
    
    NSArray *firstArray = [[note lowercaseString] componentsSeparatedByCharactersInSet:letters];
    
    NSArray *secondArray = [[magaine lowercaseString] componentsSeparatedByCharactersInSet:letters];
    
    NSCountedSet *firstSet = [[NSCountedSet alloc] initWithArray:firstArray];
    
    NSCountedSet *secondSet = [[NSCountedSet alloc] initWithArray:secondArray];
    
    [firstSet minusSet:secondSet];
    
    if (firstSet.count == 0) {
        
        result = YES;
        
    }
    
    return result;
    
    [magaine release];
    
    [note release];
    
    [letters release];
    
    [firstArray release];
    
    [secondArray release];
    
    [firstSet release];
    
    [note release];
    
    return result;
}

@end



