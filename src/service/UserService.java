package service;

import bean.User;
import dao.UserDao;

import java.util.List;

public class UserService {

    private UserDao userDao = new UserDao();

    // 用户注册
    public boolean registerUser(User user) {
        // 在注册前可以验证用户名是否已经存在
        User existingUser = userDao.getUserByUsername(user.getUsername());
        if (existingUser != null) {
            // 如果用户名已存在，返回 false
            return false;
        }
        // 执行插入操作
        return userDao.addUser(user);
    }

    // 用户登录
    public int loginUser(String username, String password) {
        // 通过用户名查找用户
        User user = userDao.getUserByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            // 用户名存在并且密码匹配
            return user.getUserId();
        }
        // 用户名或密码错误
        return 0;
    }

    // 更新用户信息
    public boolean updateUser(User user) {
        // 可以进行一些用户信息的校验
        if (user != null && user.getUserId() > 0) {
            return userDao.updateUser(user);
        }
        return false;
    }

    // 获取全部用户
    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }

    // 获取用户信息
    public User getUserById(int userId) {
        return userDao.getUserById(userId);
    }

    // 删除用户
    public boolean deleteUser(int userId) {
        // 可以进行一些删除操作前的验证
        return userDao.deleteUser(userId);
    }

    // 修改用户密码
    public boolean changePassword(int userId, String oldPassword, String newPassword) {
        User user = userDao.getUserById(userId);
        if (user != null && user.getPassword().equals(oldPassword)) {
            user.setPassword(newPassword);
            return userDao.updateUser(user);
        }
        return false;
    }

    public boolean addUser(User user) {
        return userDao.addUser(user);
    }
}

