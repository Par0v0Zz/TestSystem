package controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import entity.Answer;
import entity.Question;
import entity.Test;
import services.api.AnswerService;
import services.api.QuestionService;
import services.api.TestService;
import services.impl.AnswerServiceImpl;
import services.impl.QuestionServiceImpl;
import services.impl.TestServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddTestServlet extends HttpServlet {

    private static final String TEST = "test";
    private static final TestService testService = new TestServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String test = req.getParameter(TEST);
        String result = createNewTest(convertJson(test));
        if("OK".equals(result)){
            resp.sendRedirect("/catalog");
        } else {
            resp.sendRedirect("/editor");
        }
    }

    private Test convertJson(String test) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.readValue(test, Test.class);
    }

    private String createNewTest(Test test) {
        return testService.addTestFromForm(test);
    }
}
