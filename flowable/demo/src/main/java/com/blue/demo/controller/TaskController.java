package com.blue.demo.controller;

import org.apache.ibatis.annotations.Param;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.engine.form.FormData;
import org.flowable.task.api.Task;
import org.flowable.task.api.TaskQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/task")
public class TaskController {

    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private TaskService taskService;

    @GetMapping("/getTask")
    public String getTask(String process, String assignee) {
        TaskQuery taskQuery = taskService.createTaskQuery();
        List<Task> list = taskQuery.processDefinitionId(process)//指定查询流程
                .taskAssignee(assignee)//查询这个任务的处理人
                .list();
        return list.toString();
    }

    @PostMapping("/createTask")
    public String createTask(@RequestBody Map<String, Object> map) {
        String process = (String) map.get("process");
        Map data = (Map) map.get("data");
        runtimeService.startProcessInstanceById(process, data);
        return "success";
    }

    @PutMapping("/handleTask")
    public String handleTask(String taskId) {
        taskService.complete(taskId);
        return "success";
    }
}
