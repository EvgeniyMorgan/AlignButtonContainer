# AlignButtonContainer

AlignButtonContainer - это универсальный контейнер для автоматического размещения кнопок с гибкими настройками компоновки.

**Основные возможности:**
Поддержка нескольких типов кнопок:

SpeedButton
Button
BitBtn

**Гибкое расположение элементов:**
Горизонтальное (слева направо)
Вертикальное (сверху вниз)

**Настройка выравнивания:**
Горизонтальное (влево, по центру, вправо)
Вертикальное (вверх, по центру, вниз)

**Полный контроль размеров:**
Задание ширины/высоты кнопок
Настройка промежутков между элементами
Автоматический расчет минимальных размеров

**Особенности:**
Визуальное оформление в дизайнере (рамка, перекрестие и название)
Динамическое изменение макета при изменении размеров
Простой API для добавления/удаления кнопок
Поддержка всех стандартных свойств управления

**Использование:**

Добавьте компонент на форму
Настройте параметры (размеры, отступы, выравнивание)
Добавляйте кнопки через метод AddButton()
При необходимости измените направление компоновки
Container for leveled buttons for Lazarus

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

`Code Example:

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
