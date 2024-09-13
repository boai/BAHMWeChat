
import { AppRouter, DynamicsRouter } from '@ohos/dynamicsrouter';

@AppRouter({name: "batestmodule/BATestPage"})
@Component
export struct BATestPage {
  @State message: string = 'Hello World';

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

