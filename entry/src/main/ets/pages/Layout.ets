import { Find } from "./Find";
import { Mine } from "./Mine";
import { Moment } from "./Monent";
import { Recommend } from "./Recommend";

@Builder
export function LayoutBuilder() {
  Layout();
}

interface TabClass {
  text: string,
  icon: ResourceStr
}

@ComponentV2
export struct Layout {
  navPathStack: NavPathStack = new NavPathStack();
  @Local currentIndex: number = 0

  tabData: TabClass[] = [
    { text: "推荐", icon: $r('app.media.ic_recommend') },
    { text: "发现", icon: $r('app.media.ic_find') },
    { text: "动态", icon: $r('app.media.ic_moment') },
    { text: "我的", icon: $r('app.media.ic_mine') }
  ]

  @Builder
  tabBuilder(tab: TabClass, index: number) {
    Column({space: 5}) {
      Image(tab.icon)
        .width(24)
        .fillColor(this.currentIndex === index ? '#E85A88' : '#63AAAA')
      Text(tab.text)
        .fontSize(14)
        .fontColor(this.currentIndex === index ? '#E85A55' : '#63AAAA')
    }
  }

  build() {
    NavDestination() {
      Tabs({barPosition: BarPosition.End}) {
        ForEach(this.tabData, (item: TabClass, index: number) => {
          TabContent() {
            if (index === 0) {
              Recommend()
            } else if (index === 1) {
              Find()
            } else if (index === 2) {
              Moment()
            } else if (index === 3) {
              Mine()
            }
          }
          .tabBar(this.tabBuilder(item, index))
          .backgroundColor('#131415')
          .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
        })
      }
      .backgroundColor('#3B3F42')
      .onSelected((index: number) => {
        this.currentIndex = index
      })
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
    }
    .onReady((ctx: NavDestinationContext) => {
      // NavDestinationContext获取当前所在的导航控制器
      this.navPathStack = ctx.pathStack;
    })
  }
}