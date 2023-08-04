package com.blue.demo.controller;

import liquibase.pro.packaged.P;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;

@RestController
@RequestMapping("/process")
public class ProcessController {

    @Autowired
    private RepositoryService repositoryService;

    @PostMapping("/create")
    public String createProcess(MultipartFile file) {
        String fileName = file.getOriginalFilename();
        //获取文件后缀名
        String suffix = fileName.substring(fileName.indexOf("."));
        if (".bpmn20.xml".equals(suffix)) {
            //指定本地文件夹存储图片，写到需要保存的目录下
            try {
                DeploymentBuilder deployment = repositoryService.createDeployment();
                InputStream inputStream = file.getInputStream();
                deployment.addInputStream(fileName, inputStream).parentDeploymentId("blue").deploy();
                inputStream.close();
                //返回提示信息
            } catch (Exception e) {
                return "error";
            }
            return "success";
        } else {
            return "格式错误";
        }
    }

    /**
     * 查询所有定义流程最后版本
     *
     * @return
     */
    @GetMapping("/getAll")
    public String getAllProcess() {
        ProcessDefinitionQuery processDefinitionQuery = repositoryService.createProcessDefinitionQuery();
        List<ProcessDefinition> list = processDefinitionQuery.latestVersion().list();
        return list.toString();
    }

    @DeleteMapping("/delete")
    public String delete(String processId) {
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(processId).singleResult();
        repositoryService.deleteDeployment(processDefinition.getDeploymentId());
        return "success";
    }
}
