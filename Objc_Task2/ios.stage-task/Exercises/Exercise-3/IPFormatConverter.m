#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    NSMutableString *mass = [[NSMutableString alloc] initWithString: @""];
    if (numbersArray == nil || [numbersArray  isEqual: @[]]){
        return mass;
    } else if ([numbersArray  isEqual: @[]]){
        return mass;
    }
    
    for (int i = 0; i < numbersArray.count; i++){
        if ([numbersArray[i] intValue] > 255 ){
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
        else if ([numbersArray[i] intValue] < 0){
            return @"Negative numbers are not valid for input.";
        }
        else if (numbersArray.count > 1 && i <4){
            mass = [mass stringByAppendingFormat:@"%d.", [numbersArray[i] intValue]];
        }
        else if (numbersArray.count == 1){
            return [mass stringByAppendingFormat:@"%d.0.0.0", [numbersArray[i] intValue]];
        }
        
    }
    if (numbersArray.count == 2){
        return [mass stringByAppendingString:@"0.0"];
    }
    if (numbersArray.count == 3){
        return [mass stringByAppendingString:@"0"];
    }
    NSString *result = [mass substringToIndex:[mass length] - 1];
    
    return result;
}

@end
