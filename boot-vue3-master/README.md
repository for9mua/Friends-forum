# （2023最新版）SpringBoot + Vue3代码生成器

## 技术栈
- 后端：SpringBoot + Mybatis-Plus + Sa-token + Redis
- 前端：Vue3 + Element-Plus + Pinia + Vue-Router4

## 注意事项
- 项目启动之前先安装并启动redis。
- 数据库表都要存在 `deleted` 这个字段，默认值是0，必须写，用于软删除。
- id主键，自增 int类型，必填字段
- 表一定要写注释

生成代码：  
TABLE = "dynamic";  
MODULE_NAME = "动态";  
VUE_CODE_PATH = "D:\\知识星球\\partner-manager\\src\\views\\";

**生成完代码之后一定要重启后台！！！**