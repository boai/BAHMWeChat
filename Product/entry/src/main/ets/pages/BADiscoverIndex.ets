import { BADiscoverPage } from '@ohos/discovermodule'

@Entry
@Component
export struct BADiscoverIndex {
  build() {
    Column() {
      BADiscoverPage()
    }
  }
}