/**
 * @Class BARouterLoader.ets
 * @Author boai
 * @DateTime 2024/7/15 11:09:55
 */
import { AppRouterInfo, BARouterMapModel } from './AppRouterInfo';
import { resourceManager } from '@kit.LocalizationKit';
import { util } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { BALogger } from '@ohos/bacommonmodule';

// 加载路由
export namespace BARouterLoader {
  // 加载所有路由表文件
  export function load(dir: string, routerMap: Map<string, AppRouterInfo>, context: Context) {
    const rm: resourceManager.ResourceManager = context.resourceManager
    try {
      rm.getRawFileList(dir).then((value: Array<string>) => {
        let decoder: util.TextDecoder = util.TextDecoder.create("utf-8", {
          fatal: false,
          ignoreBOM: true
        })
        // 遍历所有模块的路由表文件，放入路由表中管理
        value.forEach((fileName: string) => {
          let fileBytes: Uint8Array = rm.getRawFileContentSync(`${dir}/${fileName}`)
          let retStr = decoder.decodeWithStream(fileBytes)
          let routerMapModel: BARouterMapModel = JSON.parse(retStr) as BARouterMapModel
          loadRouterMap(routerMapModel, routerMap)
        })
      }).catch((error: BusinessError) => {
        BALogger.error(`promise getRawFile failed, error code: ${error.code}, message: ${error.message}`)
      })
    } catch (error) {
      let code = (error as BusinessError).code
      let message = (error as BusinessError).message
      BALogger.error(`promise getRawFile failed, error code: ${error.code}, message: ${error.message}`)
    }
  }

  function loadRouterMap(routerMapModel: BARouterMapModel, routerMap: Map<string, AppRouterInfo>): void {
    routerMapModel.routerMap.forEach((routerInfo: AppRouterInfo) => {
      if (routerMap.has(routerInfo.name)) {
        BALogger.warn(`重复注册路由：${routerInfo.name}`)
      } else {
        routerMap.set(routerInfo.name, routerInfo)
      }
    })
  }
}