<%@ page import="java.io.File"%>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>   <head><title>jmeter logs</title></head>
<body>
<%
String resultPath = "/results";//��WEB-INFĿ¼ͬ����resultsĿ¼����jmeter���ɵ�html��Ŀ¼
%>

<%!
    public   void travelDirectory(String directory,JspWriter out,String r) throws IOException {
        File dir = new File(directory);
        if(dir.isFile())            //�ж��Ƿ����ļ���������ļ��򷵻ء�
            return;
        File[] files=dir.listFiles();        //�г���ǰĿ¼�µ������ļ���Ŀ¼
        List fileNameList = new ArrayList();
        // TODO: ����ѭ������Ҫ�Ż��� 
        //TODO: �����ڵ���
        //ѭ�������Σ���һ��ѭ���õ����е�Ŀ¼���ŵ�������������򣬵ڶ���ѭ��������ʾ��
        for(int i=0;i<files.length;i++){
            if(files[i].isDirectory()) {       //�����Ŀ¼�������������Ŀ¼
                String dirName = files[i].getName();
                System.out.println(dirName);
                fileNameList.add(dirName);
            }
        }
        
        Object[] fileNameArray = fileNameList.toArray();
        Arrays.sort(fileNameArray);
        for(int i=0; i<fileNameArray.length; i++){
            String oName =  (String)fileNameArray[i];
            out.println("<a href='"+r+"/"+oName+"/index.html'>"+oName+"</a><br/>");    //�����Ŀ¼�����ļ�������
        }
    } 
    %>

<%
    //����ǰweb����Ŀ¼�ṹ���������̨
    String dir=pageContext.getServletContext().getRealPath(resultPath);
    out.println("--------------------------------<br/>");
    travelDirectory(dir,out,resultPath);
    out.println("--------------------------------<br/>");
%>
</body>
</html>