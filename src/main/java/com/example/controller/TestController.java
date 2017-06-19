package com.example.controller;

import com.example.model.*;
import com.example.service.UserService;
import com.example.service.impl.OrgServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TestController {
    @Autowired
    UserService userService;

    @Autowired
    OrgServiceImpl orgService;

    @RequestMapping(value = "/admin")
    @ResponseBody
    public String testSpring(Integer id,String name){
        return "my test";
    }

    @RequestMapping(value = "/index")
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/demo")
    public String demo() {
        return "demo";
    }

    @RequestMapping(value = "/jsTree")
    public String jsTree() {
        return "jsTreeDemo";
    }

    @RequestMapping(value = "/metronicDemo")
    public String metronicDemo() {
        return "metronicDemo";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> login(HttpServletRequest request){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String username = new String(request.getParameter("username").getBytes("iso-8859-1"),"utf-8");
            String password = new String(request.getParameter("password").getBytes("iso-8859-1"),"utf-8");
            if(username.equals("admin") && password.equals("123456")) {
                map.put("state", true);
                map.put("msg", "登录成功！");
            } else {
                map.put("state", false);
                map.put("msg", "账号或密码错误！");
            }

        } catch (Exception e) {
            map.put("state", false);
            map.put("msg", "网络异常！");
            e.printStackTrace();
        }
        return map;
    }

    @RequestMapping(value="/findAll")
    @ResponseBody
    public DataVo getUser(Integer start,Integer length,Integer draw,HttpServletRequest request){
        try {
            String serchKey = new String(request.getParameter("search[value]").getBytes("iso-8859-1"), "utf-8");
            //查询全部数据
            List<User> listAll = userService.findBySerchKey(serchKey);

            //查询分页之后的数据----start：数据开始位置 length：数据条数
            List<User> list = userService.findByPagingAndSerchKey(start, length, serchKey);

            //将sex转换为男女
            for (User item:list) {
                if(item.getSex().equals("1")) {
                    item.setSex("男");
                } else {
                    item.setSex("女");
                }
            }

            //将数据转换成JSON格式
            JSONArray array=JSONArray.fromObject(list);
            //封装数据
            DataVo result = new DataVo();
            result.setDraw(draw);
            //数据表中过滤后的总数
            result.setRecordsFiltered(listAll.size());
            //数据表中记录的总数
            result.setRecordsTotal(listAll.size());
            result.setData(array);

            System.out.println("JSON数据：" + array.toString());
            return result;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping(value = "/addOrEdit",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addOrEdit(User user){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            User record = null;
            record = userService.save(user);

            map.put("state", true);
            map.put("data", record);
        } catch (Exception e) {
            map.put("state", false);
            e.printStackTrace();
        }
        return map;
    }

    @RequestMapping("/deleteById")
    @ResponseBody
    public Map<String, Object> deleteById(Integer id,String deleList){
        try {
            if(!StringUtils.isEmpty(deleList)) {
                //通过id删除数据
                String[] ids = deleList.split(",");
                for (String item:ids) {
                    userService.deleteById(Integer.valueOf(item));
                }
            } else {
                userService.deleteById(id);
            }
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("state", true);
            return map;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    /**
     *  获取jsTree
     */
    @RequestMapping("/getJsTree")
    @ResponseBody
    public JSONArray getJsTree(){
        try {
            JsTreeVo treeVo = null;
            List<JsTreeVo> treeList = new ArrayList<JsTreeVo>();
            List<Org> list = orgService.findAll();
            for (Org item:list) {
                treeVo = new JsTreeVo();
                if(item.getParentId().equals(0)) {
                    treeVo.setParent("#");
                } else {
                    treeVo.setParent(item.getParentId().toString());
                }
                treeVo.setId(item.getId().toString());
                treeVo.setText(item.getOrgName());
                treeList.add(treeVo);
            }
            return JSONArray.fromObject(treeList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    /**
     *  异步加载树获取jsTree
     */
    @RequestMapping("/getJsTreeAsy")
    @ResponseBody
    public JSONArray getJsTreeAsy(String id){
        try {
            //异步加载树，每次查询该层节点和是否有子节点
            JsTreeVo treeVo = null;
            List<JsTreeVo> treeList = new ArrayList<JsTreeVo>();

            //传进来是根结点时，循环遍历到最底层
            if(id.equals("#")) {
                id = "0";
            }
            //查出本层部门
            List<Org> list = orgService.findByParentId(Integer.valueOf(id));

            //遍历部门判断该层部门下是否存在子部门，并将相关参数参加到treeVo中
            int index = 0;
            for (Org item:list) {
                treeVo = new JsTreeVo();
                State state = new State();
                List<Org> child = orgService.findByParentId(item.getId());

                if(!child.isEmpty()) {
                    treeVo.setChildren(true);
                }

                if(item.getParentId().equals(0)) {
                    treeVo.setParent("#");
                } else {
                    treeVo.setParent(item.getParentId().toString());
                }

                //打开并选中最后一层第一个树
                if(index == 0) {
                    state.setOpened(true);
                    if (child.isEmpty()) {
                        state.setSelected(true);
                    }
                }

                treeVo.setState(state);
                treeVo.setId(item.getId().toString());
                treeVo.setText(item.getOrgName());
                treeList.add(treeVo);

                index ++;
            }
            return JSONArray.fromObject(treeList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    /**
     * 查询对应部门的员工信息
     */
    @RequestMapping(value = "/orgUser",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getOrgUserInfo(Integer orgId,Integer iDisplayStart,Integer iDisplayLength,Integer sEcho,HttpServletRequest request) {
        try {
            String serchKey = new String(request.getParameter("sSearch").getBytes("iso-8859-1"), "utf-8");

            //查询未分页之前全部数据
            List<User> listAll = userService.findBySerchKeyAndOrgId(serchKey, orgId);

            //查询分页之后的数据----start：数据开始位置 length：数据条数
            List<User> list = userService.findByPagingAndSerchKeyAndOrgId(orgId,iDisplayStart, iDisplayLength, serchKey);

            //将sex转换为男女
            for (User item:list) {
                if(item.getSex().equals("1")) {
                    item.setSex("男");
                } else {
                    item.setSex("女");
                }
            }

            //将数据转换成JSON格式
            JSONArray array=JSONArray.fromObject(list);
            //封装数据
            DataVoOld result = new DataVoOld();
            result.setsEcho(sEcho);
            //数据表中过滤后的总数
            result.setiTotalDisplayRecords(listAll.size());
            //数据表中记录的总数
            result.setiTotalRecords(listAll.size());
            result.setAaData(array);

            System.out.println("JSON数据：" + JSONObject.fromObject(result).toString());
            return JSONObject.fromObject(result).toString();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
