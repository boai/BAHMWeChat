"use strict";
import { harTasks } from '@ohos/hvigor-ohos-plugin';
import { PluginConfig, etsGeneratorPlugin } from '@app/ets-generator';

const config: PluginConfig = {
    scanFiles: [
        "src/main/ets/pages/BAAddressBookPage",
        "src/main/ets/pages/BAPersonDetailPage"
    ]
}

export default {
    system: harTasks, /* Built-in plugin of Hvigor. It cannot be modified. */
    plugins: [etsGeneratorPlugin(config)]         /* Custom plugin to extend the functionality of Hvigor. */
}
