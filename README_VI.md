# 💎 LiquidGlass Button

[English](README.md) | [Tiếng Việt](README_VI.md)

Một component button với hiệu ứng glass morphism đẹp mắt, được thiết kế cho iOS với SwiftUI. Button này tạo ra hiệu ứng trong suốt, mờ với blur effect và inner shadow tinh tế, mang lại trải nghiệm người dùng hiện đại và sang trọng.

## ✨ Tính năng

- **Glass Morphism Effect**: Hiệu ứng kính mờ với blur background
- **Inner Shadow**: Shadow bên trong tạo độ sâu và chiều sâu
- **Gradient Stroke**: Viền với gradient linear góc 45 độ
- **Scalable**: Có thể điều chỉnh kích thước linh hoạt
- **Customizable**: Dễ dàng tùy chỉnh màu sắc, kích thước và style

## 🚀 Yêu cầu hệ thống

- **iOS 15.0+**
- **Xcode 14.0+**
- **Swift 5.7+**

## 📸 Screenshot

<img src="https://raw.githubusercontent.com/vinkay215/LiquidGlassButton/main/Screenshot/liquidglass-button-screenshot.png" width="350" alt="LiquidGlass Button Screenshot">

## Thành phần

### GlassButton

Component button chính với các thuộc tính:
- `title: String` - Text hiển thị trên button
- `scale: CGFloat` - Hệ số scale cho kích thước (mặc định: 1.0)

### BlurView

Custom blur view sử dụng `UIVisualEffectView`:
- `style: UIBlurEffect.Style` - Style của blur effect
- `intensity: CGFloat` - Cường độ blur

### InnerShadow

Custom inner shadow view tạo shadow bên trong:
- `color: Color` - Màu của shadow
- `radius: CGFloat` - Bán kính blur của shadow
- `x: CGFloat` - Offset theo trục X
- `y: CGFloat` - Offset theo trục Y
- `cornerRadius: CGFloat` - Bo góc
- `spread: CGFloat` - Độ lan rộng của shadow (mặc định: 0.5)

## Thiết kế

Button được thiết kế với các đặc điểm:

- **Background**: Trong suốt với blur effect (`systemUltraThinMaterial`)
- **Padding**: Horizontal 20, Vertical 14 (có thể scale)
- **Corner Radius**: 23 (có thể scale)
- **Inner Shadow Top**: 
  - Position: x: 0, y: 2
  - Blur: 4
  - Color: White 40%
- **Inner Shadow Bottom**:
  - Position: x: 0, y: -2
  - Blur: 4
  - Color: Black 25%
- **Stroke**: Linear gradient góc 45 độ với white opacity từ 5% → 100% → 5%
- **Text Color**: White

## Ví dụ

Xem file `ContentView.swift` để xem ví dụ sử dụng đầy đủ với 3 button có kích thước khác nhau.

## Tác giả

**Nguyễn Quốc Vinh** (Github: [Vinkay215](https://github.com/Vinkay215))

## License

The Unlicense

Dự án này được tạo cho mục đích học tập và sử dụng tự do. Code được phát hành vào public domain, bạn có thể sử dụng, chỉnh sửa và phân phối mà không có bất kỳ ràng buộc nào.

