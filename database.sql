# 创建数据库
create database products_sale_db;
use products_sale_db;

# 用户信息表
CREATE TABLE users (
                       user_id INT AUTO_INCREMENT PRIMARY KEY,  -- 用户ID，主键，自增
                       username VARCHAR(100) NOT NULL,           -- 用户名，不能为空
                       password VARCHAR(255) NOT NULL,           -- 密码，不能为空
                       email VARCHAR(100),                      -- 邮箱
                       phone_number VARCHAR(20),                -- 手机号码
                       address TEXT,                            -- 用户地址
                       role ENUM('admin', 'user') DEFAULT 'user' -- 用户角色，admin：管理员，user：普通用户
);

# 商品信息表
CREATE TABLE products (
                          product_id INT AUTO_INCREMENT PRIMARY KEY,  -- 商品ID，主键，自增
                          name VARCHAR(255) NOT NULL,                 -- 商品名称
                          description TEXT,                           -- 商品描述
                          price DECIMAL(10, 2) NOT NULL,              -- 商品价格
                          stock_quantity INT NOT NULL,                -- 库存数量
                          category VARCHAR(100),                      -- 商品分类
                          image_url VARCHAR(255)                      -- 商品图片URL
);

# 用户订单表
CREATE TABLE orders (
                        order_id INT AUTO_INCREMENT PRIMARY KEY,  -- 订单ID，主键，自增
                        user_id INT,                              -- 用户ID，外键
                        order_date DATETIME DEFAULT CURRENT_TIMESTAMP, -- 订单时间
                        total_amount DECIMAL(10, 2),              -- 订单总金额
                        status ENUM('pending', 'paid', 'completed', 'cancelled') DEFAULT 'pending', -- 订单状态
                        shipping_address TEXT,                    -- 邮寄地址
                        phone_number VARCHAR(20),                 -- 联系电话
                        FOREIGN KEY (user_id) REFERENCES users(user_id)  -- 外键关联用户表
);

# 订单项表
CREATE TABLE order_items (
                             item_id INT AUTO_INCREMENT PRIMARY KEY,  -- 订单项ID，主键，自增
                             order_id INT,                            -- 订单ID，外键
                             product_id INT,                          -- 商品ID，外键
                             quantity INT NOT NULL,                   -- 商品数量
                             price DECIMAL(10, 2) NOT NULL,           -- 商品单价
                             FOREIGN KEY (order_id) REFERENCES orders(order_id),  -- 外键关联订单表
                             FOREIGN KEY (product_id) REFERENCES products(product_id) -- 外键关联商品表
);

