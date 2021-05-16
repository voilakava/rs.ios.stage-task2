#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    if (array == nil || [array isEqualToArray:@[]] || ![array[0] isKindOfClass:[NSArray class]])  {
        return @[];
    }
    
    NSMutableArray<NSNumber *> *intArr = [NSMutableArray array];
    NSMutableArray<NSString *> *strArr = [NSMutableArray array];
    
    
    for (NSArray *subarray in array) {
           
           if ([subarray count] == 0) {
               continue;
           }
           if ([[subarray objectAtIndex:0] isKindOfClass:[NSNumber class]]) {
               for (NSNumber *number in subarray) {
                   [intArr addObject:number];
               }
           } else {
               for (NSString *string in subarray) {
                   [strArr addObject:string];
               }
           }
       }
       
       [intArr sortUsingComparator:^NSComparisonResult(id f, id s) {
           return [(NSNumber *) f intValue] - [(NSNumber *) s intValue];
       }];
       
       [strArr sortUsingComparator:^NSComparisonResult(id f, id s) {
           return [intArr count] == 0
           ? [(NSString *) f characterAtIndex:0] - [(NSString *) s characterAtIndex:0]
           : [(NSString *) s characterAtIndex:0] - [(NSString *) f characterAtIndex:0];
       }];
       
       if ([intArr count] != 0 && [strArr count] != 0) {
           return @[intArr, strArr];
       }
       
       return [intArr count] != 0 ? intArr : strArr;
}
@end
