<a href="https://github.com/RGSSoftware/HireMe">
  <img src="https://github.com/RGSSoftware/HireMe/blob/master/HireMeBanner.png" >
</a>

# RGSTextFieldReveal

New Material UITextField

This project is an implementation of a [Dribbble](https://dribbble.com/shots/2197140-New-Material-Text-Fields) shot. 

<img src="https://github.com/RGSSoftware/RGSTextFieldReveal/blob/master/sceenshots/gif.gif" alt="iPhone 5" width="311" />

## Storyboard Example
- Add an UIView to your storyboard. 
- Change its subclass to RGSTextFieldReveal. 
- Change its Intrinsic Size to Placeholder.
- Change width to None.

For full example please download project.

<img src="https://github.com/RGSSoftware/RGSTextFieldReveal/blob/master/sceenshots/storyboard.png" alt="Storyboard" width="756" />

## Customization

`RGSTextFieldReveal` can be customized via the following @properties

```swift
var placeholderButton: UIButton!

var reveralView: UIView!
var textField: UITextField!
    
var reveralViewMinHeight: CGFloat
var reveralViewMaxHeight: CGFloat

var openDuration: Double
var closeDuration: Double

var isOpen: Bool

func open()
func close()
```

##Limitation
RGSTextFieldReveal calls self.superview!.layoutIfNeeded() apart of its animation, so if you need full control when your view calls layoutIfNeeded(), then RGSTextFieldReveal is not for you. Also, RGSTextFieldReveal.placeholderButton.titleLabel doesn't animate its scale when RGSTextFieldReveal open/close.

