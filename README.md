**webside**是基于RBAC的完全响应式权限管理系统，包括用户管理、角色管理，权限管理等功能，适合javaweb开发者入门学习，也可直接用于项目，省去重复开发权限管理模块，提高开发效率，项目使用主流技术如下：

**服务端：**

Spring4.3.0.RELEASE+SpringMVC4.3.0.RELEASE+Mybatis3.3.0+Shiro1.3.2+druid1.0.27+quartz2.2.3+logback1.1.7等

**前端：**

JQuery+Bootstrap3.3.5+ACE1.3.4（基于bootstrap的响应式后台管理模板）+layer+dlshouwen.grid.v1.2.1+JQuery validation等

**数据存储：** 

数据库使用Mysql + Redis + Ehcache

**主要功能：** 

- 这里是列表文本系统基础管理：用户管理、角色管理、资源管理
- 
- 系统监控管理：在线用户、Sirona监控、Druid监控
- 
- 日志信息管理：用户登录信息、用户操作信息
- 
- 多级菜单：最多支持四级菜单
- 
- 计划任务管理：计划中任务、运行中任务
- 
- 控制台：欢迎页

**特点：**

1、简单，项目代码均添加注释，阅读方便

2、精简，采用经典的MVC模式，对数据访问层和业务逻辑层进行了抽象，大大提高开发效率

3、快速，可以直接用于项目，只关注项目的核心功能模块，而无需重复开发权限管理模块

4、高逼格，项目使用maven进行构建

5、多维监控，添加druid监控和sirona监控，多重监控系统性能及各项指标

6、跨浏览器支持，IE、360、google、firefox 等主流浏览器

7、使用CDN加速，更快的页面加载体验

8、使用bootstrap响应式布局，PC、移动端完美自适应

9、地址栏智能过滤，防止用户直接输入地址进行操作

10、公益404页面，爱心满满

11、动态权限控制、session共享，集群更简单

**部署方法：**部署的详细步骤请见[wiki](http://git.oschina.net/wjggwm/webside/wikis/deploy)


![](http://git.oschina.net/uploads/images/2016/1013/144758_81218cf8_413659.png "")