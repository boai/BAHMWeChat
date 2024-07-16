"use strict";
import { harTasks } from '@ohos/hvigor-ohos-plugin';
import { PluginConfig, etsGeneratorPlugin } from '@app/ets-generator';

// 配置路由信息
const config: PluginConfig = {
  // 需要扫描的文件的路径，即配置自定义装饰AppRouter的文件路径
  scanFiles: [
    "src/main/ets/pages/BAMinePage",
    "src/main/ets/pages/BAMineSettingPage"
  ]
}

export default {
  system: harTasks, /* Built-in plugin of Hvigor. It cannot be modified. */
  plugins: [etsGeneratorPlugin(config)]         /* Custom plugin to extend the functionality of Hvigor. */
}
