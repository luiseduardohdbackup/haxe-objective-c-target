//
//  PiratePigGame
//  PiratePig
//
//  Source generated by Haxe Objective-C target
//


#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>

#import "Array.h"
#import "Tile.h"
#import "Math.h"
#import "PiratePigGame.h"
#import "Std.h"

@interface PiratePigGame : UIView 

+ (int) NUM_COLUMNS:(int)val;
+ (int) NUM_ROWS:(int)val;
+ (NSMutableArray*) tileImages:(NSMutableArray*)val;
@property (nonatomic, strong) UIView *Background;
@property (nonatomic, strong) UIImageView *Logo;
@property (nonatomic, strong) UILabel *Score;
@property (nonatomic, strong) UIView *TileContainer;
@property (nonatomic) float currentScale;
@property (nonatomic) int currentScore;
@property (nonatomic) CGPoint cacheMouse;
@property (nonatomic) BOOL needToCheckMatches;
@property (nonatomic, strong) Tile *selectedTile;
@property (nonatomic, strong) NSMutableArray *tiles;
@property (nonatomic, strong) NSMutableArray *usedTiles;
- (void) addTile:(int)row column:(int)column animate:(BOOL)animate;
- (void) construct;
- (void) dropTiles;
- (NSMutableArray*) findMatches:(BOOL)byRow accumulateScore:(BOOL)accumulateScore;
- (CGPoint) getPosition:(int)row column:(int)column;
- (void) initialize;
- (void) newGame;
- (void) removeTile:(int)row column:(int)column animate:(BOOL)animate;
- (void) resize:(int)newWidth newHeight:(int)newHeight;
- (void) swapTile:(Tile*)tile targetRow:(int)targetRow targetColumn:(int)targetColumn;
- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)withEvent;
- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)withEvent;
- (void) touchesEnded:(NSSet*)touches withEvent:(UIEvent*)withEvent;
- (void) touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)withEvent;
- (id) init;

@end
