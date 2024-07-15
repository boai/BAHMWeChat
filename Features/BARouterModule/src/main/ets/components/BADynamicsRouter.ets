/**
 * @Class BADynamicsRouter.ets
 * @Author boai
 * @DateTime 2024/7/15 09:56:17
 */
import { BARouterConfig, BARouterInfo, HOME_PAGE } from './BARouterInfo'
import { Context } from '@ohos.abilityAccessCtrl'
import { BARouterLoader } from './BARouterLoader'
import { BALogger } from '@ohos/bacommonmodule'
import { BARouterInterceptor } from './BARouterInterceptor'
import { BusinessError } from '@kit.BasicServicesKit'

const LOGGER_TAG: string = "Dynamics import failed , reason : "

export class BADynamicsRouter {
  static config: BARouterConfig
  // 路由表信息
  static routerMap: Map<string, BARouterInfo> = new Map()
  // 管理需要动态导入的模块，key是模块名，value是WrappedBuilder对象，动态调用创建页面的接口
  static builderMap: Map<string, WrappedBuilder<[object]>> = new Map<string, WrappedBuilder<[object]>>()
  static navPathStack: NavPathStack = new NavPathStack()
  // 自动生成的路由列表
  static routerStack: Array<BARouterInfo> = new Array()
  static referrer: string[] = []

  // 初始化动态路由
  public static routerInit(config: BARouterConfig, context: Context) {
    BADynamicsRouter.config = config
    BADynamicsRouter.routerStack.push(HOME_PAGE)
    // 加载路由表
    BARouterLoader.load(config.mapPath, BADynamicsRouter.routerMap, context)
  }

  // 通过名称注册 builder
  private static registerBuilder(builderName: string, builder: WrappedBuilder<[object]>): void {
    BADynamicsRouter.builderMap.set(builderName, builder)
  }

  // 通过名称注册 builder
  private static getBuilder(builderName: string): WrappedBuilder<[object]> {
    const builder = BADynamicsRouter.getBuilder(builderName)
    if (!builder) {
      const msg = `没有找到当前 builder[${builderName}]`
      BALogger.info(msg)
    }
    return builder as WrappedBuilder<[object]>
  }

  // 通过名称获取 router
  public static getNavPathStack(): NavPathStack {
    return BADynamicsRouter.navPathStack
  }

  // 获取路由来源页面栈
  public static getRouterReferrer(): string[] {
    return BADynamicsRouter.referrer
  }

  // 根据路由信息跳转到对应的页面
  public static pushUri(name: string, param?: ESObject) {
    // 如果路由表中没有该路由信息，直接中断执行
    if (!BADynamicsRouter.routerMap.has(name)) {
      return;
    }
    // 根据路由名获取路由信息
    let routerInfo: BARouterInfo = BADynamicsRouter.routerMap.get(name)!
    // 如果是第一次跳转，则需要动态引入模块
    if (!BADynamicsRouter.builderMap.has(name)) {
      // 动态引用模块，如“@ohos/bacommonmodule”，和entry/oh-package.json中配置的模块名相同
      import(`${BADynamicsRouter.config.libPrefix}/${routerInfo.pageModule}`)
        .then((module: ESObject) => {
          // 通过路由注册方法注册路由
          module[routerInfo.registerFunction!](routerInfo)
          // TODO：知识点：在路由模块的动态路由.pushUri()中调用拦截方法，此处必须等待动态路由加载完成后再进行拦截，否则页面加载不成功，导致无法注册拦截的函数，出现首次拦截失效。
          if (BARouterInterceptor.interceptor(name, params)) {
            return
          }
          // 跳转页面
          BADynamicsRouter.navPathStack.pushPath({ name: name, param: param })
        })
        .catch((error: BusinessError) => {
          BALogger.error(`引入 module 失败，errorCode：${error.code}，errorMsg：${error.message}`)
        })
    } else {
      // TODO：知识点：除首次跳转后，之后的每次跳转都需进行路由拦截。
      if (BARouterInterceptor.interceptor(name, param)) {
        return
      }
      // 如果已经跳转过，则直接跳转，不需要重新动态引用
      BADynamicsRouter.navPathStack.pushPath({ name: name, param: param })
      BADynamicsRouter.pushRouterStack(routerInfo)
    }
  }

  // 存储引用信息
  private static pushRouterStack(routerInfo: BARouterInfo) {
    BADynamicsRouter.routerStack.push(routerInfo)
    const referrerModel: BARouterInfo = BADynamicsRouter.routerStack[BADynamicsRouter.routerStack.length - 2]
    BADynamicsRouter.referrer[0] = referrerModel.pageModule
    BADynamicsRouter.referrer[1] = referrerModel.name
    BALogger.info(`From DynamicsRouter.routerStack push preview module name is ${BADynamicsRouter.referrer[0]}，path is ${BADynamicsRouter.referrer[1]}`)
  }

  // 通过获取页面栈并pop
  public static popRouter(): void {
    // pop前记录的来源页为当前栈顶
    const referrerModel: BARouterInfo = BADynamicsRouter.routerStack[BADynamicsRouter.routerStack.length - 1]
    BADynamicsRouter.referrer[0] = referrerModel.pageModule
    BADynamicsRouter.referrer[1] = referrerModel.name
    BALogger.info(`From DynamicsRouter.routerStack pop preview module name is ${BADynamicsRouter.referrer[0]}，path is ${BADynamicsRouter.referrer[1]}`)

    if (BADynamicsRouter.routerStack.length > 1) {
      BADynamicsRouter.routerStack.pop()
    } else {
      BALogger.info("DynamicsRouter.routerStack is only Home.")
    }
    // 查找到对应的路由栈进行pop
    BADynamicsRouter.getNavPathStack().pop()
  }

  // 通过获取页面栈并将其清空
  public static clear(): void {
    // 查找到对应的路由栈进行pop
    BADynamicsRouter.getNavPathStack().clear()
  }

  /**
   * 注册动态路由需要加载的页面，用于自动生成的路由
   *
   * @param routerInfo 页面名，需要动态加载的页面名称
   * @param wrapBuilder wrapBuilder对象
   */
  public static registerRouterPage(routerInfo: BARouterInfo, wrapBuilder: WrappedBuilder<[object]>): void {
    const builderName: string = routerInfo.name
    if (!BADynamicsRouter.builderMap.has(builderName)) {
      BADynamicsRouter.registerBuilder(builderName, wrapBuilder)
    }
  }
}