# Leaflet 插件聚类功能安装说明

## 已完成的修改

### 1. 类型定义 (types/saved.d.ts, types/map.d.ts)
添加了以下配置接口：
- `enableMarkerClustering?: boolean` - 是否启用聚类
- `maxClusterRadius?: number` - 最大聚类半径
- `spiderfyOnMaxZoom?: boolean` - 最大缩放时是否展开
- `zoomToBoundsOnClick?: boolean` - 点击是否缩放边界

### 2. 设置界面 (src/settings/settings.ts)
添加了"Marker Clustering"设置分组：
- Enable Marker Clustering (开关)
- Max Cluster Radius (文本输入，默认 80)
- Spiderfy on Max Zoom (开关，默认 true)
- Zoom to Bounds on Click (开关，默认 true)

### 3. 地图初始化 (src/map/map.ts)
修改了 `addFeatures()` 和 `updateMarkerIcons()` 方法：
- 当启用聚类时使用 `L.markerClusterGroup()`
- 否则使用 `L.featureGroup()`

### 4. 样式导入 (src/main.ts)
添加了 MarkerCluster 的 CSS 文件导入

### 5. 依赖配置 (package.json)
添加了：
- `leaflet.markercluster`: "^1.5.3"
- `@types/leaflet.markercluster`: "^1.4.6"

## 编译步骤

### 方法 1：使用批处理脚本（推荐）

1. 双击运行 `E:\obsidian\yong\obsidian-leaflet-main\build-and-copy.bat`
2. 等待编译完成
3. 在 Obsidian 中重新加载插件

### 方法 2：手动编译

1. 打开命令提示符（cmd）
2. 进入源码目录：
   ```
   cd E:\obsidian\yong\obsidian-leaflet-main
   ```
3. 安装依赖：
   ```
   npm install
   ```
4. 编译：
   ```
   npm run build
   ```
5. 复制文件：
   ```
   copy main.js E:\obsidian\yong\.obsidian\plugins\obsidian-leaflet-plugin\main.js
   copy manifest.json E:\obsidian\yong\.obsidian\plugins\obsidian-leaflet-plugin\manifest.json
   ```

## 使用方法

1. 在 Obsidian 中重新加载插件
2. 打开插件设置
3. 找到"Marker Clustering"部分
4. 启用"Enable Marker Clustering"
5. 根据需要调整其他参数

### 在笔记中使用

在代码块中添加参数：

````markdown
```leaflet
id: map1
lat: 39.9
long: 116.4
enableMarkerClustering: true
maxClusterRadius: 80
markers:
  - lat: 39.9
    long: 116.4
  - lat: 39.91
    long: 116.41
```
````

## 注意事项

1. 编译需要 Node.js 环境
2. 如果编译失败，请确保已安装所有依赖
3. 插件更新后需要重新应用修改

## 故障排除

### 编译错误
如果遇到 TypeScript 类型错误，可能需要更新类型定义。

### 运行时错误
如果地图无法加载，请检查浏览器控制台是否有错误信息。

### 聚类不工作
1. 确认已启用 `enableMarkerClustering`
2. 确认 marker 数量足够多且距离足够近
3. 检查浏览器控制台是否有错误
