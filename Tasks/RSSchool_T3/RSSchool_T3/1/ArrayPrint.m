#import "ArrayPrint.h"

@implementation ArrayPrint : NSObject

- (NSString *)print {
    
    NSMutableString *string = [NSMutableString new];
    [string appendFormat:@"["];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSObject *x in array) {
        
        if ([x isKindOfClass:[NSNumber class]]) {
            if (![x isEqual:array.lastObject]) {
            [string appendFormat:@"%@,", x];
            } else {
                [string appendFormat:@"%@]", x];
            }
        } else if ([x isMemberOfClass:[NSString class]]) {
            if (![x isEqual:array.lastObject]) {
                [string appendFormat:@"\"%@,\"", x];
            } else {
                [string appendFormat:@"%@]", x];
            }
        } else if ([x isMemberOfClass:[NSArray class]]) {
            if (![x isEqual:array.lastObject]) {
                [string appendFormat:@"[%@],", x];
            } else {
                [string appendFormat:@"[%@]]", x];
            }
        } else if ([x isMemberOfClass:[NSNull class]]) {
            if (![x isEqual:array.lastObject]) {
                [string appendFormat:@"null,"];
            } else {
                [string appendFormat:@"null]"];
            }
        } else {
            if (![x isEqual:array.lastObject]) {
                [string appendFormat:@"unsupported,"];
            } else {
                [string appendFormat:@"unsupported]"];
            }
        }
    }
    return string;
}
    
@end


    

