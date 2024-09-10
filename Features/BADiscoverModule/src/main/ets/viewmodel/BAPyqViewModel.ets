/**
 * @Class BAPyqViewModel.ets
 * @Author boai
 * @DateTime 2024/7/4 15:54:10
 */
import { Context } from '@ohos.abilityAccessCtrl';
import { BALogger } from '@ohos/bacommonmodule';
import { JSON, util } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

export enum BAPyqItemType {
  default = 0,
  ad = 1
}

let jsonPath: string = "data/pyqDataList.json"

export class BAPyqViewModel {
  //code
  static getDataList(context: Context): BAPyqItemModel[] {
    let rawFile: Uint8Array;
    try {
      rawFile = context.resourceManager.getRawFileContentSync(jsonPath)
      let jsonStr: string = util.TextDecoder.create('utf-8', { ignoreBOM: true }).decodeWithStream(rawFile);
      let jsonObj = JSON.parse(jsonStr) as Record<string, Object>
      let result = jsonObj["result"] as number
      if (result == 1) {
        let data: BAPyqItemModel[] = jsonObj["data"] as BAPyqItemModel[]
        return data
      } else {
        return []
      }
    } catch (error) {
      let code = (error as BusinessError).code
      let message = (error as BusinessError).message
      BALogger.error(`ResourceManager:callback getRawFileContent failed, error code: ${code}, message: ${message}.`,
        'BAPyqViewModel');
      return []
    }
  }
}

export interface BAPyqItemModel {
  type: BAPyqItemType
  contentId: number
  userIcon: Resource | undefined
  userName: string | undefined
  content: string
  images: Resource[] | string[] | undefined
  video: Resource | string | undefined
  time: string | undefined
  urlPath: string | undefined
  contentSource: string | undefined
  comments: BAPyqItemCommentModel[]
}

export interface BAPyqItemCommentModel {
  contentId: number
  commentId: number
  userName: string | undefined
  content: string | undefined
}