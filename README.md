# RGSTextFieldReveal

New Material Text-Fields

This project is a implementation of a [Dribbble](https://dribbble.com/shots/2197140-New-Material-Text-Fields) shot. 

<img src="https://github.com/RGSSoftware/RGSTextFieldReveal/blob/master/sceenshots/gif.gif" alt="iPhone 5" width="311" />

## Customization

`RGSTextFieldReveal` can be customized via the following @properties

```swift
var placeholderButton: UIButton!

    var reveralView: UIView!
    internal var textField: UITextField!
    
    var reveralViewMinHeight: CGFloat
    var reveralViewMaxHeight: CGFloat

    internal var openDuration: Double
    internal var closeDuration: Double

    internal var isOpen: Bool

    func open()
    func close()
```

##Limitation
RGSTextFieldReveal calls self.superview!.layoutIfNeeded() apart of its' animation, so if you need full control when your view calls layoutIfNeeded(), RGSTextFieldReveal is not for you. Also, RGSTextFieldReveal.placeholderButton.titleLabel doesn't animate it's scale apart of RGSTextFieldReveal open/close animation.

