package com.example.springboot.service.impl;

import cn.hutool.core.date.SystemClock;
import cn.hutool.core.lang.Dict;
import cn.hutool.json.JSONUtil;
import com.example.springboot.common.annotation.AutoLog;
import com.example.springboot.entity.Log;
import com.example.springboot.entity.User;
import com.example.springboot.service.ILogService;
import com.example.springboot.utils.IpUtils;
import com.example.springboot.utils.SessionUtils;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Component
@Aspect
@Slf4j
public class LogAspect {

    @Resource
    private ILogService logService;

    @Around("@annotation(autoLog)")
public Object autoLog(ProceedingJoinPoint joinPoint, AutoLog autoLog) throws Throwable {
        long beginTime = SystemClock.now();
        //执行方法
        Object result = joinPoint.proceed();
        //执行时长(毫秒)
        long time = SystemClock.now() - beginTime;
        // 操作
        String name = autoLog.value();
        HttpServletRequest request = getRequest();
        // 请求的url
        String url = request.getRequestURL().toString();
        if (url.contains("/file/download")) {
            return result;
        }
        // 请求参数
        String params = "";
        Object[] args = joinPoint.getArgs();
        if (args.length > 0) {
            Object arg0 = args[0];
            if (arg0 instanceof MultipartFile) {
                params = "文件流";
            } else if (arg0 instanceof String || arg0 instanceof Long || arg0 instanceof Integer) {
                params = arg0.toString();
            } else {
                params = JSONUtil.toJsonStr(args[0]);
            }
        }
        // 返回数据
        String returnValue = JSONUtil.toJsonStr(result);
        if (returnValue.length() > 1000) {
            returnValue = "数据过大，返回状态码：" + JSONUtil.parseObj(returnValue).getStr("code");
        }
        // ip 和地址
        Dict ipAndCity = IpUtils.getIPAndCity();
        String ip = ipAndCity.getStr("ip");
        String city = ipAndCity.getStr("city");
        // 操作人
        String username = "";
        User user = SessionUtils.getUser();
        if (user != null) {
            username = user.getUsername();
        }
        // 保存到数据库
        Log log = Log.builder().name(name).params(params).output(returnValue).url(url).ip(ip)
                .address(city).duration((int) time).username(username).build();
        logService.save(log);
        return result;
    }

    private HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }


}
