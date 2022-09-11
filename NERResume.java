package pack;

import java.io.IOException;
import java.io.StringReader;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.stanford.nlp.ling.CoreAnnotations;
import edu.stanford.nlp.ling.CoreLabel;
import edu.stanford.nlp.pipeline.CoreDocument;
import edu.stanford.nlp.pipeline.StanfordCoreNLP;

@WebServlet("/NERResume")
public class NERResume extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//private static String txtfile;
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public NERResume() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Text file is now being parsed");
		//String chaine = (String) request.getAttribute("variable_str");
		String fichiertexte = (String) request.getAttribute("fichiertexte");
		doNER(fichiertexte);
	}
	
	
	public static void doNER(String txt) {
		StanfordCoreNLP stanfordCoreNLP = Pipeline.getPipeline();
		
		CoreDocument coredocument = new CoreDocument(txt);
		
		stanfordCoreNLP.annotate(coredocument);
		
		List<CoreLabel> coreLabels = coredocument.tokens();
		
		for (CoreLabel coreLabel : coreLabels) {
			String ner = coreLabel.get(CoreAnnotations.NamedEntityTagAnnotation.class);
			
			System.out.println(coreLabel.originalText() + " = "+ ner);
			
		}
		
		
	}

}
