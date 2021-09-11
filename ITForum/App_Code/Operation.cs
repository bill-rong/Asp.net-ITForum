using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Operation 的摘要说明
/// </summary>
public class Operation
{
    DataBase data = new DataBase();
    public Operation()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    

    #region 注册登录
    public int register(string id, string name, string tel, string sex, string email, string tag, string pwd)
    {
        SqlParameter[] parms ={
            data.MakeInParam("@id",SqlDbType.Int,11,id),
            data.MakeInParam("@name",SqlDbType.VarChar,20,name),
            data.MakeInParam("@tel",SqlDbType.VarChar,11,tel),
            data.MakeInParam("@sex",SqlDbType.VarChar,2,sex),
            data.MakeInParam("@email",SqlDbType.VarChar,20,email),
            data.MakeInParam("@tag",SqlDbType.VarChar,30,tag),
            data.MakeInParam("@pwd",SqlDbType.VarChar,20,pwd)
        };
        return data.RunProc("insert into tb_user values(@id,@name,@tel,@sex,@email,@tag,@pwd)", parms);
    }
    public DataSet login(string user, string pwd, string ident)
    {
        return data.RunProcReturn("Select * from "+ident+" where id='" + user + "' and pwd='" + pwd + "'", "tb_user");
    }

    #endregion

    #region 个人信息
    public  DataSet personalInfo(String user)
    {
        return data.RunProcReturn("select * from tb_user " +
            "where id='"+user+"'", "tb_user");
    }

    #endregion

    #region 问题列表 
    public DataSet questionTitle()
    {
        return data.RunProcReturn("select * from tb_question where status = '1' order by ques_time desc", "tb_question");
    }
    #endregion

    #region 更新个人信息
    public int updateInfo(string[] info) 
    {
        return data.RunProc("update tb_user set name='"+info[1]+"'," +
            "tel='"+info[2]+"',sex='"+info[3]+"',email='"+info[4]+"'," +
            "tag='"+info[5]+"' where id='"+info[0]+"'");
    }
    #endregion

    #region 首页推荐
    public DataSet selectForum()
    {
        return data.RunProcReturn("select top(8 )* from tb_forum order by forum_time desc", "tb_forum");
    }

    public DataSet selectQuestion()
    {
        return data.RunProcReturn("select top(8 )* from tb_question where status='1' order by ques_time desc", "tb_question");
    }

    public DataSet selectCode()
    {
        return data.RunProcReturn("select top(8 )* from tb_code order by code_time desc", "tb_code");
    }
    #endregion

    #region 查询用户name
    public DataSet selectName(int id)
    {
        return data.RunProcReturn("select name from tb_user where id='"+id+"'", "tb_user");
    }
    #endregion


    #region 问题回答
    public DataSet questionAnswer(String question_id)
    {
        return data.RunProcReturn("select name,ans,ans_time from tb_answer left join tb_user on tb_user.id=tb_answer.user_id " +
            "where tb_answer.question_id='" + question_id + "' order by ans_time", "tb_answer");
    }
    #endregion

    #region 回答标题
    public DataSet answerTitle(String question_id)
    {
        return data.RunProcReturn("select * from tb_question where id='" + question_id + "'", "tb_question");
    }
    #endregion

    #region 发布评论
    public int answerRelease(String question_id, String user_id, String ans, String ans_time)
    {
        return data.RunProc("insert into tb_answer values ("
            + "'" + int.Parse(question_id) + "','"
             + int.Parse(user_id) + "','"
              + ans + "','"
               + ans_time + "')");
    }
    #endregion

    #region 收藏列表 
    public DataSet collectionTitle()
    {
        return data.RunProcReturn("select id, title, ques_time from tb_question left join tb_collection on tb_collection.art_id = tb_question.id " +
            "where tb_collection.user_id='" + "41801" + "'", "tb_question");
    }
    #endregion

    #region  收藏
    public DataSet selectForumColl(string user_id, string type)
    {
        string table = "";
        string title = "";
        string time = "";
        if (type == "1")
        {
            table = "tb_code";
            title = "title,path";
            time = "code_time";
        }
        else if (type == "2")
        {
            table = "tb_question";
            title = "title,tb_question.user_id";
            time = "ques_time";
        }
        else if(type == "3")
        {
            table = "tb_forum";
            title = "forum_title";
            time = "forum_time";
        }
        return data.RunProcReturn("select id,"+title+","+time+" from tb_collection left join "+
            table + " on tb_collection.art_id="+table+".id where tb_collection.user_id='" + user_id+ "' and tb_collection.type='" + type+"'","tb_collection");
    }
    #endregion
    ////////////////////
    #region 查询收藏 
    public DataSet collectionState(String id, String user_id, String type)
    {
        return data.RunProcReturn("select art_id from tb_collection " +
            "where art_id ='" + id + "' and user_id = '" + user_id + "' and type='" + type + "'", "tb_collection");
    }
    #endregion

    #region 添加收藏 
    public int addCollection(String user_id, String art_id, String type)
    {
        return data.RunProc("insert into tb_collection values ("
            + "'" + int.Parse(user_id) + "','"
             + int.Parse(art_id) + "','"
               + type + "')");
    }
    #endregion

    #region 删除收藏
    public int delCollection(String ques_id, String type, String user_id)
    {
        return data.RunProc("DELETE FROM tb_collection WHERE art_id = '" + ques_id + "' and type = '" + type + "'and user_id = '" + user_id + "'");
    }
    #endregion





    #region 论坛列表 
    public DataSet forumTitle()
    {
        return data.RunProcReturn("select * from tb_forum order by forum_time desc", "tb_forum");
    }
    #endregion

    #region 论坛回答
    public DataSet forumAnswer(String forum_id)
    {
        return data.RunProcReturn("select name,comment_text,com_time from tb_comment left join tb_user on tb_user.id=tb_comment.user_id " +
            "where tb_comment.forum_id='" + forum_id + "' order by com_time", "tb_comment");
    }
    #endregion

    #region 论坛回答标题
    public DataSet requestTitle(String forum_id)
    {
        return data.RunProcReturn("select * from tb_forum " +
            "where id='" + forum_id + "'", "tb_forum");
    }
    #endregion

    #region 论坛评论
    public int commentRelease(String user_id, String forum_id, String comment, String com_time)
    {
        return data.RunProc("insert into tb_comment values ("
            + "'" + int.Parse(user_id) + "','"
             + int.Parse(forum_id) + "','"
              + comment + "','"
               + com_time + "')");
    }
    #endregion

    #region 发布论坛、删除论坛
    public int forumRelease(String forum_title, String forum_text, String forum_time)
    {
        return data.RunProc("insert into tb_forum (forum_title, forum_text, forum_time) values ("
            + "'" + forum_title + "','"
                + forum_text + "','"
                    + forum_time + "')");
    }

    public int delForum(String forum_id)
    {
        return data.RunProc("DELETE FROM tb_forum WHERE id = '" + forum_id + "'");
    }
    #endregion


    #region 文件
    public int UploadFile(string title, string text,string type, string path)
    {
        return data.RunProc("insert into tb_code(title,code_text,code_type,code_time,path) " +
            "values('" + title + "','" + text + "','" + type + "','" + DateTime.Now.ToLocalTime().ToString() + "','" + path + "')");
    }

    public DataSet SelectCodeAll()
    {
        return data.RunProcReturn("select * from tb_code order by code_time desc", "tb_code");
    }

    public DataSet SelectCodeOne(string id)
    {
        return data.RunProcReturn("select * from tb_code where id='"+id+"'", "tb_code_one");
    }
    #endregion

    #region 发布问题
    public int quesRelease(String user_id, String ques_title, String ques_text, String ques_time)
    {
        return data.RunProc("insert into tb_question (user_id, title, problem, ques_time, status) values ("
            + "'" + user_id + "','"
                + ques_title + "','"
                     + ques_text + "','"
                        + ques_time + "','"
                            + "0" + "')");
    }
    #endregion

    #region 审核问题
    public int updataQuestion(String id)
    {
        return data.RunProc("UPDATE tb_question SET status = '1' WHERE  id = '" + id + " '");
    }
    #endregion

    #region 删除问题
    public int delQuestion(String id)
    {
        return data.RunProc("DELETE FROM tb_question WHERE id = '" + id + "'");
    }
    #endregion

    #region 删除资源
    public int delCode(String id)
    {
        return data.RunProc("DELETE FROM tb_code WHERE id = '" + id + "'");
    }
    #endregion

    #region 问题审核列表 
    public DataSet checkedQuestion()
    {
        return data.RunProcReturn("select * from tb_question where status = '0'", "tb_question");
    }
    #endregion

    public DataSet SearchResult(string text, string table)
    {
        string title = "title";
        if(table == "tb_forum")
        {
            title = "forum_title";
        }
        if(table == "tb_question")
        {
            return data.RunProcReturn("select * from " + table + " where status='1' and " + title + " like '%" + text + "%'", "tb_result");
        }
        return data.RunProcReturn("select * from " + table + " where "+title+" like '%" + text + "%'", "tb_result");
    }
}