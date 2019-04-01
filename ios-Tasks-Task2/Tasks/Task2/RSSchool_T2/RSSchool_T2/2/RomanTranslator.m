#import "RomanTranslator.h"

@interface RomanTranslator ()

@property (retain, nonatomic) NSDictionary* romanNumbers;

@property (retain, nonatomic) NSDictionary* arabicNumbers;

@end

@implementation RomanTranslator

- (instancetype) init {
    
    if (self = [super init]){
        
        _romanNumbers = @{@1: @"I", @5: @"V", @10: @"X", @50: @"L", @100: @"C", @500: @"D", @1000: @"M"};
        
        _arabicNumbers = @{@"I": @1, @"V": @5, @"X": @10, @"L": @50, @"C": @100, @"D": @500, @"M": @1000};
    }
    return self;
}

- (NSString*) firstTranslation: (NSInteger) number andRank: (NSInteger) rank {
    
    NSInteger first = pow(10, rank);
    
    NSInteger second = number * first;
    
    NSString *string = [self.romanNumbers objectForKey:[NSNumber numberWithInteger:second]];
    
    NSMutableString *mutableStr = [[NSMutableString alloc] init];
    
    if (!string){
        
    if (number <= 4) {
            
            if (number == 4) {
                
                [mutableStr appendString:[self.romanNumbers objectForKey:[NSNumber numberWithInteger:1*first]]];
                
                [mutableStr appendString:[self.romanNumbers objectForKey:[NSNumber numberWithInteger:5 * first]]];
                
            }
            else {
                
                for (int x = 0; x < number; x++ ) {
                    
                    [mutableStr appendString:[self.romanNumbers objectForKey:[NSNumber numberWithInteger:1*first]]];
                }
                
            }
        
        }
        
        else if (number > 5 && number <= 9) {
            
            if (number == 9){
                
                [mutableStr appendString:[self.romanNumbers objectForKey:[NSNumber numberWithInteger:1 * first]]];
                
                [mutableStr appendString:[self.romanNumbers objectForKey:[NSNumber numberWithInteger:10 * first]]];
            }
            else {
                
                [mutableStr appendString:[self.romanNumbers objectForKey:[NSNumber numberWithInteger:5 * first]]];
                
                for (int x = 0; x < number - 5; x++) {
                    
                    [mutableStr appendString:[self.romanNumbers objectForKey:[NSNumber numberWithInteger:1 * first]]];
                }
                
            }
            
        }
        
        return [mutableStr autorelease];
        
    }
    
    else {
        
        [mutableStr release];
        
        return [string autorelease];
    }
}

- (NSString *)romanFromArabic:(NSString *)arabicString {
    
    [arabicString retain];
    
    NSInteger first = [arabicString integerValue];
    
    if (first <= 0&& first > 3999) {
        
        return [[[NSString alloc] initWithFormat:@"Invalid value!"] autorelease];
        
    }
    
    __block NSMutableString *result = [[[NSMutableString alloc] init] autorelease];
    
    __block NSInteger idx = 0;
    
    [arabicString enumerateSubstringsInRange:NSMakeRange(0, arabicString.length) options:NSStringEnumerationByComposedCharacterSequences|NSStringEnumerationReverse usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        
        NSInteger number = [substring integerValue];
        
        [result insertString:[self firstTranslation:number andRank:idx] atIndex:0];
        
        idx++;
        
        NSLog(@" %@", substring);
        
    }];
    
    NSLog(@" %@", result);
    
    [arabicString release];
    
    return result;
}

- (NSInteger) secondTranslation:(NSString*) number {
    
    [number retain];
    
    NSInteger result = [[self.arabicNumbers objectForKey:number] integerValue];
    
    [number release];
    
    return result;
}

- (NSString *)arabicFromRoman:(NSString *)romanString {
    
    [romanString retain];
    
    if (romanString.length == 0) {
        
        return [[[NSString alloc] initWithFormat:@"Invalid value!"] autorelease];
        
    }
    
    __block NSInteger sum = 0;
    
    __block NSInteger prevValue = [[self.arabicNumbers objectForKey:@"M"] integerValue];
    
    [romanString enumerateSubstringsInRange:NSMakeRange(0, romanString.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        
        NSInteger currentValue = [self secondTranslation:substring];
        
        if (prevValue >= currentValue) {
            
            sum += currentValue;
        }
        else {
            
            sum += currentValue;
            
            sum -= prevValue * 2;
        }
        prevValue = currentValue;
        
        NSLog(@" %@", substring);
        
    }];
    
    NSString *result = [[[NSString alloc] initWithFormat:@"%ld", (long)sum] autorelease];
    
    NSLog(@" %@", result);
    
    [romanString release];
    
    return result;
}

-(void)dealloc {
    
    [_romanNumbers release];
    
    [_arabicNumbers release];
    
    [super dealloc];
}

@end
