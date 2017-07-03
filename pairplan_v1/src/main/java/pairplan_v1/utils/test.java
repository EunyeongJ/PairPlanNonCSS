package pairplan_v1.utils;

public class test {
	public static void main(String[] args) {
		String a= "alsfdjla/sdf/index/images/member/1/a.jpg";
		String b= "<aa style=\"width: 25%\" src=\"/pairplan_v1/resources/images/member/1/aaa_1234.jpg\"> <img src=\"/pairplan_v1/resources/images/reivew/1/aaa_124.jpg\">";
		String c= "<img src='/editorImgConPath/resources/images/reivew/aaa_1234.jpg'> <img src='/editorImgConPath/resources/images/reivew/aaa_124.jpg'>";
		String d = "aaaa";
		
		//System.out.println(a.substring(a.indexOf("member")));
		//System.out.println(b.lastIndexOf("<img src='/") + ", " + b.lastIndexOf("/resources/images/reivew"));
		//System.out.println(b.substring(b.lastIndexOf("<img src='/"), b.lastIndexOf("/resources/images/reivew")));
		
		//System.out.println(b.indexOf("src=\"/") + ", " + b.indexOf("/resources/images/reivew"));
		//System.out.println(b.substring(b.indexOf("src=\"/"), b.indexOf("/resources/images/reivew")));
		//System.out.println(b.replace(b.substring(b.indexOf("src=\"/"), b.indexOf("/resources/images/reivew")), "src=\"/editorImgConPath"));
		
		//if(c.indexOf("/editorImgConPath")>-1)
		//System.out.println(c.replace("/editorImgConPath", "/aa"));
		//System.out.println(d.replace(d.substring(d.lastIndexOf("/editorImgConPath"), d.lastIndexOf("/resources/images/reivew")), "/aa"));
		//d.substring(d.indexOf("b"));
		//System.out.println(b.substring(b.lastIndexOf("/reivew/")));
		
		System.out.println(b.replaceAll("img{1}.*src*(.*)review$", "/editorImgConPath"));
	}
}
