import { BATabbarIndex } from './BATabbarIndex';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      BATabbarIndex()
    }
    .height('100%')
    .width('100%')
  }
}