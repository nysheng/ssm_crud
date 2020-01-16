# ssm_crud
ssm项目整合（增删改查）
> 项目使用spring、springMVC、mybatis实现了简单的增删改查功能，是ssm框架的一次整合实践，适用于新手学习

## 一、实现的功能
1、 分页

2、 数据校验
- 前端校验：jquery验证
- 后端校验：jsr303验证，后端正则验证

3、 ajax异步发送请求

4、 restful风格，使用https动词（POST、DELETE、PUT、GET）来操作资源（增、删、改、查）

5、客户端无关性，服务器返回json数据

## 二、技术点
1、 服务器： Tomcat

2、 数据库： Mysql

3、 后端框架： SSM（SpringMVC+Spring+MyBatis）

4、 前端框架： bootstrap

5、 项目依赖管理工具： Maven

6、 分页： pagehelper

7、 逆向工程： Mybatis Generetor

## 三、页面显示
1、 查（index.jsp）

![get](https://img-blog.csdnimg.cn/20200116185916159.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNzgwODA1,size_16,color_FFFFFF,t_70)
<hr/>
2、 增（post）

![add_post](https://img-blog.csdnimg.cn/20200116190022331.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNzgwODA1,size_16,color_FFFFFF,t_70)
<hr/>
3、 删（delete 单个删除/批量删除）

![delete_once](https://img-blog.csdnimg.cn/20200116190116661.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNzgwODA1,size_16,color_FFFFFF,t_70)
![delete_batch](https://img-blog.csdnimg.cn/2020011619020570.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNzgwODA1,size_16,color_FFFFFF,t_70)
<hr/>
4、 修改（put）

![modify_put](https://img-blog.csdnimg.cn/20200116190332980.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwNzgwODA1,size_16,color_FFFFFF,t_70)
