import { BAAddressBookPage } from '@ohos/baaddressbookmodule'

@Entry
@Component
export struct BAAddressBookIndex {
  build() {
    Column() {
      BAAddressBookPage()
    }
  }
}