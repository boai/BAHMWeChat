/**
 * @Class BARouterInterceptor.ets
 * @Author boai
 * @DateTime 2024/7/12 16:26:46
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
    for (let i = 0; i < BARouterInterceptor.list.length; i++) {
      // 如果子模块拦截函数返回true，即需要拦截
      if (BARouterInterceptor.list[i].executeFunction(appUri, param)) {
        return true
      }
      // 否则就放行
      return false
    }
  }
}
