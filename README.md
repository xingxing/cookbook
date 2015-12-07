# Cookbook App

请用angularjs制作一个菜谱网站，把程序部署到 herko上，把代码上传到github。

### Cookbook是一个菜谱网站，要求如下：

1. Cookbook index 页面
   1. 显示菜谱列表 - 显示多个 菜谱的名称，图片，描述
   2. 有搜索form，可以根据 tag，菜谱名称，描述，材料名称搜索（材料名可提供多选checkboxes，如果多选则意味着为 搜索所有包含材料1并且包含材料2的菜谱）
   3. 可根据 created_at, 菜谱名称 排序
   4. 有分页功能

2. New cookbook页面
   1. 一个 cookbook包含多个材料（materials）。一个 material包含三个元素，name, quantity, unit (名称，数量，单位)。
   2. 一个cookbook可添加多个 tag
   3. 一个cookbook可上传一个图片
   4. 材料的field可以都是 text field
   5. 使用angularjs 在页面不跳转的情况下，可完成创建菜谱工作
   6. angularjs 必须使用至少一个自定义 directive
   7. 例子：  辣椒炒肉 是一个菜谱，包含 （辣椒，100，克），（猪肉，300，克），（酱油，1，糖勺）标签是： 川菜，中辣

3. Create cookbook

   1. 每次创建完一个cookbook，通过google API 创建一个google sheet，sheet中包含，菜谱名称，描述，图片url，材料（名称，数量，单位），把这个sheet设置为可通过anyone can view with share url,，并且把url保存在cookbook的数据库里.
   2. google API:
       -  https://developers.google.com/google-apps/spreadsheets/
       -  https://github.com/google/google-api-ruby-client
       -  https://developers.google.com/drive/web/mime-types
   

4. Cookbook show页面
   1. 有编辑和删除按钮
   2. 可看到 名称，描述，图片，标签，材料等信息
   3. 可看到 google sheet的 url，点击可跳转到 google sheet看 sheet的信息

5. Cookbook， Edit和Update
   1. 要求和 new的界面一致
   2. Edit的时候，能把材料显示正确，并且可正确更新
   
6. 功能可用，合理

7. 代码上传至 Github, 设置为公开

8. 代码部署在 Heroku上
