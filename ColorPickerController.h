#import <UIKit/UIKit.h>

@interface ColorPickerController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) IBOutlet UICollectionView  *stdColorsView;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) IBOutlet UILabel *showselectedColor;
@property (nonatomic, strong) NSArray    *stdColorsArray;
@property (nonatomic, strong) NSArray *redArray;
@property (nonatomic, strong) NSArray *greenArray;
@property (nonatomic, strong) NSArray *blueArray;

@property (nonatomic, strong) IBOutlet UISlider* redSlider;
@property (nonatomic, strong) IBOutlet UISlider* greenSlider;
@property (nonatomic, strong) IBOutlet UISlider* blueSlider;
@property (nonatomic, strong) IBOutlet UISlider* alphaSlider;

@property (nonatomic, readwrite) CGFloat redValue;
@property (nonatomic, readwrite) CGFloat greenValue;
@property (nonatomic, readwrite) CGFloat blueValue;
@property (nonatomic, readwrite) CGFloat alphaValue;



-(IBAction)changeColor:(id)sender ;

 @end
