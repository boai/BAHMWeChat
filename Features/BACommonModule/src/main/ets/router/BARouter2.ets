/**
 * @Class BARouter2.ets
 * @Author boai
 * @DateTime 2024/7/4 18:44:37
 */

import Url from "@ohos.url"; // URL解析
import { router } from "@kit.ArkUI"; // 路由
import { BARouterPath } from './BARouterPath';
import { BALogger } from '../util/BALogger';

// Router管理类
export class BARouter2 {
  // 自定义路由跳转
  public static openUrl(urlString: string): void {
    //示例：'http://baapp/badiscovermodule/BAPyqPage?type=1&name=博爱'
    // 如果是自定义url地址，解析URI参数和路径
    const url = Url.URL.parseURL(urlString);
    if (!url) {
      BALogger.info("找不到对应路由【" + urlString + "】，请检查路由配置", 'BARouter')
      return
    }
    BALogger.info("进入路由跳转：" + urlString, 'BARouter')

    const hostname = url.hostname
    const pathname = url.pathname
    // Router参数类型为Record<string, string>
    let newParams: Record<string, string> = {};
    // 解析 uri参数
    url.params.forEach((value, key) => {
      newParams[key] = value;
    });

    //路由拦截...

    if (hostname === BARouterPath.HOST_APP) {
      //app路由
      router.pushNamedRoute({
        name: pathname,
        params: newParams,
      }, router.RouterMode.Standard, (err) => {
        if (err) {
          // 如果跳转失败，再跳转到未找到页面
          // BARouter.pushNotFoundPage();
          BALogger.error('Invoke pushUrl failed, code is ${err.code}, message is ${err.message}', 'BARouter')
        }
      });
    } else if (hostname == BARouterPath.HOST_H5) {
      //h5路由

    } else if (hostname == BARouterPath.HOST_MINIPROJECT) {
      //小程序路由

    } else {
      BALogger.info("找不到对应路由，请检查路由配置", 'BARouter')
    }
  }
}