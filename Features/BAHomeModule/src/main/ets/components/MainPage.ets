@Component
export struct MainPage {
  @State message: string = '功能正在开发，请切换其他页面';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}
