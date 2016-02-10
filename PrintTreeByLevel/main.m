//
//  main.m
//  PrintTreeByLevel
//
//  Created by Andrey Kasatkin on 2/10/16.
//
//

#import <UIKit/UIKit.h>

@interface  NSMutableArray (QueueAdditions)
- (id) dequeue;
- (void) enqueue: (id)obj;
@end

@implementation  NSMutableArray (QueueAdditions)

- (id) dequeue {
    id headObject = [self objectAtIndex:0];
    if (headObject != nil) {
        [self removeObjectAtIndex:0];
    }
    return headObject;
}

- (void) enqueue:(id)obj{
    [self addObject:obj];
}
@end

@interface Node : NSObject

@property NSObject *left;
@property NSObject *right;
@property NSString *value;

@end

@implementation Node

@end

@interface Solution : NSObject

@end

@implementation Solution{
    
}

+(NSString*) printTree:(Node*)node{
    
    if (node == nil){
        return @"";
    }
    
    NSMutableString *result = [[NSMutableString alloc] init];
    NSMutableArray *queue = [[NSMutableArray alloc] init];
    [queue enqueue:node];
    [queue enqueue:[NSNull null]];
    while (true){
        Node *curObject = [queue dequeue];
        if ([curObject isEqual:[NSNull null]]){
            [result appendString:@"\n"];
            
            if ([queue count] == 0){
                break;
            }
            [queue addObject:[NSNull null]];
            continue;
        }
        [result appendString:curObject.value];
        
        if (curObject.left){
            [queue enqueue:curObject.left];
        }
        if (curObject.right){
            [queue enqueue:curObject.right];
        }
        
    }
    
    return result;
}
@end

int main(int argc, char * argv[]) {
    @autoreleasepool {
     
        NSLog(@"printTree: %@", [Solution printTree:nil]); //printTree:
        Node* testNode = [[Node alloc] init];
        //just one node
        testNode.value = @"A";
        NSLog(@"printTree: %@", [Solution printTree:testNode]); //printTree: A
        
        Node *testNodeB = [[Node alloc] init];
        testNodeB.value = @"B";
        
        Node *testNodeC = [[Node alloc] init];
        testNodeC.value = @"C";
        
        testNode.left = testNodeB;
        testNode.right = testNodeC;
        
        NSLog(@"printTree: %@", [Solution printTree:testNode]); //printTree: A
        // BC
        
        Node *testNodeD = [[Node alloc] init];
        testNodeD.value = @"D";
        
        Node *testNodeE = [[Node alloc] init];
        testNodeE.value = @"E";
        
        Node *testNodeF = [[Node alloc] init];
        testNodeF.value = @"F";
        
        testNodeB.left = testNodeD;
        testNodeB.right = testNodeE;
        testNodeC.right = testNodeF;
        
        NSLog(@"printTree: %@", [Solution printTree:testNode]); //printTree: printTree: A
        // BC
        // DEF
        
       
    }
}
