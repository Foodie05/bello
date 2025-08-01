# Bello - 安全的内容管理Web服务器

## 简介

Bello是一个使用Dart构建的安全HTTPS Web服务器，为内容管理系统提供强大的后端支持。它具有用户认证、文章管理、文件下载、图片代理和访问跟踪等功能。服务器采用模块化架构，使用shelf和shelf_router包进行高效的请求处理和路由。

## 功能特点

### 用户管理
- 多级用户认证系统，具有不同权限级别（管理员、作者、访客等）
- 使用MD5和SHA-256密码哈希的安全登录
- 用户注册和账户管理
- 基于WebSocket的管理员账户管理界面

### 内容管理
- 文章创建、检索和删除
- 带有自定义标签的文章标签系统
- 文章浏览量跟踪
- 基于权限的内容可见性

### 文件和媒体处理
- 安全的文件下载功能
- 外部图片的代理服务
- 组织化的文件存储系统

### 数据分析
- 访问跟踪和统计
- 用于开发目的的调试访问计数器

### 安全性
- 支持带有SSL/TLS加密的HTTPS
- 用于安全跨域请求的CORS头
- 强大的认证和权限验证

## 技术栈

- **编程语言**: Dart
- **数据库**: Isar (NoSQL数据库)
- **Web服务器**: shelf和shelf_router
- **认证**: 使用crypto包的自定义实现
- **API**: RESTful API端点

## 如何构建和运行

### 前提条件

- Dart SDK ^3.5.4
- SSL证书和私钥文件
- 适当的目录结构（如果不存在将被创建）

### 安装

1. 克隆仓库：
   ```bash
   git clone https://github.com/foodie05/bello.git
   cd bello
   ```

2. 安装依赖：
   ```bash
   dart pub get
   ```

3. 设置SSL证书：
   - 将SSL证书链放在 `/bello/key/fullchain.pem`
   - 将私钥放在 `/bello/key/privkey.pem`

4. 运行服务器：
   ```bash
   dart run bin/bello.dart
   ```

### 配置

服务器配置可以在 `bin/global/value.dart` 中修改。主要设置包括：

- `webAddress`：服务器IP地址（默认：'0.0.0.0'）
- `webPort`：HTTPS端口（默认：8080）
- `webHomeDir`：所有服务器文件的基本目录

### API端点

#### 账户管理
- `POST /register`：注册新用户账户
- `POST /admin/register`：注册管理员账户
- `POST /login`：用户登录
- `POST /login_twice`：双因素认证登录
- `WebSocket /admin/account_mgr`：管理员账户管理

#### 文章管理
- `POST /article`：创建、检索或删除文章

#### 文件管理
- `GET /download/<fileName>`：下载文件
- `GET /pic/<url>`：外部图片代理

#### 数据分析
- `GET/POST /visits`：获取或更新访问统计
- `GET/POST /debug`：获取或更新调试访问统计
