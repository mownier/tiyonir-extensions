# TNExtensions
[![Build Status](https://travis-ci.org/mownier/tiyonir-extensions.svg?branch=master)](https://travis-ci.org/mownier/tiyonir-extensions) [![codecov](https://codecov.io/gh/mownier/tiyonir-extensions/branch/master/graph/badge.svg)](https://codecov.io/gh/mownier/tiyonir-extensions)

## Installation
In `Podfile`
```
pod 'TNExtensions/ImageCreator', :git => 'https://github.com/mownier/tiyonir-extensions.git', :tag => '<latest-tag>'
pod 'TNExtensions/HexColorConverter', :git => 'https://github.com/mownier/tiyonir-extensions.git', :tag => '<latest-tag>'
```
`<latest-tag>` - find it [here](https://github.com/mownier/tiyonir-extensions/releases)

## HexColorConverter
- Converts hex `String` to `UIColor`
- Converts `UIColor` to hex `String`

### How to Use
```swift
import TNExtensions

// 1
let converter = HexColorConverter()
let color = UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 1.0)
let hex = converter.withColor(color).toHex()

// 2
let converter = HexColorConverter()
let hex = Hex("#ff00ff")
let color = converter.withHex(hex).toColor()

// 3
let color = UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 1.0)
let hex = color.toHex()

// 4
let hex = Hex("0xff00ff")
let color = hex.toColor()

// 5
let converter = HexConverter()
let color = UIColor(red: 1.0, green: 0, blue: 1.0, alpha: 1.0)
let hex = converter.convert(using: color)

// 6
let converter = ColorConverter()
let hex = Hex("#ff00ff")
let color = converter.convert(using: hex)
```

## ImageCreator
- Creates `UIImage` from `UIView`

### How to Use
```swift
import TNExtensions

// 1
let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
let view = UIView(frame: frame)
let creation = ImageCreation()
let image = creation.create(using: view)

// 2
let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
let view = UIView(frame: frame)
let image = view.createImage()

// 3
let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
let view = UIView(frame: frame)
let creator = ViewToImageCreator()
let image = creator.withView(view).createImage()
```
