# voteSystem
利用 JSP + JavaBean + Servlet 技术来实现一个“喜欢的大学投票系统”，包括用户注册、登录、投票和查看投票结果的功能。通过将三者结合，充分展示 Java Web 应用中前后端的交互，以及通过数据库实现持久化数据存储。

**项目结构:**

项目根目录/

│

├── src/

│  ├── model/

│  │  ├── User.java        // User实体类

│  │  ├── University.java     // University实体类

│  │  ├── Vote.java        // Vote实体类

│  │  ├── UserDAO.java      // User数据访问对象

│  │  ├── UniversityDAO.java   // University数据访问对象

│  │  └── VoteDAO.java      // Vote数据访问对象

│  │

│  └── servlet/

│    ├── LoginServlet.java    // 处理用户登录

│    ├── RegisterServlet.java  // 处理用户注册

│    └── VoteServlet.java    // 处理用户投票

│

├── WebContent/

│  ├── voteSystem/         // JSP文件目录

│  │  ├── main.jsp        // 主页面，显示投票结果

│  │  ├── login.jsp        // 登录页面

│  │  ├── register.jsp      // 注册页面

│  │  └── fail.jsp        // 错误提示页面

│  │

│  └── WEB-INF/

│    ├── web.xml         // Web应用配置文件

│    └── classes/        // 编译的.class文件目录

│

└── database/

  └── votedb.sql         // 数据库初始化和示例数据SQL文件

 

**实现思想:**

利用 JSP + JavaBean + Servlet 技术来实现一个“喜欢的大学投票系统”，包括用户注册、登录、投票和查看投票结果的功能。通过将三者结合，充分展示 Java Web 应用中前后端的交互，以及通过数据库实现持久化数据存储。

 

系统的核心思想是：

采用 Servlet 处理用户的请求，如登录、注册和投票提交。

JavaBean 用于封装业务逻辑和数据操作方法，如数据库的用户验证、投票更新等。

JSP 页面 展示信息给用户，页面数据从数据库获取，通过 Servlet 和 JavaBean 提供的业务逻辑动态展示。

 

在项目中实现了以下主要功能：

游客查看：游客可以查看投票结果，但不能投票。

用户注册和登录：只有注册且登录的用户才能进行投票，每个用户只能投票一次。

投票成功后刷新页面：投票完成后，页面自动刷新并显示最新投票结果。

 

**程序说明:**

**1.** **数据库设计**

数据库设计了三个表，分别是 users、votes 和 universities：

users 表存储用户的基础信息（包括用户名、密码、性别等）。

universities 表存储所有可供选择的大学名称。

votes 表记录每次投票结果，包含用户 ID 和大学 ID，以实现一个用户只能投一次票的逻辑。

**2.** **主要页面说明**

main.jsp：展示投票结果页面，显示所有大学的票数统计信息。同时为登录用户提供投票选项。页面通过 UniversityDAO 获取数据库中各大学的投票数据，并动态展示。

login.jsp 和 register.jsp：分别为用户提供登录和注册页面，通过 LoginServlet 和 RegisterServlet 处理登录和注册请求。

fail.jsp：当操作失败时（如用户名已存在、登录失败、投票失败等）显示错误信息，并引导用户返回首页。

 

**3. JavaBean** **数据访问对象（DAO）**

DAO 类 主要负责数据库操作，封装了常用的数据库查询和插入操作，以便 Servlet 可以调用这些方法。DAO 类包括：

UserDAO：提供 login、register 等方法，验证用户身份、保存用户信息等。

 

UniversityDAO：获取大学信息，提供各大学的投票数量统计，供 main.jsp 页面显示。

VoteDAO：提供投票处理的相关方法，如记录用户投票信息、统计每所大学的票数等。

 

**4.** **主要 Servlet 说明**

Servlet 是请求的核心处理类，负责接收用户输入的数据、调用相应的 DAO 类处理数据，并根据处理结果决定跳转的页面。

LoginServlet：接收登录请求，验证用户名和密码。如果验证通过则跳转到 main.jsp，否则跳转到 error.jsp。

RegisterServlet：接收注册请求，验证用户名是否已存在，如果不存在则插入用户数据并跳转到 main.jsp，否则跳转到 error.jsp。

VoteServlet：接收投票请求，检查用户是否已经投票。如果未投票，则记录用户投票信息，刷新投票结果并返回 main.jsp；如果已投票则提示用户无法重复投票，跳转到 error.jsp。

 

**5.** **详细页面样式和结构设计**

每个页面使用 CSS 进行美化，使用户界面友好且易于交互。页面元素包括：

输入框、按钮等采用统一的样式，提升用户体验。

提供了友好的错误提示信息，方便用户理解操作结果。

使用表格展示各大学的票数，使投票结果更直观。

