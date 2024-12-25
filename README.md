一个基于JavaWeb采用MVC模式的商品销售管理系统，主要技术为：HTML+CSS+JavaScript+JSP+Servlet+Tomcat+Mysql

### **技术选型**

1. **前端**：
   - **HTML/CSS/JavaScript**：基本的网页结构和样式。
   - **JSP（Java Server Pages）**：用于动态生成网页内容。
   - **AJAX/Fetch API**：用于异步请求，提升用户体验（例如购物车功能、订单状态更新等）。
   - **Bootstrap**：用于快速开发响应式界面。
2. **后端**：
   - **Java Servlet**：处理请求和响应。
   - **JSP**：用于动态生成页面并显示数据。
   - **MySQL数据库**：存储用户信息、商品信息、订单信息等。
   - **Tomcat**：作为Web服务器部署Servlet和JSP。
   - **JDBC（Java Database Connectivity）**：与MySQL数据库交互。
3. **数据库**：
   - **MySQL**：存储商品信息、用户信息和订单信息。
4. **架构设计**：
   - **MVC（Model-View-Controller）**：模型-视图-控制器结构，用于分离业务逻辑、界面展示和请求控制。

### **项目文件架构**

```bash
/goods-sales-management-system
│
├── /src
│   ├── /controller
│   │   ├── AdminController.java   # 管理员控制器
│   │   ├── UserController.java    # 用户控制器
│   │   └── GuestController.java   # 游客控制器
│   ├── /model
│   │   ├── Product.java           # 商品实体类
│   │   ├── User.java              # 用户实体类
│   │   ├── Order.java             # 订单实体类
│   │   ├── ProductDao.java        # 商品数据访问对象（DAO）
│   │   ├── UserDao.java           # 用户数据访问对象（DAO）
│   │   └── OrderDao.java          # 订单数据访问对象（DAO）
│   ├── /service
│   │   ├── ProductService.java    # 商品业务逻辑
│   │   ├── UserService.java       # 用户业务逻辑
│   │   └── OrderService.java      # 订单业务逻辑
│   ├── /util
│   │   └── DbUtil.java            # 数据库连接工具类
│   └── /web
│       ├── /admin
│       │   └── product.jsp        # 管理员商品管理页面
│       ├── /user
│       │   └── cart.jsp           # 用户购物车页面
│       └── /guest
│           └── index.jsp          # 游客商品浏览页面
│
├── /webapp
│   ├── /WEB-INF
│   │   └── web.xml                # Web应用配置文件
│   └── /lib
│       ├── mysql-connector-java.jar # MySQL JDBC驱动
│
└── /sql
    └── schema.sql                 # 数据库表结构定义
```

### 1. **`User.java`**

- 用于表示用户信息，包含用户 ID、用户名、密码、邮箱、地址、电话、角色等属性。

### 2. **`UserDao.java`**

- 提供了与数据库进行交互的操作，如添加、查询、更新和删除用户数据。

### 3. **`Product.java`**

- 用于表示商品信息，包含商品 ID、名称、描述、价格、库存、分类和图片等属性。

### 4. **`ProductDao.java`**

- 提供了与商品相关的数据库操作，如获取所有商品、按 ID 获取商品、添加、更新和删除商品。

### 5. **`Order.java`**

- 用于表示订单信息，包含订单 ID、用户 ID、订单日期、总金额、状态、支付方式、邮寄地址等属性。

### 6. **`OrderItem.java`**

- 用于表示订单中的单个商品项，包含商品 ID、数量和单价等属性。

### 7. **`OrderDao.java`**

- 提供了与订单相关的数据库操作，如获取订单、更新订单状态等。

### 8. **`OrderService.java`**

- 提供了与订单相关的业务逻辑，如创建订单、更新订单状态等。

### 9. **`ProductService.java`**

- 提供了与商品相关的业务逻辑，如获取商品、添加商品、更新商品等。

### 10. **`UserService.java`**

- 提供了与用户相关的业务逻辑，如用户注册、登录验证等。

### 11. **`UserController.java`**

- 用于处理用户相关的 HTTP 请求，如注册、登录、查看个人信息等。

### 12. **`AdminController.java`**

- 用于管理员端处理商品和订单的 HTTP 请求，如查看商品、添加商品、编辑商品、删除商品、查看所有订单、修改订单状态等。

### 13. **`GuestController.java`**

- 用于游客端处理商品查看和跳转到登录页面的 HTTP 请求。