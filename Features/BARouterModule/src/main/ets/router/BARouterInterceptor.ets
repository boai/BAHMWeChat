/**
 * @Class BARouterInterceptor.ets
 * @Author boai
 * @DateTime 2024/7/12 16:26:46
 */

/**
 * Navigation路由拦截：
 * 如何封装：
 * 1、在路由模块增加路由拦截器interceptor.ets，定义拦截容器、注册方法和公共拦截逻辑。
 * 2、当点击本案例时，触发在路由模块的动态路由.pushUri()中的interceptor的公共拦截方法（此处需动态路由完成加载后执行否则首次路由拦截失败）。
 * 3、子模块中定义业务具体拦截逻辑，做具体的拦截实现：通过routerInfo判断目的地为"我的页面"时判断登录状态是"未登录"，此时执行跳转到登录页并返回true给拦截容器list（告知需拦截），已登录返回false，放行。并且注册到拦截器容器list中
 * 4、拦截器获取拦截容器list中所有注册过的子模块的拦截函数，如果子模块拦截函数返回true，即需要拦截，否则放行。
 * 5、通过循环拦截容器list得到返回true时通知动态路由不再继续跳转, 否则返回false，通知动态路由继续执行跳转，跳转到我的页面。
 * 6、在登录页点击：手机号码一键登录后，登陆成功，登陆状态置为true，且跳转到主页。
 * 7、详情页中点击：注销登录，登录状态置为false，退出登录。
 * Navigation参考文档:https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/arkts-navigation-navigation-0000001453365116-V2
 */

/*
 * 定义拦截实现接口
 * @param routerInfo 需要拦截的路由名
 * @param params 路由参数
 * */
export interface BARouterInterceptorExecute {
  executeFunction(appUri: string, params?: string): boolean
}

// 定义拦截器方法
export class BARouterInterceptor {
  // 定义拦截器容器
  private static list: Array<BARouterInterceptorExecute> = []

  /**
   * 注册拦截页面
   * @param interceptorFnc 子模块传过来的自定义拦截函数
   */
  public static registerInterceptorPage(interceptorFnc: BARouterInterceptorExecute): void {
    BARouterInterceptor.list.push(interceptorFnc)
  }

  /**
   * 公共拦截器逻辑
   * @param appUri 接收传过来的路由名
   * @param param  路由参数
   * @returns
   */
  public static interceptor(appUri: string, param?: string): boolean {
    // 循环拦截器容器中所有的子模块自定义的拦截函数
    for (let i = 0; i < BARouterInterceptor.list.length; i++) {
      // 如果子模块拦截函数返回true，即需要拦截
      if (BARouterInterceptor.list[i].executeFunction(appUri, param))
        return true
    }
    // 否则就放行
    return false
  }
}
