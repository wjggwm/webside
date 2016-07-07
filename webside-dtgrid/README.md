webside是基于RBAC的完全响应式权限管理系统，包括用户管理、角色管理，权限管理等功能，适合javaweb开发者入门学习，也可直接用于项目，省去重复开发权限管理模块，提高开发效率，项目使用主流技术如下：

服务端：
Spring4.1.6.RELEASE+SpringMVC4.1.6.RELEASE+Mybatis3.3.0+Shiro1.2.4+druid1.0.14+ehcache2.6.11 等

前端：
JQuery+Bootstrap3.3.5+ACE1.3.4（基于bootstrap的响应式后台管理模板）+layer+DTGrid+JQuery validation等

特点：
1、简单，项目代码均添加注释，阅读方便
2、精简，采用经典的MVC模式，对数据访问层和业务逻辑层进行了抽象，大大提高开发效率
3、快速，可以直接用于项目，只关注项目的核心功能模块，而无需重复开发权限管理模块
4、高逼格，项目使用maven进行构建
5、多维监控，添加druid监控和sirona监控，多重监控系统性能及各项指标
6、跨浏览器支持，IE、360、google、firefox 等主流浏览器


开发计划(不分先后)：
1、quartz计划任务
2、restful api 支持
3、restful api引入Protostuff(基于 Protobuf 序列化框架，面向 POJO，无需编写 .proto 文件)
4、Shiro Ajax请求权限不满足，拦截后解决方案
5、shiro + redis(NoSql) 集成
6、管理员权限的自动添加(当有一个权限创建，自动添加到管理员角色下，保证管理员是最大权限)(已实现)
7、RPC服务支持，Motan,是一套高性能、易于使用的分布式远程服务调用(RPC)框架。


未修复bug：2016-07-07
1、导出全部数据时日志报空指针异常 (已修复)
2、添加角色资源时赋权限给超级管理员异常(已修复)


dtgrid bug修复记录：
1、dlshouwen.grid.v1.2.1  分页条页码大小不一，分页说明和页面导航垂直不对齐的修改方法
	1、页面大小不一：bootstrap.min.css 中搜索 .pagination>li>a,.pagination>li>span 将 float:left 取消掉
	2、垂直不对齐：dlshouwen.grid.min.css 中搜索.dlshouwen-grid-toolbar-container .dlshouwen-grid-pager .dlshouwen-grid-pager-status 修改为float:right;margin:-3px 0px 0px 0px;height:28px;line-height:28px;
2、修复火狐浏览器下分页页码水平不对齐的bug
	1、在dlshouwen.grid.min.css 中搜索.dlshouwen-grid-toolbar-container .dlshouwen-grid-pager .dlshouwen-grid-pager-button 修改为float:right;margin:2px 0px 11px 10px;white-space: nowrap;
3、工具栏调整
	1、在dlshouwen.grid.min.css 中搜索.dlshouwen-grid-toolbar-container .dlshouwen-grid-tools 修改为 float:left;margin:0px 0px 12px 0px
4、导出全部数据有后台报空指针异常
	1、修改GridUtils.java 中 else if("number".equalsIgnoreCase(column.getType())&&!"".equals(column.getFormat())) 为  else if("number".equalsIgnoreCase(column.getType())&&!"".equals(column.getFormat())&& null != column.getFormat()) 
