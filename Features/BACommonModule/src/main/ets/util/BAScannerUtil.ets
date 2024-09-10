/**
 * @Class BAScannerUtil.ets
 * @Author boai
 * @DateTime 2024/7/19 09:35:58
 */
import { XTEasyHUD } from '@jxt/xt_hud'
import BALogger from './BALogger'
import { scanBarcode, scanCore } from '@kit.ScanKit'
import { hilog } from '@kit.PerformanceAnalysisKit'
import { BusinessError } from '@kit.BasicServicesKit'


export enum BAScannerType {
  //不区分入口
  default = 0,
  //首页
  home,
  //朋友圈
  pyq,
  //支付
  pay
}

type BAScannerCallBack = (result: scanBarcode.ScanResult) => void

export class BAScannerUtil {
  //code

  /** params
   {
   "pageType" : 1
   }
   */

  /**
   * 扫一扫
   * @param params
   * @param callBack
   */
  static onScan(context: Context, params: Record<string, string>, callBack: BAScannerCallBack) {
    let pageType = params["pageType"]

    if (!canIUse("SystemCapability.Multimedia.Scan.Core")) {
      let msg = "该设备不支持扫码能力"
      console.log(msg)
      XTEasyHUD.showError(msg)
      return
    } else {
      // 定义扫码参数options
      let options: scanBarcode.ScanOptions = {
        scanTypes: [scanCore.ScanType.ALL],
        enableMultiMode: true,
        enableAlbum: true
      };
      scanBarcode.startScanForResult(context, options).then((result: scanBarcode.ScanResult) => {
        // 收到扫码结果后返回
        hilog.info(0x0001, '[Scan CPSample]',
          `Succeeded in getting ScanResult by promise with options, result is ${JSON.stringify(result)}`);
        callBack(result)
      }).catch((error: BusinessError) => {
        hilog.error(0x0001, '[Scan CPSample]',
          `Failed to get ScanResult by promise with options. Code:${error.code}, message: ${error.message}`);
      })
    }
  }
}
