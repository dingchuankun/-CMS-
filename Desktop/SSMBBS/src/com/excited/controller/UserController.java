package com.excited.controller;

import com.excited.domain.Post;
import com.excited.domain.User;
import com.excited.domain.UserLoginLog;
import com.excited.service.LoginLogService;
import com.excited.service.PostService;
import com.excited.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
    @Autowired
    PostService postService;
	@Autowired
	private LoginLogService loginLogService;

	// 用户登录
	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	public String userLogin(User loginUser, HttpServletRequest request, RedirectAttributes redirect)
			throws ParseException, UnknownHostException {
		// 通过用户名查找User对象
		User user = userService.getUserByUserName(loginUser.getUserName());
		String password = "";
		if (user != null) {
			password = userService.getPassword(user.getUserName());
		}

		// 判断登录信息是否正确
		if (user != null && loginUser.getPassword().equals(password)) {

			// 获取登录基本信息
			InetAddress address = InetAddress.getLocalHost();//获取的是本地的IP地址 //PC-20140317PXKX/192.168.0.121
			String lastIp = address.getHostAddress();//192.168.0.121  
			String userName = user.getUserName();
			// 更新用户登录日志
			UserLoginLog userLoginLog = new UserLoginLog();
			System.out.println(userLoginLog);
			userLoginLog.setUserName(userName);
			userLoginLog.setLoginIp(lastIp);
			// 转换日期格式
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String format = sf.format(new Date());
			Date parse = sf.parse(format);
			userLoginLog.setLoginDateTime(parse);
			loginLogService.addUserLoginLog(userLoginLog);
			// 更新用户信息
			user.setLastIp(lastIp);
			user.setLastLoginTime(parse);
			user.setCredit(5 + user.getCredit());
			userService.updateUserByUserName(user);
			// 登陆成功，跳转到主页
			request.getSession().setAttribute("username", user.getUserName());

			return "redirect:/main";
		}
		// 登录失败，跳转页面
		request.setAttribute("Msg", "登录失败");
		return "error";
	}

	// 用户注册
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String userRegister(User userRegister, HttpServletRequest request) {
		User user = userRegister;
		if (user != null) {
			try {
				String username = user.getUserName();
				InetAddress address = InetAddress.getLocalHost();//获取的是本地的IP地址 //PC-20140317PXKX/192.168.0.121
				String ip = address.getHostAddress();//192.168.0.121   
				// 如果数据库中没有该用户，可以注册，否则跳转页面
				if (userService.getUserByUserName(username) == null) {
					// 添加用户
					user.setLastIp(ip);
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
					String format = sf.format(new Date());
					Date parse = sf.parse(format);
					user.setCreateTime(parse);
					user.setLastLoginTime(parse);
					//初始图片
					user.setUser_img("resources/img/user/t1.jpg");
					userService.addUser(user);
					
					

					// 添加用户登录日志
					UserLoginLog userLoginLog = new UserLoginLog();
					userLoginLog.setUserName(username);
					userLoginLog.setLoginIp(ip);
					userLoginLog.setLoginDateTime(parse);
					loginLogService.addUserLoginLog(userLoginLog);

					// 注册成功跳转
					request.setAttribute("username", username);
					return "index";
				} else {
					request.setAttribute("Msg", "注册失败，用户名已被占用！");
					return "error";
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("Msg", "发生未知错误！");
				return "error";
			}
		}

		request.setAttribute("Msg", "发生未知错误！");
		return "error";
	}

	// 显示个人信息
	@RequestMapping(value = "/listUserInfo")
	public String listUserInfo(String username, HttpServletRequest request) {
		User user = userService.getUserByUserName(username);
		request.setAttribute("user", user);
		List<Post> posts=postService.findPostByUserName(username);
		request.setAttribute("posts", posts);
		return "user/userInfo";
	}

	// 修改个人信息页面
	@RequestMapping(value = "/userUpdateInfo", method = RequestMethod.GET)
	public String userUpdateInfoPage(String username, HttpServletRequest request) {
		User user = userService.getUserByUserName(username);
		System.out.println(user);
		request.setAttribute("user", user);
		return "user/userUpdateInfo";
	}
	// 提交用户修改信息
	@RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
	public String updateUserInfo(MultipartFile file, User user, RedirectAttributes redirectAttributes,
			HttpServletRequest request) throws IllegalStateException, IOException {
		String userName = (String) request.getSession().getAttribute("username");
		if (user.getUserName() != null) {
			if (file != null && file.getOriginalFilename().length() >= 3) {
				String url = request.getSession().getServletContext().getRealPath("WEB-INF/resources/img/user/");
				file.transferTo(new File(url + "/" + file.getOriginalFilename()));
				user.setUser_img("resources/img/user/" + file.getOriginalFilename());
			}
			System.out.println(user);
			userService.updateUserByUserName(user);
		} else {
			if (file != null && file.getOriginalFilename().length() >= 3) {
				String url = request.getSession().getServletContext().getRealPath("WEB-INF/resources/img/user/");
				file.transferTo(new File(url + "/" + file.getOriginalFilename()));
				user.setUser_img("resources/img/user/" + file.getOriginalFilename());
				user.setUserName(userName);
				userService.updateUserByUserName(user);
			}
		}
		redirectAttributes.addAttribute("username", userName);
		return "redirect:listUserInfo";
	}
	// 用户注销功能
	@RequestMapping(value = "/loginOut")
	public String loginOut(HttpServletRequest request) {
		request.getSession().removeAttribute("username");
		return "index";
	}
}
