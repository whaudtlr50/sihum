package com.kgu.www;

import java.text.SimpleDateFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kgu.www.Book.service.BookService;
import com.kgu.www.Book.vo.BookVO;
import com.kgu.www.service.BoardService;
import com.kgu.www.service.MemberService;
import com.kgu.www.vo.BoardPagingVO;
import com.kgu.www.vo.FreeBoardVO;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

///**
// * Handles requests for the application home page.
// */
@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	BookService bookService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private BoardPagingVO boardPagingVO = new BoardPagingVO(10, 5);
	private BoardPagingVO boardCommentPagingVO = new BoardPagingVO(10, 5);
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd hh:mm:ss");
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws Exception {
		model.addAttribute("bvo", bookService.bookAll());
		model.addAttribute("fvo", boardService.FreeboardAll());
		return "main";
	}
	
}
