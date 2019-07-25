package com.ego.system.tools;


import com.qiniu.storage.Configuration;
import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;

public class QiniuUpload {

    //���ú��˺ŵ�ACCESS_KEY��SECRET_KEY
    private static String ACCESS_KEY = VariableName.accessKey; //��������¼��ţ �˺���������ҵ�
    private static String SECRET_KEY = VariableName.secretKey;

    //Ҫ�ϴ��Ŀռ�
    private static String bucketname = VariableName.bucket; //��ӦҪ�ϴ�����ţ�� ����Ǹ�·�����Լ����ļ��� ע�����ù�����

    //��Կ����
    private static Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
    private static Configuration cfg = new Configuration(Zone.huanan());
    //�����ϴ�����

  //  private static UploadManager uploadManager = new UploadManager(cfg);

    //���ϴ���ʹ��Ĭ�ϲ��ԣ�ֻ��Ҫ�����ϴ��Ŀռ����Ϳ�����
    public static String getUpToken()
    {
        return auth.uploadToken(bucketname);
    }

    
    public static String UploadPic(String FilePath,String FileName){
        Configuration cfg = new Configuration(Zone.huanan());
        UploadManager uploadManager = new UploadManager(cfg);
        String accessKey = VariableName.accessKey;      //AccessKey��ֵ
        String secretKey = VariableName.secretKey;      //SecretKey��ֵ
        String bucket = VariableName.bucket;                                          //�洢�ռ���
        Auth auth = Auth.create(accessKey, secretKey);
        String upToken = auth.uploadToken(bucket);
        try {
            Response response = uploadManager.put(FilePath, FileName, upToken);
            //�����ϴ��ɹ��Ľ��
            DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
            System.out.println(putRet.key);
            System.out.println(putRet.hash);
            return VariableName.domain+FileName;
        }catch (QiniuException ex){
            Response r = ex.response;
            System.err.println(r.toString());
            try {
                System.err.println(r.bodyString());
            } catch (QiniuException ex2) {
                //ignore
            }
        }
        return null;
    }

    /**
     public static String updateFile(MultipartFile file, String filename) throws Exception {
         //Ĭ�ϲ�ָ��key������£����ļ����ݵ�hashֵ��Ϊ�ļ���
         try {
             InputStream inputStream=file.getInputStream();
             ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
             byte[] buff = new byte[600]; //buff���ڴ��ѭ����ȡ����ʱ����
             int rc = 0;
             while ((rc = inputStream.read(buff, 0, 100)) > 0) {
                 swapStream.write(buff, 0, rc);
             }

             byte[] uploadBytes  = swapStream.toByteArray();
             try {
                 Response response = uploadManager.put(uploadBytes,filename,getUpToken());
                 //�����ϴ��ɹ��Ľ��
                 DefaultPutRet putRet;
                 putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
                 return VariableName.domain+putRet.key;

             } catch (QiniuException ex) {
                 Response r = ex.response;
                 System.err.println(r.toString());
                 try {
                     System.err.println(r.bodyString());
                 } catch (QiniuException ex2) {
                 }
             }
         } catch (UnsupportedEncodingException ex) {
         }
         return null;
     }
     **/
}
