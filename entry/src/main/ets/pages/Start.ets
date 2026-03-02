@Builder
export function StartBuilder() {
  Start();
}

@ComponentV2
export struct Start {
  timeId: number = -1;

  aboutToAppear(): void {
    this.timeId = setTimeout(() => {
      this.navPathStack.replacePathByName("Layout", null, false)
    }, 3000)
  }

  aboutToDisappear(): void {
    if (this.timeId != -1) {
      clearTimeout(this.timeId)
      this.timeId = -1
    }
  }

  navPathStack: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Stack({alignContent: Alignment.TopEnd}) {
        Image($r('app.media.ad'))
          .width("100%")
          .height("100%")
          .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
        Button("跳过")
          .backgroundColor(Color.Grey)
          .margin(15)
          .onClick(() => {
            this.navPathStack.replacePathByName("Layout", null, false)
          })
      }
    }
    .onReady((ctx: NavDestinationContext) => {
      // NavDestinationContext获取当前所在的导航控制器
      this.navPathStack = ctx.pathStack;
    })
  }
}