import { BADiscoverPage } from '@ohos/badiscovermodule'

@Entry
@Component
export struct BADiscoverIndex {
  build() {
    Column() {
      BADiscoverPage()
    }
  }
}