import hilog from '@ohos.hilog'

export class BALogger {
  static domain: number
  static prefix: string
  static format: string = '%{public}s, %{public}s'

  constructor(domain: number = 0xFF00, prefix: string = 'Demo') {
    BALogger.domain = domain
    BALogger.prefix = prefix
  }

  static debug(...args: string[]): void {
    hilog.debug(BALogger.domain, BALogger.prefix, BALogger.format, args)
  }

  static info(...args: string[]): void {
    hilog.info(BALogger.domain, BALogger.prefix, BALogger.format, args)
  }

  static warn(...args: string[]): void {
    hilog.warn(BALogger.domain, BALogger.prefix, BALogger.format, args)
  }

  static error(...args: string[]): void {
    hilog.error(BALogger.domain, BALogger.prefix, BALogger.format, args)
  }
}
