package pack;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.FileUtils;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.tomcat.util.codec.binary.Base64;

/**
 * Servlet implementation class PDF2txt
 */
@WebServlet("/PDF2txt")
public class PDF2txt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PDF2txt() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		this.getServletContext().getRequestDispatcher("/WEB-INF/Depot.jsp").forward(request,  response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Part Myfile = (Part) request.getAttribute("myFile");
     	File fichier = new File("/tmp/"+ getFilename(Myfile));
		FileUtils.copyInputStreamToFile(Myfile.getInputStream(), fichier);
		String fichiername = fichier.getName();
	    System.out.println(fichiername +" has now type File !");
	    
	    
	    Convert(fichier);
	}
	
	private static String getFilename(Part part) {
		for (String cd : part.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				String filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
				return filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1);
			}
		}
		return null;
	}

	public void Convert(File file) {
		try {
		      //Loading the pdf file into PDDocument
		      String FilePath = "/tmp/" + file.getName();
		      File pdfFile = new File(FilePath);
		      PDDocument MyPDF= PDDocument.load(file);
		      //Initializing The PDFTextStripper class
		      PDFTextStripper TextStripper = new PDFTextStripper();
		      String text = TextStripper.getText(MyPDF);
		      System.out.print(text);
		      //Writing text to the text file
		      MyPDF.close();
		    } catch (IOException e) {
		      e.printStackTrace();
		    }
		
		  
	}

}
