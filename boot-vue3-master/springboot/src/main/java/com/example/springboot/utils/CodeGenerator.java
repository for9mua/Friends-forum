package com.example.springboot.utils;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.resource.ResourceUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Db;
import cn.hutool.db.DbUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.ds.simple.SimpleDataSource;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
import com.baomidou.mybatisplus.generator.fill.Column;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.config.YamlPropertiesFactoryBean;
import org.springframework.core.io.ClassPathResource;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 代码生成器
 * v1.0
 * 作者：程序员青戈
 */
@Slf4j
public class CodeGenerator {

    private static final String TABLE = "orders";  // 表名
    private static final String MODULE_NAME = "积分订单";  // 菜单名称

    private static final String PACKAGE_NAME = "com.example.springboot";  // java代码的包名
    private static final String AUTHOR = "ikun";   // 作者

    /*=========================  下面的不用改动  =========================*/

    private static final String PROJECT_PATH = System.getProperty("user.dir");
    public static final String MAPPER_XML_PATH = "/springboot/src/main/resources/mapper/";
    public static final String JAVA_CODE_PATH = "/springboot/src/main/java/";
    private static final String VUE_CODE_PATH = PROJECT_PATH + "\\vue\\src\\views\\";  // vue代码的路径
    private static final String SPACE6 = "      ";
    private static final String SPACE8 = "        ";
    private static final String SPACE10 = "          ";
    private static final String SPACE4 = "    ";

    public static void main(String[] args) throws SQLException {
        generateJava(TABLE, MODULE_NAME);   // 生成Java后台代码
        generateVue(TABLE);   // 生成Vue文件
        generatePermissionSqlData(TABLE); // 生成权限菜单
    }

    private static void generatePermissionSqlData(String tableName) throws SQLException {
        // 获取数据库连接的信息
        DBProp dbProp = getDBProp();
        // 连接数据库
        DataSource dataSource = new SimpleDataSource(dbProp.getUrl(), dbProp.getUsername(), dbProp.getPassword());
        Db db = DbUtil.use(dataSource);
        String lowerEntity = getLowerEntity(tableName);

        // 先删除菜单sql再插入新的sql
        db.execute("delete from `sys_permission` where `auth` like '" + lowerEntity + "%' or path like '" + lowerEntity + "%'");
        db.execute("INSERT INTO `sys_permission` (`name`, `path`, `icon`, `page`, `type`) " +
                        "VALUES (?, ?, ?, ?, ? )", MODULE_NAME + "管理", lowerEntity, "grid",
                getEntity(tableName), "2");
        List<Entity> pages = db.findBy("sys_permission", "path", lowerEntity);
        Entity entity = pages.get(0);
        Integer pid = entity.getInt("id");
        db.execute("INSERT INTO `sys_permission` (`name`, `auth`, `pid`, `type`) " +
                "VALUES (?, ?, ?, ?)", MODULE_NAME + "查询", lowerEntity + ".list", pid, "3");
        db.execute("INSERT INTO `sys_permission` (`name`, `auth`, `pid`, `type`) " +
                "VALUES (?, ?, ?, ?)", MODULE_NAME + "新增", lowerEntity + ".add", pid, "3");
        db.execute("INSERT INTO `sys_permission` (`name`, `auth`, `pid`, `type`) " +
                "VALUES (?, ?, ?, ?)", MODULE_NAME + "导入", lowerEntity + ".import", pid, "3");
        db.execute("INSERT INTO `sys_permission` (`name`, `auth`, `pid`, `type`) " +
                "VALUES (?, ?, ?, ?)", MODULE_NAME + "导出", lowerEntity + ".export", pid, "3");
        db.execute("INSERT INTO `sys_permission` (`name`, `auth`, `pid`, `type`) " +
                "VALUES (?, ?, ?, ?)", "批量删除", lowerEntity + ".deleteBatch", pid, "3");
        db.execute("INSERT INTO `sys_permission` (`name`, `auth`, `pid`, `type`) " +
                "VALUES (?, ?, ?, ?)", MODULE_NAME + "编辑", lowerEntity + ".edit", pid, "3");
        db.execute("INSERT INTO `sys_permission` (`name`, `auth`, `pid`, `type`) " +
                "VALUES (?, ?, ?, ?)", MODULE_NAME + "删除", lowerEntity + ".delete", pid, "3");

        // 给管理员默认所有的权限
        List<Entity> adminRole = db.findBy("sys_role", "flag", "ADMIN");
        if (CollUtil.isNotEmpty(adminRole)) {
            // 先删除管理员权限
            db.execute("delete from `sys_role_permission` where `role_id` = " + adminRole.get(0).getInt("id"));
            List<Entity> permissionAll = db.findAll("sys_permission");
            // 再添加所有权限给管理员
            for (Entity per : permissionAll) {
                db.execute("INSERT INTO `sys_role_permission` (`role_id`, `permission_id`) " +
                        "VALUES (?, ?)", adminRole.get(0).getInt("id"), per.getInt("id"));
            }
        }
        log.debug("========================== 菜单Sql生成完成！！！==========================");
    }

    private static void generateVue(String tableName) {

        List<TableColumn> tableColumns = getTableColumns(tableName);

        // 读取模板，生成代码
        String vueTemplate = ResourceUtil.readUtf8Str("templates/vue.template");

        // 封装模板的代码
        Map<String, String> map = new HashMap<>();
        map.put("lowerEntity", getLowerEntity(tableName));  // 接口前缀

        String vueTableBody = getVueTableBody(tableColumns);
        map.put("tableBody", vueTableBody);

        String vueFormBody = getVueFormBody(tableColumns);
        map.put("formBody", vueFormBody);
        map.put("moduleName", MODULE_NAME);

        String extendImport = "";
        String extendVariable = "";
        String extendHtml = "";
        long content = tableColumns.stream().filter(tableColumn -> tableColumn.getColumnName().equals("content")).count();  //从富文本
        List<TableColumn> selects = tableColumns.stream().filter(tableColumn -> tableColumn.getColumnName().endsWith("_id")).collect(Collectors.toList());// 下拉选框
        if (content > 0) {  // 富文本
            extendImport += "import { onBeforeUnmount, shallowRef} from \"vue\" \n" +
                    "import '@wangeditor/editor/dist/css/style.css' // 引入 css\n" +
                    "import { Editor, Toolbar } from '@wangeditor/editor-for-vue'\n";

            extendVariable += "// 编辑器实例，必须用 shallowRef\n" +
                    "const editorRef = shallowRef()\n" +
                    "const editorConfig = {\n" +
                    "  placeholder: '请输入内容...',\n" +
                    "  MENU_CONF: {\n" +
                    "    uploadImage: {\n" +
                    "      fieldName: 'file',\n" +
                    "      server: `http://${config.serverUrl}/file/uploadImg`,\n" +
                    "      headers: {\n" +
                    "        Authorization: token\n" +
                    "      }\n" +
                    "    }\n" +
                    "  }\n" +
                    "}\n" +
                    "const content = ref('')\n" +
                    "const viewShow = ref(false)\n" +
                    "const view = (value) => {\n" +
                    "  viewShow.value = true\n" +
                    "  content.value = value\n" +
                    "}\n" +
                    "const handleCreated = (editor) => {\n" +
                    "  editorRef.value = editor // 记录 editor 实例，重要！\n" +
                    "}\n" +
                    "// 组件销毁时，也及时销毁编辑器\n" +
                    "onBeforeUnmount(() => {\n" +
                    "  const editor = editorRef.value\n" +
                    "  if (editor == null) return\n" +
                    "  editor.destroy()\n" +
                    "})\n";

            extendHtml = SPACE4 + "<el-dialog v-model=\"viewShow\" title=\"预览\" width=\"40%\">\n" +
                    "      <div  id=\"editor-content-view\" class=\"editor-content-view\" v-html=\"content\" style=\"padding: 0 20px\"></div>\n" +
                    "      <template #footer>\n" +
                    "      <span class=\"dialog-footer\">\n" +
                    "        <el-button @click=\"viewShow = false\">关闭</el-button>\n" +
                    "      </span>\n" +
                    "      </template>\n" +
                    "    </el-dialog>\n";
        }
        if (selects.size() > 0) {
            for (TableColumn tableColumn : selects) {
                String camelEntity = StrUtil.toCamelCase(tableColumn.getColumnName());
                extendVariable += "state." + camelEntity.replaceAll("Id", "") + "Options = []\n" +
                        "request.get('/" + camelEntity.replaceAll("Id", "") + "').then(res => state." + camelEntity.replaceAll("Id", "") + "Options = res.data)\n";
            }
        }
        map.put("extendImport", extendImport);
        map.put("extendVariable", extendVariable);
        map.put("extendHtml", extendHtml);


        // 生成页面代码
        String vuePage = StrUtil.format(vueTemplate, map);  // vuePage是替换字符串模板后的内容
        // 写文件
        //  "D:\\知识星球\\partner-manager\\src\\views\\"  是你vue工程文件的目录
        String entity = getEntity(tableName);
        FileUtil.writeUtf8String(vuePage, VUE_CODE_PATH + entity + ".vue");
        log.debug("==========================" + entity + ".vue文件生成完成！！！==========================");
    }

    private static List<TableColumn> getTableColumns(String tableName) {
        // 获取数据库连接的信息
        DBProp dbProp = getDBProp();
        // 连接数据库
        DataSource dataSource = new SimpleDataSource("jdbc:mysql://localhost:3306/information_schema", dbProp.getUsername(), dbProp.getPassword());
        Db db = DbUtil.use(dataSource);

        // 拿到实际要生成代码的数据库的名称
        String url = dbProp.getUrl();
        String schema = url.substring(url.indexOf("3306/") + 5, url.indexOf("?"));

        List<TableColumn> tableColumnList = new ArrayList<>();
        try {
            List<Entity> columns = db.findAll(Entity.create("COLUMNS").set("TABLE_SCHEMA", schema).set("TABLE_NAME", tableName));
            //封装结构化的表数据信息
            for (Entity entity : columns) {
                String columnName = entity.getStr("COLUMN_NAME");  // 字段名称
                String dataType = entity.getStr("DATA_TYPE");  // 字段名称
                String columnComment = entity.getStr("COLUMN_COMMENT");  // 字段名称
                TableColumn tableColumn = TableColumn.builder().columnName(columnName).dataType(dataType).columnComment(columnComment).build();
                tableColumnList.add(tableColumn);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return tableColumnList;
    }

    private static String getVueTableBody(List<TableColumn> tableColumnList) {
        StringBuilder builder = new StringBuilder();
        for (TableColumn tableColumn : tableColumnList) {
            if (tableColumn.getColumnName().equalsIgnoreCase("id") && StrUtil.isBlank(tableColumn.getColumnComment())) {
                tableColumn.setColumnComment("编号");
            }
            if (tableColumn.getColumnName().equalsIgnoreCase("deleted") || tableColumn.getColumnName().equalsIgnoreCase("create_time")
                    || tableColumn.getColumnName().equalsIgnoreCase("update_time")) {  // 排除deleted create_time  update_time 这个无需关注的字段
                continue;
            }
            String camelCaseName = StrUtil.toCamelCase(tableColumn.getColumnName());
            if (tableColumn.getColumnName().endsWith("img")) {
                builder.append(SPACE6).append("<el-table-column label=\"" + tableColumn.getColumnComment() + "\"><template #default=\"scope\"><el-image preview-teleported style=\"width: 80px; height: 80px\" :src=\"scope.row.").append(camelCaseName).append("\" :preview-src-list=\"[scope.row.img]\"></el-image></template></el-table-column>\n");
            } else if (tableColumn.getColumnName().endsWith("file")) {
                builder.append(SPACE6).append("<el-table-column label=\"" + tableColumn.getColumnComment() + "\"><template #default=\"scope\"> <a :href=\"scope.row.").append(camelCaseName).append("\" target=\"_blank\" style=\"text-decoration: none; color: dodgerblue\">点击下载</a></template></el-table-column>\n");
            } else if (tableColumn.getColumnName().equals("content")) {
                builder.append(SPACE6).append("<el-table-column label=\"预览\"><template #default=\"scope\"><el-button @click=\"view(scope.row.content)\">查看</el-button></template></el-table-column>\n");
            } else if (tableColumn.getColumnName().endsWith("_id")) {  // 选择框显示名称
                builder.append(SPACE6).append("<el-table-column label=\"" + tableColumn.getColumnComment().replaceAll("id", "") + "\"><template #default=\"scope\"><span v-if=\"scope.row." + camelCaseName + "\">{{ state." + camelCaseName.replaceAll("Id", "") + "Options.find(v => v.id === scope.row." + camelCaseName + ") ? state." + camelCaseName.replaceAll("Id", "") + "Options.find(v => v.id === scope.row." + camelCaseName + ").name : '' }}</span></template></el-table-column>\n");
            } else {
                builder.append(SPACE6).append("<el-table-column prop=\"").append(camelCaseName).append("\" label=\"").append(tableColumn.getColumnComment()).append("\"></el-table-column>\n");
            }
        }
        return builder.toString();
    }

    private static String getVueFormBody(List<TableColumn> tableColumnList) {
        StringBuilder builder = new StringBuilder();
        for (TableColumn tableColumn : tableColumnList) {
            if (tableColumn.getColumnName().equalsIgnoreCase("id")) {
                continue;
            }
            if (tableColumn.getColumnName().equalsIgnoreCase("deleted") || tableColumn.getColumnName().equalsIgnoreCase("create_time")
                    || tableColumn.getColumnName().equalsIgnoreCase("update_time")) {  // 排除deleted create_time  update_time 这个无需关注的字段
                continue;
            }
            String camelCaseName = StrUtil.toCamelCase(tableColumn.getColumnName());
            builder.append(SPACE8).append("<el-form-item prop=\"").append(camelCaseName).append("\" label=\"").append(tableColumn.getColumnComment().replaceAll("id", "")).append("\">\n");
            if (tableColumn.getColumnName().contains("time")) {
                // 日期时间
                builder.append(SPACE10).append("<el-date-picker style=\"width: 100%\" v-model=\"state.form.").append(camelCaseName)
                        .append("\" type=\"datetime\" value-format=\"YYYY-MM-DD HH:mm:ss\" placeholder=\"选择日期时间\"></el-date-picker>\n");
            } else if (tableColumn.getColumnName().endsWith("date")) {
                // 日期
                builder.append(SPACE10).append("<el-date-picker style=\"width: 100%\" v-model=\"state.form.").append(camelCaseName).append("\" type=\"date\" value-format=\"YYYY-MM-DD\" placeholder=\"选择日期\"></el-date-picker>\n");
            } else if (tableColumn.getColumnName().endsWith("file")) {
                // 文件上传
                builder.append(SPACE10).append("<el-upload :show-file-list=\"false\" :action=\"`http://${config.serverUrl}/file/upload`\" ref=\"file\" :headers=\"{ Authorization: token}\" :on-success=\"handleFileUploadSuccess\">\n");
                builder.append(SPACE10).append("  <el-button size=\"small\" type=\"primary\">点击上传</el-button>\n");
                builder.append(SPACE10).append("</el-upload>\n");
            } else if (tableColumn.getColumnName().endsWith("img")) {
                // 图片
                builder.append(SPACE10).append("<el-upload :show-file-list=\"false\" :action=\"`http://${config.serverUrl}/file/upload`\" ref=\"file\" :headers=\"{ Authorization: token}\" :on-success=\"handleImgUploadSuccess\">\n");
                builder.append(SPACE10).append("  <el-button size=\"small\" type=\"primary\">点击上传</el-button>\n");
                builder.append(SPACE10).append("</el-upload>\n");
            } else if (tableColumn.getColumnName().endsWith("radio")) {
                // 单选
                builder.append(SPACE10)
                        .append("<el-radio-group v-model=\"state.form." + camelCaseName + "\">\n" +
                                "            <el-radio label=\"是\">是</el-radio>\n" +
                                "            <el-radio label=\"否\">否</el-radio>\n" +
                                "          </el-radio-group>");
            } else if (tableColumn.getColumnName().endsWith("_id")) {
                // 下拉选择
                builder.append(SPACE10)
                        .append("<el-select clearable v-model=\"state.form." + camelCaseName + "\" placeholder=\"请选择\"  style=\"width: 100%\">\n" +
                                "            <el-option v-for=\"item in state." + camelCaseName.replaceAll("Id", "") + "Options\" :key=\"item.id\" :label=\"item.name\" :value=\"item.id\"></el-option>\n" +
                                "          </el-select>\n");
            } else if (tableColumn.getColumnName().equals("content")) {
                // 富文本
                builder.append(SPACE10).append("<div style=\"border: 1px solid #ccc\">\n" +
                        "    <Toolbar\n" +
                        "        style=\"border-bottom: 1px solid #ccc\"\n" +
                        "        :editor=\"editorRef\"\n" +
                        "        :mode=\"'simple'\"\n" +
                        "    />\n" +
                        "    <Editor\n" +
                        "        style=\"height: 300px; overflow-y: hidden;\"\n" +
                        "        v-model=\"valueHtml\"\n" +
                        "        :defaultConfig=\"editorConfig\"\n" +
                        "        :mode=\"'simple'\"\n" +
                        "        @onCreated=\"handleCreated\"\n" +
                        "    />\n" +
                        "  </div>");
            } else {
                builder.append(SPACE10).append("<el-input v-model=\"state.form.").append(camelCaseName).append("\" autocomplete=\"off\"></el-input>\n");
            }
            builder.append(SPACE8).append("</el-form-item>\n");
        }
        return builder.toString();
    }

    private static String getLowerEntity(String tableName) {
        tableName = tableName.replaceAll("t_", "").replaceAll("sys_", "");
        return StrUtil.toCamelCase(tableName);
    }

    private static String getEntity(String tableName) {
        String lowerEntity = getLowerEntity(tableName);
        return lowerEntity.substring(0, 1).toUpperCase() + lowerEntity.substring(1);
    }

    private static DBProp getDBProp() {
        ClassPathResource resource = new ClassPathResource("application.yml");
        YamlPropertiesFactoryBean yamlPropertiesFactoryBean = new YamlPropertiesFactoryBean();
        yamlPropertiesFactoryBean.setResources(resource);
        Properties dbProp = yamlPropertiesFactoryBean.getObject();
        return DBProp.builder().url(dbProp.getProperty("spring.datasource.url"))
                .username(dbProp.getProperty("spring.datasource.username"))
                .password(dbProp.getProperty("spring.datasource.password")).build();
    }


    private static void generateJava(String tableName, String moduleName) {
        DBProp dbProp = getDBProp();
        FastAutoGenerator.create(dbProp.getUrl(), dbProp.getUsername(), dbProp.getPassword())
                .globalConfig(builder -> {
                    builder.author(AUTHOR) // 设置作者
                            .enableSwagger()
                            .disableOpenDir()
                            .outputDir(PROJECT_PATH + JAVA_CODE_PATH); // 指定输出目录
                })
                .packageConfig(builder -> {
                    builder.parent(PACKAGE_NAME) // 设置父包名
                            .moduleName("") // 设置父包模块名
                            .pathInfo(Collections.singletonMap(OutputFile.xml, PROJECT_PATH + MAPPER_XML_PATH)); // 设置mapperXml生成路径
                })
                .strategyConfig(builder -> {
                    builder.controllerBuilder().fileOverride().enableRestStyle().enableHyphenStyle()
                            .serviceBuilder().fileOverride()
                            .mapperBuilder().fileOverride()
                            .entityBuilder().fileOverride().enableLombok()
                            .logicDeleteColumnName("deleted")
                            .addTableFills(new Column("create_time", FieldFill.INSERT))
                            .addTableFills(new Column("update_time", FieldFill.INSERT_UPDATE));
                    builder.addInclude(tableName) // 设置需要生成的表名
                            .addTablePrefix("t_", "sys_"); // 设置过滤表前缀
                })
                .injectionConfig(builder -> builder.customMap(Collections.singletonMap("moduleName", moduleName)))    // 自定义配置
                .templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
                .execute();
    }

}
