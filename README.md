ColorPicker_iOS
===============

iOS Color Picker Controller

To use Color Picker Controller

Add ColoroPickerController.h in your file.
      	#Import "ColorPickerController.h"
Create instance of ColorPickerController using
    		ColorPickerController *colorsPicker = [[ColorPickerController alloc] initWithNibName:@"ColorPickerController" bundle:Nil];
Use following function to find color picked
        UIColor *selectedColor = [colorsPicker selectedColor];
