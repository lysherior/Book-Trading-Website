package app;

import com.fasterxml.jackson.databind.ObjectMapper;
import data.dao.BookMapper;
import data.pojo.Book;
import data.pojo.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import data.dao.UserMapper;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class Controller {

    static SqlSession getSqlSession() throws IOException {
        String resource = "mybatis/config.xml"; // 定位核心配置文件
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream); // 创建 SqlSessionFactory
        return sqlSessionFactory.openSession(true); // 获取到 SqlSession, true 表示 自动提交事务
    }

    @RequestMapping(path="/register")
    public void register(@RequestParam(value = "username") String username,
                         @RequestParam(value = "password") String password,
                         @RequestParam(value = "email") String email,
                         HttpServletRequest request,
                         HttpServletResponse response) throws IOException {
        response.addHeader("Access-Control-Allow-Origin", "*");

        request.getSession().setAttribute("email", email);

        SqlSession sqlSession = getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        User newUser = new User();
        newUser.setName(username);
        newUser.setPassword(password);
        newUser.setEmail(email);

        int res = userMapper.insertUser(newUser);
        if (res == 0) {
            response.getWriter().write("fail");
        } else {
            response.getWriter().write("success");
        }
    }

    @RequestMapping(path="/login")
    public void login(@RequestParam(value = "email") String email,
                      @RequestParam(value = "password") String password,
                      HttpServletRequest request,
                      HttpServletResponse response) throws IOException {
        response.addHeader("Access-Control-Allow-Origin", "*");

        request.getSession().setAttribute("email", email);

        SqlSession sqlSession = getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);

        User user = userMapper.selectUserByEmail(email);
        if (user == null) {
            response.getWriter().write("no user");
        } else if (!user.getPassword().equals(password)) {
            response.getWriter().write("wrong password");
        } else {
            response.getWriter().write("success,"+user.getName());
        }
    }

    @RequestMapping(path="/mainPage")
    public void mainPage(@RequestParam(value = "email") String email,
                      HttpServletRequest request,
                      HttpServletResponse response) throws IOException {
        response.addHeader("Access-Control-Allow-Origin", "*");

        SqlSession sqlSession = getSqlSession();
        BookMapper bookMapper = sqlSession.getMapper(BookMapper.class);
        List<Book> books = bookMapper.selectAllBooks();
        if (books.isEmpty()) {
            response.getWriter().write("no book");
            return;
        }
        ObjectMapper objMap = new ObjectMapper();
        System.out.println(objMap.writeValueAsString(books));
        response.getWriter().write(objMap.writeValueAsString(books));
    }


    @RequestMapping(path="/mySellBook")
    public void mySellBook(@RequestParam(value = "email") String email,
                         HttpServletRequest request,
                         HttpServletResponse response) throws IOException {
        response.addHeader("Access-Control-Allow-Origin", "*");

        SqlSession sqlSession = getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        List<Book> books = userMapper.selectSellBooks(email);
        if (books.isEmpty()) {
            response.getWriter().write("no book");
            return;
        }
        ObjectMapper objMap = new ObjectMapper();
        System.out.println(objMap.writeValueAsString(books));
        response.getWriter().write(objMap.writeValueAsString(books));
    }

    @RequestMapping(path="/myBuyBook")
    public void myBuyBook(@RequestParam(value = "email") String email,
                           HttpServletRequest request,
                           HttpServletResponse response) throws IOException {
        response.addHeader("Access-Control-Allow-Origin", "*");

        SqlSession sqlSession = getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        List<Book> books = userMapper.selectBuyBooks(email);
        if (books.isEmpty()) {
            response.getWriter().write("no book");
            return;
        }
        ObjectMapper objMap = new ObjectMapper();
        System.out.println(objMap.writeValueAsString(books));
        response.getWriter().write(objMap.writeValueAsString(books));
    }

    @RequestMapping(path="/myNeedBook")
    public void myNeedBook(@RequestParam(value = "email") String email,
                          HttpServletRequest request,
                          HttpServletResponse response) throws IOException {
        response.addHeader("Access-Control-Allow-Origin", "*");

        SqlSession sqlSession = getSqlSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        List<Book> books = userMapper.selectNeedBooks(email);
        if (books.isEmpty()) {
            response.getWriter().write("no book");
            return;
        }
        ObjectMapper objMap = new ObjectMapper();
        System.out.println(objMap.writeValueAsString(books));
        response.getWriter().write(objMap.writeValueAsString(books));
    }


    @RequestMapping(path="/search")
    public void search(@RequestParam(value = "searchKey") String searchKey,
                          HttpServletRequest request,
                          HttpServletResponse response) throws IOException {
        response.addHeader("Access-Control-Allow-Origin", "*");

        SqlSession sqlSession = getSqlSession();
        BookMapper bookMapper = sqlSession.getMapper(BookMapper.class);

        String[] keys = searchKey.split(" ");
        List<Book> res = new ArrayList<>();
        for (String key : keys) {
            System.out.println(key);
            List<Book> books = bookMapper.selectBooksByKey(key);
            res.addAll(books);
        }
        if (res.isEmpty()) {
            response.getWriter().write("no book");
            return;
        }
        ObjectMapper objMap = new ObjectMapper();
        System.out.println(objMap.writeValueAsString(res));
        response.getWriter().write(objMap.writeValueAsString(res));
    }

    @RequestMapping(path="/addToSell")
    public void addToSell(@RequestParam(value = "image") MultipartFile image,
                          HttpServletRequest request,
                          HttpServletResponse response) throws IOException {
        response.addHeader("Access-Control-Allow-Origin", "*");

        Book book = new Book();
        book.setName(request.getParameter("bookname"));
        book.setISBN(request.getParameter("ISBN"));
        book.setOriginalprice(Float.parseFloat(request.getParameter("originalprice")));
        book.setPrice(Float.parseFloat(request.getParameter("price")));
        book.setCategory(request.getParameter("category"));
        book.setDetails(request.getParameter("details"));
        book.setState((short) 1);
        if (image.isEmpty()) {
            return;
        }
        String fileName = image.getOriginalFilename();
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        fileName = UUID.randomUUID().toString().replace("-", "") + suffixName;
        String pathName = System.getProperty("user.dir");
        InetAddress localhost = null;
        localhost = Inet4Address.getLocalHost();
        String ip = localhost.getHostAddress();
        int port = 8080;

        //book.setImageURL("http://" + ip + ":" + port + "/Book-Trading-Website/Book-Trading-Website_main/resources/bookImage/" + fileName);
        book.setImageURL("http://localhost:63342/Book-Trading-Website/Book-Trading-Website_main/resources/bookImage/" + fileName);
        BufferedOutputStream bos = new BufferedOutputStream(
                                        new FileOutputStream(
                                            new File(pathName + "/src/main/resources/bookImage/" + fileName)
                                        ));
        byte[] bytes = image.getBytes();
        bos.write(bytes);
        bos.close();

        SqlSession sqlSession = getSqlSession();
        BookMapper bookMapper = sqlSession.getMapper(BookMapper.class);
        int res = bookMapper.insertBook(book);
        if (res == 0) {
            return;
        }
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        userMapper.insertSell(request.getParameter("email"), book.getBookID());

        System.out.println(pathName + "/src/main/resources/bookImage/" + fileName);
        System.out.println(request.getParameter("email") + "------" + book.getBookID());

        response.getWriter().write("success");

    }

    @RequestMapping(path="/buyBook")
    public void buyBook(HttpServletRequest request,
                        HttpServletResponse response) throws IOException {
        response.addHeader("Access-Control-Allow-Origin", "*");
        System.out.println(request.getParameter("consumerEmail"));
        SqlSession sqlSession = getSqlSession();
        BookMapper bookMapper = sqlSession.getMapper(BookMapper.class);
        bookMapper.purchaseBook(Integer.parseInt(request.getParameter("bookID")));
        System.out.println("2");
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        userMapper.insertBuy(request.getParameter("consumerEmail"), Integer.parseInt(request.getParameter("bookID")));
        System.out.println("3");
        response.getWriter().write("success");
    }

}

//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";