# AlignButtonContainer for Lazarus

**AlignButtonContainer** - это универсальный контейнер для автоматического размещения кнопок с гибкими настройками компоновки.

![image](/image.png "image")  ![image](/demo.png "image")

**Основные возможности:**</br>
Поддержка нескольких типов кнопок:</br>
TSpeedButton</br>
TButton</br>
TBitBtn</br>

**Гибкое расположение элементов:**</br>
Горизонтальное (слева направо)
Вертикальное (сверху вниз)

**Настройка выравнивания:**</br>
Горизонтальное (влево, по центру, вправо)
Вертикальное (вверх, по центру, вниз)

**Полный контроль размеров:**</br>
Задание ширины/высоты кнопок</br>
Настройка промежутков между элементами</br>
Автоматический расчет минимальных размеров</br>

**Особенности:**</br>
Визуальное оформление в дизайнере (рамка, перекрестие и название)</br>
Динамическое изменение макета при изменении размеров</br>
Простой API для добавления/удаления кнопок</br>
Поддержка всех стандартных свойств управления</br>

**Использование:**</br>
Добавьте компонент на форму</br>
Настройте параметры (размеры, отступы, выравнивание)</br>
Добавляйте кнопки через метод AddButton()</br>
При необходимости измените направление компоновки</br>

Container for leveled buttons for Lazarus</br>

AlignButtonContainer is a versatile container for automatic button arrangement with flexible layout settings.

Key Features:

Multiple button type support:

SpeedButton

Button

BitBtn

Flexible item arrangement:

Horizontal (left to right)

Vertical (top to bottom)

Alignment customization:

Horizontal (left, center, right)

Vertical (top, center, bottom)

Complete size control:

Button width/height settings

Spacing configuration

Automatic minimum size calculation

Special Features:

Designer visual enhancements (border, crosshair and name display)

Dynamic layout adjustment on resize

Simple API for adding/removing buttons

Full standard control properties support

How to Use:

Add component to form

Configure parameters (sizes, spacing, alignment)

Add buttons via AddButton() method

Change layout direction if needed

**Code Example:**</br>
````
// Add buttons
var btn1 := AlignButtonContainer1.AddButton(btButton);
var btn2 := AlignButtonContainer1.AddButton(btBitBtn);

// Change layout
AlignButtonContainer1.LayoutDirection := ldVertical;

// Configure appearance
AlignButtonContainer1.ButtonWidth := 100;
AlignButtonContainer1.Spacing := 10;
````

**В режиме дизайнера**
**In designer mode**

![image](/image.png "image")


**Демо**
**Demo**

![image](/demo.png "image")
