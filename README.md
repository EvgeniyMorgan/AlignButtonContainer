> [!IMPORTANT]
> Most likely, there won’t be full documentation—just no time for it, unfortunately((.<br>
> For any potential issues, please email us. ewgen.morgunov@yandex.ru

# Container for leveled buttons for Lazarus</br>

![image](/demo.png "image")
![image](/image.png "image")  

**AlignButtonContainer** is a versatile container for automatic button arrangement with flexible layout settings.</br>
**Key Features:**</br>
**Multiple button type support:**</br>
SpeedButton</br>
Button</br>
BitBtn</br>

**Flexible item arrangement:**</br>
Horizontal (left to right)</br>
Vertical (top to bottom)</br>
Alignment customization:</br>
Horizontal (left, center, right)</br>
Vertical (top, center, bottom)</br>

**Complete size control:**</br>
Button width/height settings</br>
Spacing configuration</br>
Automatic minimum size calculation</br>

**Special Features:**</br>
Designer visual enhancements (border, crosshair and name display)</br>
Dynamic layout adjustment on resize</br>
Simple API for adding/removing buttons</br>
Full standard control properties support</br>

**How to Use:**</br>
Add component to form</br>
Configure parameters (sizes, spacing, alignment)</br>
Add buttons via AddButton() method</br>
Change layout direction if needed</br>

**Code Example:**</br>
````pascal
// Add buttons
var btn1 := AlignButtonContainer1.AddButton(btButton);
var btn2 := AlignButtonContainer1.AddButton(btBitBtn);

// Change layout
AlignButtonContainer1.LayoutDirection := ldVertical;

// Configure appearance
AlignButtonContainer1.ButtonWidth := 100;
AlignButtonContainer1.Spacing := 10;
````
