package com.rainng.coursesystem.manager;

import com.rainng.coursesystem.dao.redis.SdnuNewsDAO;
import com.rainng.coursesystem.model.bo.SdnuNewsBO;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
public class SdnuNewsManager extends BaseManager {
    private static final int CRAWL_INTERVAL = 60 * 60 * 1000;
    private static final int CRAWL_TIMEOUT = 30 * 1000;
    private static final String CRAWL_TARGET_URL = "http://www.bkjy.sdnu.edu.cn/xszq1.htm";
    private static final String BASE_URL = "http://www.bkjy.sdnu.edu.cn/";

    private final SdnuNewsDAO sdnuNewsDAO;

    public SdnuNewsManager(SdnuNewsDAO sdnuNewsDAO) {
        this.sdnuNewsDAO = sdnuNewsDAO;
    }

    public List<SdnuNewsBO> getAllNews() {
        Map<String, String> map = sdnuNewsDAO.getAllNews();

        List<SdnuNewsBO> newsList = new ArrayList<>(map.size());
        for (String key : map.keySet()) {
            String value = map.get(key);
            // 2019/01/01http://host/path
            String date = value.substring(0, 10);
            String url = value.substring(10);
            newsList.add(new SdnuNewsBO(key, date, url));
        }

        return newsList;
    }

    @Scheduled(fixedDelay = CRAWL_INTERVAL)
    public void crawlNews() {
        Document pageDoc = fetchPage();
        if (pageDoc == null) {
            return;
        }

        List<SdnuNewsBO> newsList = parseNews(pageDoc);
        sdnuNewsDAO.clear();
        for (SdnuNewsBO news : newsList) {
            sdnuNewsDAO.addNews(news.getTitle(), news.getDate() + news.getUrl());
        }
    }

    private Document fetchPage() {
        Document doc = null;
        try {
            doc = Jsoup.parse(new URL(CRAWL_TARGET_URL), CRAWL_TIMEOUT);
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        return doc;
    }

    private List<SdnuNewsBO> parseNews(Document pageDoc) {
        Elements elements = pageDoc.body()
                .getElementsByClass("TB3").get(0)
                .getElementsByTag("table").get(0)
                .getElementsByTag("tr");

        List<SdnuNewsBO> newsList = new ArrayList<>();
        for (Element element : elements) {
            if (!element.attr("id").startsWith("line")) {
                continue;
            }

            Element aTag = element.getElementsByTag("a").get(0);
            Element dateTag = element.getElementsByTag("td").get(2);
            String url = BASE_URL + aTag.attr("href");
            String title = aTag.text();
            String date = dateTag.text();
            newsList.add(new SdnuNewsBO(title, date, url));
        }

        return newsList;
    }
}
