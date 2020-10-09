# git使用
[官方中文文档](https://git-scm.com/book/zh/v2/)
## 1. ssh配置  
1. `cd ~/.ssh`
2. 生成秘钥：`ssh-keygen` 然后连续按三次回车（不需要密码）。得到两个文件：id_rsa和id_rsa.pub  
3. 添加密钥到ssh-agent：`ssh-add ~/.ssh/id_rsa`  
4. 登陆Github，进入Settings->SSH and GPG keys, 选择New SSH Key，然后将id_rsa.pub中的内容复制进去。  

## 2. 提交修改
首先将项目下载到本地（私有库在Settings->Repositories中）：`git clone git@github.com:Usr_name/Repo.git`  
*    方法一：直接修改当前分支（小改动）  
    1. 完成修改后将改动的文件上传到暂存区：如`git add README.md`或上传全部`git add .`   
    2. 将暂存区里的改动给提交到本地的版本库：`git commit -m "message"`  
    3. 取回远程分支branch_name的更新，再与当前的分支合并：`git pull origin branch_name`。如果出现冲突错误：”Automatic merge failed; fix conflicts and then commit the result.”需要手动修改出现冲突的文件，然后回到第一步。(直接运行`git pull`会抓取合并当前分支跟踪的远程分支)；  
    或者使用`git pull --rebase`使commit树线性，没有merge信息（推荐）
    4. 上传到远程分支branch_name：`git push origin branch_name`  
----  
*    方法二：新建分支，修改完成后进行合并（较大改动）  
	1. 创建新的分支并切换到新的分支：  
	`git checkout -b new_branch`（或`git checkout -b new_branch origin/branch_name`来设置跟踪分支）  
	2. 修改操作后执行add & commit，然后进行测试实验  
	3. 回到主要的分支然后合并测试成功的新分支：  
	`git checkout master`  
	`git merge new_branch`  
	4. 删除掉新建的分支：`git branch -d new_branch`

## 3. 常用命令
1. 查看本地和远程的所有分支：`git branch -a`  
2. 切换分支：`git checkout branch_name`  
3. 创建新的分支：`git branch branch_name`  
4. 更新远程分支列表`git remote update origin -p`  
5. 查看哪些分支已经合并到当前分支：`git branch --merged`(不是主要分支的可以删除)
6. 查看分支跟踪信息：`git branch -vv`
7. 设置跟踪的远程分支：`git branch -u origin/branch_name`
8. 查看commit记录：`git log` 按q退出
9. 查看仓库状态：`git status`
10. 回退到某次commit  
	```
	$ git reset --hard HEAD^         回退到上个版本  
	$ git reset --hard HEAD~3        回退到前3次提交之前，以此类推，回退到n次提交之前  
	$ git reset --hard commit_id     退到/进到 指定commit的sha码
	```
