项目部署说明：
1、mysql数据库，只需要先手动执行如下sql脚本即可，其他系统会自动处理

CREATE TABLE `webside`.`TB_SCHEMA_VERSION` (
    `installed_rank` INT NOT NULL,
    `version` VARCHAR(50),
    `description` VARCHAR(200) NOT NULL,
    `type` VARCHAR(20) NOT NULL,
    `script` VARCHAR(1000) NOT NULL,
    `checksum` INT,
    `installed_by` VARCHAR(100) NOT NULL,
    `installed_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `execution_time` INT NOT NULL,
    `success` BOOL NOT NULL,
    -- Add the primary key as part of the CREATE TABLE statement in case `innodb_force_primary_key` is enabled
    CONSTRAINT `TB_SCHEMA_VERSION_pk`PRIMARY KEY (`installed_rank`)
) ENGINE=InnoDB;


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

功能：
1、用户管理
2、角色管理
3、权限资源管理
4、druid监控&sirona监控
5、登录日志&操作日志监控
6、多级菜单支持，最多支持四级
7、基于quartz动态定时任务


开发计划(不分先后)：
1、quartz计划任务(已实现)
2、restful api 支持
3、restful api引入Protostuff(基于 Protobuf 序列化框架，面向 POJO，无需编写 .proto 文件)
4、Shiro Ajax请求权限不满足，拦截后解决方案
5、shiro + redis(NoSql) 集成
6、管理员权限的自动添加(当有一个权限创建，自动添加到管理员角色下，保证管理员是最大权限)(已实现)
7、RPC服务支持
	7.1、Motan(是一套高性能、易于使用的分布式远程服务调用(RPC)框架)
	7.2、Dubbox(支持REST风格远程调用（HTTP + JSON/XML)、支持基于Kryo和FST的Java高效序列化实现、支持基于嵌入式Tomcat的HTTP remoting体系)等
8、mysql集群
9、keepalive+Nginx 高可用web负载均衡
10、windows、linux下分布式集群部署
11、集成ip2region模块-ip到地区的映射库，实现基于ip的定位
12、flume-ng+Kafka+Storm+HDFS 实时系统搭建(http://www.aboutyun.com/thread-6855-1-1.html)


webside系统bug：
2016-07-07
1、导出全部数据时日志报空指针异常 (已修复)
2、添加角色资源时赋权限给超级管理员异常(已修复)
3、添加用户事务管理优化(已修复)

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
5、修改loadAll=true时是否传递参数到后台
	添加表格属性：postParams //是否传递参数,只在loadAll=true时有效
6、修改loadAll=true时刷新时是否重新从服务器获取数据
	添加表格属性：isreload //刷新时是否重新从服务器获取数据,只在loadAll=true时有效
	
7、修复firefox下表格工具栏样式错乱bug
	1、在dlshouwen.grid.min.css 中搜索.dlshouwen-grid-toolbar-container .dlshouwen-grid-tools 修改为 float:left;margin:0px 0px 12px 0px;white-space:nowrap;
	2、在dlshouwen.grid.min.css 中搜索.change-page-size 修改为width:68px;display:inline;padding:2px 4px;line-height:0;height:29px;

附加知识点：
quartz cron 说明：
Cron表达式时间字段：
格式: [秒] [分] [小时] [日] [月] [周] [年]
序号	说明	是否必填	允许填写的值			允许的通配符
1	秒	是		0-59 				, - * /
2	分	是		0-59				, - * /
3	小时	是		0-23				, - * /
4	日	是		1月31日				, - * ? / L W
5	月	是		1-12 or JAN-DEC		, - * /
6	周	是		1-7 or SUN-SAT		, - * ? / L #
7	年	否		empty 或 1970-2099	, - * /

 通配符说明:
* ：表示所有值. 例如:在分的字段上设置 "*",表示每一分钟都会触发。
? ：表示不指定值。使用的场景为不需要关心当前设置这个字段的值。例如:要在每月的10号触发一个操作，但不关心是周几，所以需要周位置的那个字段设置为"?" 具体设置为 0 0 0 10 * ?
- ：表示区间。例如 在小时上设置 "10-12",表示 10,11,12点都会触发。
, ：表示指定多个值，例如在周字段上设置 "MON,WED,FRI" 表示周一，周三和周五触发
/ ：用于递增触发。如在秒上面设置"5/15" 表示从5秒开始，每增15秒触发(5,20,35,50)。 在月字段上设置'1/3'所示每月1号开始，每隔三天触发一次。
L ：表示最后的意思。在日字段设置上，表示当月的最后一天(依据当前月份，如果是二月还会依据是否是润年[leap]), 在周字段上表示星期六，相当于"7"或"SAT"。如果在"L"前加上数字，则表示该数据的最后一个。
例如在周字段上设置"6L"这样的格式,则表示“本月最后一个星期五"
W ：表示离指定日期的最近那个工作日(周一至周五). 例如在日字段上设置"15W"，表示离每月15号最近的那个工作日触发。如果15号正好是周六，则找最近的周五(14号)触发, 如果15号是周未，则找最近的下周一(16号)触发.如果15号正好在工作日(周一至周五)，则就在该天触发。如果指定格式为 "1W",它则表示每月1号往后最近的工作日触发。如果1号正是周六，则将在3号下周一触发。(注，"W"前只能设置具体的数字,不允许区间"-").
'L'和 'W'可以一组合使用。如果在日字段上设置"LW",则表示在本月的最后一个工作日触发
 
# ：序号(表示每月的第几周星期几)，例如在周字段上设置"6#3"表示在每月的第三个周星期六.注意如果指定"6#5",正好第五周没有星期六，则不会触发该配置(用在母亲节和父亲节再合适不过了)
周字段的设置，若使用英文字母是不区分大小写的 MON 与mon相同.
 
Cron表达式示例：
格式: [秒] [分] [小时] [日] [月] [周] [年]
表达式						说明
"0 0 12 * * ? "				每天12点运行
"0 15 10 * * ?"				每天10:15运行
"0 15 10 * * ? 2011"		2011年的每天10：15运行
"0 * 14 * * ?"				每天14点到15点之间每分钟运行一次，开始于14:00，结束于14:59。
"0 0/5 14 * * ?"			每天14点到15点每5分钟运行一次，开始于14:00，结束于14:55。
"0 0/5 14,18 * * ?"			每天14点到15点每5分钟运行一次，此外每天18点到19点每5钟也运行一次。
"0 0-5 14 * * ?"			每天14:00点到14:05，每分钟运行一次。
"0 10,44 14 ? 3 WED"		3月每周三的14:10分到14:44，每分钟运行一次。
"0 15 10 ? * MON-FRI"		每周一，二，三，四，五的10:15分运行。
"0 15 10 15 * ?"			每月15日10:15分运行。
"0 15 10 L * ?"				每月最后一天10:15分运行。
"0 15 10 ? * 6L"			每月最后一个星期五10:15分运行。
"0 15 10 ? * 6L 2007-2009"	在2007,2008,2009年每个月的最后一个星期五的10:15分运行。
"0 15 10 ? * 6#3"			每月第三个星期五的10:15分运行。
0 0 12 1/5 * ?              每月的第一个中午开始每隔5天触发一次 
0 11 11 11 11 ?             每年的11月11号 11点11分触发(光棍节)




maven操作：

部署到Tomcat7:

在project视图中选中项目，右键"Run As"->"Maven bulid"，执行tomcat7:deploy命令，即可完成部署，执行tomcat7:redeploy即可重新部署项目，tomcat7:undeploy卸载部署。

logback+spring4配置：

<dependency>
  <groupId>org.logback-extensions</groupId>
  <artifactId>logback-ext-spring</artifactId>
  <version>0.1.4</version>
</dependency>

<context-param>
        <param-name>logbackConfigLocation</param-name>
        <param-value>/WEB-INF/classes/logback.xml</param-value>
    </context-param>
    <listener>
        <listener-class>ch.qos.logback.ext.spring.web.LogbackConfigListener</listener-class>
    </listener>
</context-param>