# User Specification

## Model: User
定义系统中用户的基本信息。

| 字段名 | 类型 | 必填 | 描述 |
| :--- | :--- | :--- | :--- |
| id | Integer | 是 | 用户唯一ID |
| username | String | 是 | 登录名 |
| email | String | 否 | 联系邮箱 |

## API: GetUser
获取用户信息接口。

- **Method**: GET
- **Path**: /users/{id}
- **Response**: User