ABAC（Attribute Base Access Control） 基于属性的权限控制

不同于常见的将用户通过某种方式关联到权限的方式，ABAC则是通过动态计算一个或一组属性来是否满足某种条件来进行授权判断（可以编写简单的逻辑）。属性通常来说分为四类：用户属性（如用户年龄），环境属性（如当前时间），操作属性（如读取）和对象属性，所以理论上能够实现非常灵活的权限控制，几乎能满足所有类型的需求。



### 2、ABAC（Attribute Based Access Control）

ABAC 翻译过来意思是**基于属性的权限访问控制** ，这个模型在如今的云系统中使用的比较多，比如AWS，阿里云，腾讯云，京东云等，它们都是用ABAC来管控IaaS以及PaaS的资源，曾经K8s也使用过这个模型来进行权限管控。

我们上面说过，RBAC的能力可以用这么一句话来描述：一个用户通过和角色绑定，具备了一些对数据操作的能力，往简单的说就是一个用户有了一些对数据操作的能力。但是，如果在复杂的权限管控场景中，RBAC显得有些力不从心，比如说：

- 用户在晚上不能访问这个系统，但是白天可以
- 用户只能在内网对订单具备修改权限，而在外网就只有查看权限
- 用户对2021-03-19日之前创建的订单有操作权限
- 用户只能在深圳进行查看订单，而去了国外就不可以
- 用户在公司内部可以访问所有数据，但是在外部就只能访问公开数据

我们很容易就发现，**RBAC**仅仅描述了**用户**可以做什么**操作**，但是操作的**条件**，以及操作的**数据**，模型本身是没有这些限制的，这也是由于其模型能力的不足所导致的，但这却恰恰是ABAC的长处，ABAC的思想是基于**用户**、以及将要访问的**数据的属性**、以及各种**环境因素**去动态计算用户是否有权限进行操作。我们先简单介绍一下NIST ABAC设计指引中的一些术语:

- **subject** 指的是系统的使用者，可以是用户(user),也可以是其他非服务的个体(non-person entity，NPE)
- **object** 泛指被访问的数据
- **operation/action** 指操作行为，一般对应系统中的API
- **policy** 访问策略，它规定了一个用户在什么条件下可以对哪些数据做什么，是ABAC系统核心实体之一
- **pdp** pdp是policy decision point，策略点，其实我理解这玩意就是一个policy的展示出来的形式而已
- **pep** pep是policy enforcement point,策略执行点，简单说就是根据policy来鉴权
- **acm** acm是access control mechanism,权限管控机制，一般来说就是权限系统本身
- **attribute** 它泛指各种属性，可以是subject的，也可以是object的
- **condition** 各种额外的限制条件

![image.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/5fe95216d4f74b0c947fec5304b9802b~tplv-k3u1fbpfcp-watermark.image)

**Attribute**：属性，用于表示 subject、object 或者 environment conditions 的特点，attribute 使用 key-value 的形式来存储这些信息，比如我在公司的 role 是 developer，role 是 key，developer 是 value，而我的小组昵称袋熊，key 是 team，value 是 wombat。

**Subject**：常常指代使用系统的人或者其他使用者（non-person entity，NPE），比如说客户端程序，访问 API 的 client 或者移动设备等等。当然一个 subject 可以有多个的 attributes，就像用户属性这些我们曾经用过的名词一样。

**Object**：指代我们这个 ACM 需要管理的资源，比如文件，比如某项记录，比如某台机器或者某个网站，任何你需要进行访问控制的资源都可以称为 object，**同样 object 也可以有多项属性，比如袋熊组的桌子，或者洛克组的线上实例**，我们也常常使用 resource 来描述这些资源，但是在 ABAC 的环境下，我们称为 object。

**Operation**：有了 object 有了 subject，自然就有了 subject 需要做的事情，比如查看某条记录，登录某台服务器，使用某个 SaaS 服务进行报销或者查看候选人的作业。往往包括我们常说的读、写、修改、拷贝等等，**一般 operation 是会表达在 request 中的，比如 HTTP method。**

**Policy**：通过 subject、object 的 attribute 与 environment conditions 一起来判断 subject 的请求是否能够允许的关系表示，**比如说：policy 可以用人类语言这样表达，只有袋熊组的人才能访问这几台服务器，或者只有在办公室才能访问这些资源，但对于机器来说，无非就是一个判断语句罢了**。当然了，policy 可以是一堆这样 boolean 逻辑判断的组合，比如只有公司的正式员工、并且在公司的六楼区域的网络中，才能访问某个服务。你可以使用 [Specification Pattern](https://links.jianshu.com/go?to=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FSpecification_pattern) 来实现 policy，其实没那么复杂。

**Environment Conditions**：表示目前进行的访问请求发生时，的操作或情境的上下文。Environment conditions 常常用来描述环境特征，是独立于 subject 与 object 的，常用来描述系统的情况：比如时间，当前的安全等级，生产环境还是测试环境等等。





# PERM 模型

PERM(Policy, Effect, Request, Matchers)模型很简单, 但是反映了权限的本质 – 访问控制

- Policy: 定义权限的规则
- Effect: 定义组合了多个 Policy 之后的结果, allow/deny
- Request: 访问请求, 也就是谁想操作什么
- Matcher: 判断 Request 是否满足 Policy

![image-20210802155250680](D:\github\mark\mark\Attribute Based Access Control.assets\image-20210802155250680.png)

# casbin 权限库