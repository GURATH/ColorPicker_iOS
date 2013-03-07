static float redColor = 0.157;
static float greenColor = 0.627;
static float blueColor = 0.627;
static float alphaVal = 1.0;

#import "ColorPickerController.h"

@interface ColorPickerController ()

@end

@implementation ColorPickerController

@synthesize stdColorsView = _stdColorsView;
@synthesize selectedColor = _selectedColor;
@synthesize showselectedColor = _showselectedColor;
@synthesize stdColorsArray = _stdColorsArray;
@synthesize redArray = _redArray;
@synthesize greenArray = _greenArray;
@synthesize blueArray = _blueArray;

@synthesize redSlider = _redSlider;
@synthesize greenSlider = _greenSlider;
@synthesize blueSlider = _blueSlider;
@synthesize alphaSlider = _alphaSlider;

@synthesize redValue = _redValue;
@synthesize greenValue = _greenValue;
@synthesize blueValue = _blueValue;
@synthesize alphaValue = _alphaValue;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        if (_selectedColor == NULL)
        {
            _redValue = redColor;
            _blueValue = blueColor;
            _greenValue = greenColor;
            _alphaValue = alphaVal;
            _stdColorsArray = [NSArray  arrayWithObjects:
            [ UIColor brownColor],[ UIColor blackColor], [ UIColor darkGrayColor],
            [ UIColor grayColor], [ UIColor lightGrayColor], [ UIColor whiteColor],
            [ UIColor colorWithRed:redColor green:greenColor blue:blueColor alpha:alphaVal], [ UIColor cyanColor], [ UIColor blueColor],
            [ UIColor greenColor], [ UIColor yellowColor], [ UIColor orangeColor],
            [ UIColor redColor], [ UIColor magentaColor], [ UIColor purpleColor], nil];
            
            _redArray = [NSArray arrayWithObjects:
            [NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.33],
            [NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.66],[NSNumber numberWithFloat:1.0],
            [NSNumber numberWithFloat:0.157],[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.0],
            [NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.0],
            [NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:0.5],
                         nil];
            
            _greenArray = [NSArray arrayWithObjects:
                [NSNumber numberWithFloat:0.4],[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.33],
                [NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.66],[NSNumber numberWithFloat:1.0],
                [NSNumber numberWithFloat:0.627],[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:0.0],
                [NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:0.5],
                [NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.0],
                           nil];

            _blueArray = [NSArray arrayWithObjects:
                [NSNumber numberWithFloat:0.2],[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.33],
                [NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.66],[NSNumber numberWithFloat:1.0],
                [NSNumber numberWithFloat:0.627],[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:1.0],
                [NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.0],
                [NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:0.5],
                           nil];
            
            _selectedColor = [UIColor colorWithRed:_redValue green:_greenValue blue:_blueValue alpha:_alphaValue];
        }

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _stdColorsView.backgroundColor = [UIColor clearColor];
    [_stdColorsView reloadData];
    // Do any additional setup after loading the view from its nib.
}
-(void) viewWillAppear:(BOOL)animated
{
    if (_selectedColor != NULL)
    {
        [_showselectedColor setBackgroundColor:_selectedColor];
        [_selectedColor getRed:&_redValue green:&_greenValue blue:&_blueValue alpha:&_alphaValue];
        _redSlider.value = _redValue;
        _blueSlider.value = _blueValue;
        _greenSlider.value = _greenValue;
        _alphaSlider.value = _alphaValue;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//Collection View Data Source Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 15;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"myColor";
    [collectionView registerNib:[UINib nibWithNibName:@"imageView" bundle:Nil] forCellWithReuseIdentifier:cellIdentifier];

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0.0,0.0, 50.0, 50.0)];
    [label setContentMode:UIViewContentModeScaleAspectFill];
    [label setClipsToBounds:YES];
    [label setBackgroundColor:[_stdColorsArray objectAtIndex:indexPath.row]];
    
    [cell.contentView addSubview:label];
    return cell;
}


// Collection View Delegate methods
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
        
        _redSlider.value = [((NSNumber*)[_redArray objectAtIndex:indexPath.row]) floatValue];
        _greenSlider.value = [((NSNumber*)[_greenArray objectAtIndex:indexPath.row]) floatValue];
        _blueSlider.value = [((NSNumber*)[_blueArray objectAtIndex:indexPath.row]) floatValue];
        _alphaSlider.value = 1.0;
        _selectedColor = [UIColor colorWithRed:_redSlider.value green:_greenSlider.value blue:_blueSlider.value alpha:_alphaSlider.value];
        _showselectedColor.backgroundColor = _selectedColor;
    
}

-(IBAction)changeColor:(id)sender
{
    switch (((UISlider*)sender).tag)
    {
        case 1:
            _redValue = ((UISlider*)sender).value;
            break;
        case 2:
            _greenValue = ((UISlider*)sender).value;
            break;
        case 3:
            _blueValue = ((UISlider*)sender).value;
            break;
        case 4:
            _alphaValue = ((UISlider*)sender).value;
            break;
        default:
            break;
            
    }
    _selectedColor = [UIColor colorWithRed:_redValue green:_greenValue blue:_blueValue alpha:_alphaValue];
    _showselectedColor.backgroundColor= _selectedColor;
    
}

@end
