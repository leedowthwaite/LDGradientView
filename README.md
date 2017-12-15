# LDGradientView
A concise yet versatile CAGradientLayer-based view that you can configure directly within a storyboard.

This project is part of my [Creating an @IBDesignable Gradient View in Swift]
(https://appcodelabs.com/create-ibdesignable-gradient-view-swift) tutorial. 
Please visit the site for a complete description.

## Brief Overview

The class `LDGradientView` is the important file here: it contains all the gradient functionality and is 
`@IBDesignable` so it can be dropped into an Xcode storyboard and previewed right there in Interface Builder.

The brief I kept in mind when creating this gradient view was that I very often have to put gradients 
into iOS UIs and more often than not the designers want to tweak them after they're implemented. 
Making it `@IBDesignable` is a no-brainer, but most people who do this end up with lists of `@IBInspectable` 
pararmeters for start point, end point, etc. I wanted to make the simplest possible interface to create a 
versatile gradient.

So the parameters are very straightforward:-

    // the gradient start colour
    @IBInspectable var startColor: UIColor?
    
    // the gradient end colour
    @IBInspectable var endColor: UIColor?
    
    // the gradient angle, in degrees anticlockwise from 0 (east/right)
    @IBInspectable var angle: CGFloat = 270
  

`startColor` and `endColor` should be self-explanatory: they are standard colour pickers. But `angle` cuts out 
a lot of fuss: by simply specifying the gradient direction as an angle it makes it so much easier to work with.
Admittedly you lose *some* control, for instance if a gradient vector does not pass through the centre point, 
but in my fairly long experience of dealing with designers, 90% of cases will be covered by these controls.

Watch the short video to see how it works in action.

[![Video demonstrating LDGradientView in Xcode](https://img.youtube.com/vi/s-oqtELkQQU/0.jpg)](https://youtu.be/s-oqtELkQQU)

If you find this proejct useful, please remember to like the video or star the repo, thanks :)
