package utility;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;

/**
 * HttpServletRequestWrapper Ŭ������ HttpServletRequest
 * �������̽��� �ӽ÷� ������ Ŭ������ �����ڰ� ���ΰ�ü��
 * request�� ��������ʰ� ���ο� ���·� request ��ü��
 * ����� ����� ��� ��ӹ޴� Ŭ�����Դϴ�.  
 * Apahce FileUpload ������Ʈ�� ����ϱ� ���ϰ� �����մϴ�.
 * FileUpload API�� ����ϴ� HttpServletRequestWrapper Ŭ�����μ�
 * HttpServletRequest�� ����� API�� ����ϱ� ���� �����̴�.
 */
public class UploadSaveManager extends HttpServletRequestWrapper {
    
    private boolean multipart = false;
    private HashMap parameterMap;  // �Ϲ� &lt;INPUT&gt; ���±�
    private HashMap fileItemMap;   // ���۵� &lt;FILE&gt; �±� ��ü�� ����
    
    /**
     * �⺻ ������
     * @param request
     * @throws FileUploadException
     */
    public UploadSaveManager(HttpServletRequest request) 
    throws FileUploadException{
        this(request, -1, -1, null);
    }//end=========================================================================
    
    /**
     * ������
     * @param request HttpServletRequest ��ü
     * @param threshold �޸𸮿� ������ �ִ�ũ��
     * @param max ���ε��� �ִ� ����ũ��
     * @param repositoryPath ���ε� ���
     * @throws FileUploadException
     */
    public UploadSaveManager(HttpServletRequest request,
        int threshold, int max, String repositoryPath) throws FileUploadException {
        super(request);
        
        parsing(request, threshold, max, repositoryPath);
    }//end=========================================================================
    
    /**
     * �Ϲ� �Է� �ʵ�� ���� �ʵ带 MAP�� ����
     * @param request HttpServletRequest ��ü
     * @param threshold �޸𸮿� ������ �ִ�ũ��
     * @param max ���ε��� �ִ� ����ũ��
     * @param repositoryPath ���ε� ���
     * @throws FileUploadException
     */
    private void parsing(HttpServletRequest request,
        int threshold, int max, String repositoryPath) throws FileUploadException {
        
        if (FileUpload.isMultipartContent(request)) {
            multipart = true;
            
            parameterMap = new java.util.HashMap();
            fileItemMap = new java.util.HashMap();
            
            DiskFileUpload diskFileUpload = new DiskFileUpload();
            if (threshold != -1) {
                diskFileUpload.setSizeThreshold(threshold);
            }
            diskFileUpload.setSizeMax(max);
            if (repositoryPath != null) {
                diskFileUpload.setRepositoryPath(repositoryPath);
            }
            
            java.util.List list = diskFileUpload.parseRequest(request);
            for (int i = 0 ; i < list.size() ; i++) {
                FileItem fileItem = (FileItem) list.get(i);
                String name = fileItem.getFieldName();

                if (fileItem.isFormField()) { // �Ϲ� �� �±����� �˻�
                    // �Ϲ� ���±׶�� ó��
                    String value = fileItem.getString();
                    String[] values = (String[]) parameterMap.get(name);
                    if (values == null) {
                        values = new String[] { value };
                    } else {
                        String[] tempValues = new String[values.length + 1];
                        System.arraycopy(values, 0, tempValues, 0, 1);
                        tempValues[tempValues.length - 1] = value;
                        values = tempValues;
                    }
                    parameterMap.put(name, values);
                } else { // ���� �±׶�� ó��
                    System.out.println("���� �±� �߰ߵ� �±׸�: " + name);
                    System.out.println("���� �±� �߰ߵ� ���ϸ�: " + fileItem.getName());
                    fileItemMap.put(name, fileItem);
                }
            }
            addTo(); // request �Ӽ����� �����Ѵ�.
        }
    }//end=========================================================================
    
    /**
     * ������ �����ϴ� enctype="multipart/form-data"�ΰ�� true����
     * @return enctype="multipart/form-data"�ΰ�� true����
     */
    public boolean isMultipartContent() {
        return multipart;
    }//end=========================================================================
    
    /**
     * �־��� �Ķ���Ϳ� ���� ���� ����
     */
    public String getParameter(String name) {
        if (multipart) {
            String[] values = (String[])parameterMap.get(name);
            if (values == null) return null;
            return values[0];
        } else
            return super.getParameter(name);
    }//end=========================================================================
    
    /**
     * �Ķ������ ������ ����
     */
    public String[] getParameterValues(String name) {
        if (multipart)
            return (String[])parameterMap.get(name);
        else
            return super.getParameterValues(name);
    }//end=========================================================================
    
    /**
     * ��ü �Ķ������ �̸��� ����
     */
    public Enumeration getParameterNames() {
        if (multipart) {
            return new Enumeration() {
                Iterator iter = parameterMap.keySet().iterator();
                
                public boolean hasMoreElements() {
                    return iter.hasNext();
                }
                public Object nextElement() {
                    return iter.next();
                }
            };
        } else {
            return super.getParameterNames();
        }
    }//end=========================================================================
    
    public Map getParameterMap() {
        if (multipart)
            return parameterMap;
        else
            return super.getParameterMap();
    }//end=========================================================================
    
    /**
     * ������ �Ķ���� �̸��� ���õ� FileItem�� �����մϴ�.
     * @param name
     * @return
     */
    public FileItem getFileItem(String name) {
        if (multipart)
            return (FileItem) fileItemMap.get(name);
        else
            return null;
    }//end=========================================================================
    
    /**
     * �ӽ÷� ���� ���ε� ������ �����մϴ�.
     */
    public void delete() {
        if (multipart) {
            Iterator fileItemIter = fileItemMap.values().iterator();
            while( fileItemIter.hasNext()) {
                FileItem fileItem = (FileItem)fileItemIter.next();
                fileItem.delete();
            }
        }
    }//end=========================================================================
    
    /**
     * ���۰�ü ��ü�� request ��ü�� �����մϴ�.
     */
    public void addTo() {
        super.setAttribute(UploadSaveManager.class.getName(), this);
    }//end=========================================================================
    
    /**
     * request �Ӽ��� ����� FileUploadRequestWrapper�� �����մϴ�.
     * @param request
     * @return
     */
    public static UploadSaveManager 
                  getFrom(HttpServletRequest request) {
        return (UploadSaveManager)
            request.getAttribute(UploadSaveManager.class.getName());
    }//end=========================================================================
    
    /**
     * ������ request�� ���۸� �Ӽ����� �����ϰ� ������ true�� �����մϴ�.
     * @param request
     * @return
     */
    public static boolean hasWrapper(HttpServletRequest request) {
        if (UploadSaveManager.getFrom(request) == null) {
            return false;
        } else {
            return true;
        }
    }//end=========================================================================
    
    /**
     * ������ �ö�� ������ ������ ��ũ�� ����
     * ���ϸ� ó��: data.txt -> (0)data.txt ->(1)data.txt -> (2)data.txt..
     * @param fileItem ������ ���� ��ü
     * @param upDir ������ ������ ����
     * @return ����� ���ϸ�
     */
    public static String saveFile(FileItem fileItem, String upDir){
        String filename = "";       //���ε� ���ϸ�
       
        // ���� �±�
        System.out.println("���۵� ���ϸ�: " + fileItem.getName());

        // ���� ������ ����
        int idx = fileItem.getName().lastIndexOf("\\"); //������ ���

        if (idx == -1) { // ���н�, ������ ���
            idx = fileItem.getName().lastIndexOf("/");
        }
          
        // ���� ���ϸ� ����
        filename = fileItem.getName().substring(idx + 1);
          
        try {
            //-----------------------------------------------
            //��� ������ ������ ���� ��ü ����, ���� + ���ϸ�
            //-----------------------------------------------
            File uploadedFile = new File(upDir, filename);
              
            //�ø����� ���ϰ� ���� �̸��� �����ϸ� �ߺ����� ó��
            if ( uploadedFile.exists() == true ){
                for(int k=0; true; k++){
                    //���ϸ� �ߺ��� ���ϱ� ���� �Ϸ� ��ȣ�� �����Ͽ�
                    //���ϸ����� ����
                    uploadedFile = new File(upDir, "("+k+")"+filename);
                    //���յ� ���ϸ��� �������� �ʴ´ٸ�, �Ϸù�ȣ��
                    //���� ���ϸ� �ٽ� ����
                    //�������� �ʴ� ���
                    // !�� �̿��� false�� ��� ������ ó���ǵ��� ��ȯ
                    if(!(uploadedFile.exists() == true)){ 
                        filename = "("+k+")"+filename;
                        break;
                    }
                }
            }
               
            // storage ������ ���ϸ� ����
            fileItem.write(uploadedFile);
        } catch(Exception e) {
              System.out.println(e.toString());    
        }
        return filename; // ���ε�� ���ϸ� ����
    }//end=========================================================================
    
    //---------------------------------------------------------------
    //Fileupload ������Ʈ ���� �ڵ� ��
    //---------------------------------------------------------------
    /** 
     * ������ �����մϴ�. 
    */
    public static boolean deleteFile(String folder, String fileName){
        boolean ret = false;
        
        try{
            if ( fileName != null){ // ������ ������ �����ϴ� ��� ����
                File file = new File(folder + "/" + fileName);
                ret = file.delete();
            }
        }catch(Exception e){
            e.printStackTrace();
        }  
        return ret;
    }//end=========================================================================

    public HashMap getFileItemMap() {
        return fileItemMap;
    }//end=========================================================================

    public void setFileItemMap(HashMap fileItemMap) {
        this.fileItemMap = fileItemMap;
    }//end=========================================================================
    
    /**
     * ���۹��� ������ ������ ����
     * @return
     */
    public int getFileCount(){
        return this.fileItemMap.size();
    }//end=========================================================================
    
}//class END=======================================================================
