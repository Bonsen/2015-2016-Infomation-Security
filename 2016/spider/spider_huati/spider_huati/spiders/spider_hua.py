 # -*- coding: utf-8 -*-
from scrapy import Request
import re
import json
import os
from scrapy.spiders import CrawlSpider, Rule
from login_api import get_login_cookie
from items import SpiderHuatiItem
import sys
import time
reload(sys)
sys.setdefaultencoding( "utf-8" )


class WeiboSpider(CrawlSpider):
    change_time = 0  #当前的微博账号NO.
    MaxBid = 30
    MaxLike = 0
    MaxComments = 20
    MaxReposts = 0
    is_first_time = True
    name = 'huati'
    total_request_times = 0
    # allowed_domains = ['ip.chinaz.com']
    # start_urls = ['http://ip.chinaz.com/']
    allowed_domains = ['m.weibo.cn']
    start_urls = [
                    'http://m.weibo.cn/page/pageJson?&containerid=100803_-_page_hot_list&page=1&retcode=6102'
                    ]
    cookies = None
    first_write = True
    first_write_time = True
    # def process_request(self, request):
    #     print "\n!!\nprocess_request\n!!\n"
    #     request = request.replace(**{'cookies': self.cookies})
    #     return request

    def start_requests(self):
        print "\nstart_requests\n"
        for url in self.start_urls:
            if not self.cookies:
                self.cookies = get_login_cookie(url,0) #刚开始时设定为第零个账号
                yield Request(url, dont_filter=True, cookies=self.cookies, meta={'cookiejar': 1})  # 这里填入保存的cookies

    def ip_parse(self):
        ip = re.findall('<tbody>\n<tr>\n<td>(.+?)</td>\n<td>([0-9]+)',response.body)
        if ip == None:
            print 'ip get error\n'
        else:
            f = open('../ip.txt', 'w')
            f.write(ip[0][0]+':')
            f.write(ip[0][1])
            print 'ip get success!\n'
            f.close()

    def request_time_up(self):
        print 'Total request Time is : ',self.total_request_times
        if self.total_request_times > 1500: #当1500次请求时换账号
            print "The Times up ..... \nNow in No.%d accoount \nChanging ip!!!\n" % self.change_time
            f = open("ip_pool.txt",'r')
            ips = f.readlines()
            f.close()
            print 'changing accoount'
            self.change_time += 1
            self.change_time %= 2 #当前一共两个账号
            ip = ips[self.change_time].replace('\n','').replace(' ','')
            f = open('ip.txt','w')
            f.write(ip)
            f.close()
            self.cookies = get_login_cookie('http://m.weibo.cn/page/pageJson?&containerid=100803_-_page_hot_list&page=1',self.change_time)
            self.total_request_times = 0

    def Data_huati_all_write(self,item):
        if not os.path.exists('Data/') :
            os.mkdir('Data/')
        f = open('Data/Data_huati_all.json','a+')
        if self.first_write:
            line=json.dumps(dict(item),ensure_ascii=False,indent=2).replace('\n','').replace(' ','')
            f = open('Data/Data_huati_all.json','w+')
            f.write('['+line+']')
            f.close()
            self.first_write = False
        else:
            content = f.read()
            con = content[:-1]
            f.close()
            f = open('Data/Data_huati_all.json','w+')
            line = json.dumps(dict(item),ensure_ascii=False,indent=2).replace('\n','').replace(' ','')
            f.write(con+','+line+']')
            f.close()


    def Data_huati_weibo_write(self,item):
        if not os.path.exists('Data/'+item['containerid']) :
            os.mkdir('Data/' + item['containerid'])
        f = open('Data/' + item['containerid']+'/'+item['bid']+'.json','a+')
        if len(f.read()) == 0:
            f.close()
            line=json.dumps(dict(item),ensure_ascii=False,indent=2).replace('\n','').replace(' ','')
            f = open('Data/' + item['containerid']+'/'+item['bid']+'.json','w+')
            f.write('['+line+']')
            f.close()
        else:
            f.close()
            f = open('Data/' + item['containerid']+'/'+item['bid']+'.json','r+')
            content = f.read()
            f.close()
            con = content[:-1]
            f = open('Data/' + item['containerid']+'/'+item['bid']+'.json','w+')
            line=json.dumps(dict(item),ensure_ascii=False,indent=2).replace('\n','').replace(' ','')
            f.write(con+','+line+']')
            f.close()


    def parse_huati_like(self, response):
        containerid = response.meta['containerid']
        bid = response.meta['bid']
        weibo_id = response.meta['weibo_id']
        page = response.meta['page']
        page = int(page)
        each_all = re.findall('"user":{(.+?)profile_image_url',response.body)
        if each_all :
            ID_all = []
            name_all = []
            for i in range(len(each_all)):
                ID = re.findall('"id":(\d+?),"screen_name"',each_all[i])
                name = re.findall('"screen_name":"(.+?)","',each_all[i])
                ID_all.append(ID[0])
                name_all.append(name[0])
            items = []
            for i in range(len(ID_all)):
                item=SpiderHuatiItem()
                item['ID'] = ID_all[i]
                item['name'] = unicode(str(name_all[i]),'unicode-escape')
                item['what'] = 'like'
                item['containerid'] = containerid
                item['bid'] = bid
                items.append(item)
                self.Data_huati_weibo_write(item)
            if page != self.MaxLike :
                yield Request('http://m.weibo.cn/single/likeList?format=cards&id='+str(weibo_id)+'&page='+str(page+1), meta={'containerid': containerid, 'bid': bid, 'weibo_id':weibo_id, 'page':page+1}, callback=self.parse_huati_like, cookies=self.cookies, dont_filter=True)
                self.total_request_times += 1
                self.request_time_up()
        else :
            pass

    def parse_huati_repost(self, response):
        containerid = response.meta['containerid']
        bid = response.meta['bid']
        weibo_id = response.meta['weibo_id']
        page = response.meta['page']
        page = int(page)
        each_all = re.findall('"user":{(.+?)profile_image_url',response.body)
        if each_all :
            ID_all = []
            name_all = []
            text_all = re.findall('"text":"(.+?)","created_at',response.body)
            for i in range(len(each_all)):
                ID = re.findall('"id":(\d+?),"screen_name"',each_all[i])
                name = re.findall('"screen_name":"(.+?)","',each_all[i])
                ID_all.append(ID[0])
                name_all.append(name[0])
            items = []
            for i in range(len(ID_all)):
                item=SpiderHuatiItem()
                item['ID'] = ID_all[i]
                item['name'] = unicode(str(name_all[i]),'unicode-escape')
                item['text'] = unicode(str(text_all[i].replace(r'\"', r'"').replace(r'\/', r'/')),'unicode-escape')
                item['what'] = 'repost'
                item['containerid'] = containerid
                item['bid'] = bid
                items.append(item)
                self.Data_huati_weibo_write(item)
            if page != self.MaxReposts :
                yield Request('http://m.weibo.cn/single/rcList?format=cards&id='+str(weibo_id)+'&type=repost&hot=0&page='+str(page+1), meta={'containerid': containerid, 'bid': bid, 'weibo_id':weibo_id, 'page':page+1}, callback=self.parse_huati_repost, cookies=self.cookies, dont_filter=True)
                self.total_request_times += 1
                self.request_time_up()
        else :
            pass

    def parse_huati_comment(self, response):
        containerid = response.meta['containerid']
        bid = response.meta['bid']
        weibo_id = response.meta['weibo_id']
        page = response.meta['page']
        page = int(page)
        each_all = re.findall('"user":{(.+?)like_counts":',response.body)
        if each_all :
            ID_all = []
            name_all = []
            text_all = []
            for i in range(len(each_all)):
                ID = re.findall('"id":(\d+?),"screen_name"',each_all[i])
                name = re.findall('"screen_name":"(.+?)","',each_all[i])
                text = re.findall('text":"(.+?)","',each_all[i])
                ID_all.append(ID[0])
                name_all.append(name[0])
                text_all.append(text[0].replace(r'\"', r'"').replace(r'\/', r'/'))
            items = []
            for i in range(len(ID_all)):
                item=SpiderHuatiItem()
                item['ID'] = ID_all[i]
                item['name'] = unicode(str(name_all[i]),'unicode-escape')
                item['text'] = unicode(str(text_all[i]),'unicode-escape')
                item['what'] = 'comment'
                item['containerid'] = containerid
                item['bid'] = bid
                items.append(item)
                self.Data_huati_weibo_write(item)
            if page != self.MaxComments :
                yield Request('http://m.weibo.cn/single/rcList?format=cards&id='+str(weibo_id)+'&type=comment&hot=0&page='+str(page+1), meta={'containerid': containerid, 'bid': bid, 'weibo_id':weibo_id, 'page':page+1}, callback=self.parse_huati_comment, cookies=self.cookies, dont_filter=True)
                self.total_request_times += 1
                self.request_time_up()
        else :
            pass


    def parse_huati_weibo(self, response):
        title = response.meta['title']
        page = response.meta['page']
        page = int(page)
        containerid = response.meta['containerid']
        each_all = re.findall('"card_type":9,(.+?)"openurl":""}',response.body)
        if each_all :
            bid_all = []
            ID_all = []
            name_all = []
            pic_all = []
            text_all = []
            weibo_id_all = []
            reposts_count_all = []
            comments_count_all = []
            attitudes_count_all = []
            for i in range(len(each_all)):
                bid = re.findall('"bid":"(.+?)","',each_all[i])
                ID = re.findall('{"id":(\d+?),"screen_name"',each_all[i])
                name = re.findall('"screen_name":"(.+?)","',each_all[i])
                pic = re.findall('"profile_image_url":"(.+?)","',each_all[i])
                text = re.findall('"text":"(.+?)","',each_all[i])
                weibo_id = re.findall('"mid":"(\d+?)","idstr',each_all[i])
                reposts_count = re.findall('"reposts_count":(\d+?),"',each_all[i])
                comments_count = re.findall('"comments_count":(\d+?),"',each_all[i])
                attitudes_count = re.findall('"attitudes_count":(\d+?),"',each_all[i])
                bid_all.append(bid[0])
                ID_all.append(ID[0])
                name_all.append(name[0])
                pic_all.append(pic[0].replace(r'\/', r'/'))
                text_all.append(text[0].replace(r'\"', r'"').replace(r'\/', r'/'))
                weibo_id_all.append(weibo_id[0])
                reposts_count_all.append(reposts_count[0])
                comments_count_all.append(comments_count[0])
                attitudes_count_all.append(attitudes_count[0])
            items = []
            for i in range(len(bid_all)):
                item=SpiderHuatiItem()
                item['bid'] = bid_all[i]
                item['ID'] = ID_all[i]
                item['name'] = unicode(str(name_all[i]),'unicode-escape')
                item['pic'] = pic_all[i]
                item['text'] = unicode(str(text_all[i]),'unicode-escape')
                item['weibo_id'] = weibo_id_all[i]
                item['reposts_count'] = reposts_count_all[i]
                item['comments_count'] = comments_count_all[i]
                item['attitudes_count'] = attitudes_count_all[i]
                item['title'] = title
                item['containerid'] = containerid
                items.append(item)
                self.Data_huati_weibo_write(item)
            for item in items:
                yield Request('http://m.weibo.cn/single/rcList?format=cards&id='+item['weibo_id']+'&type=comment&hot=0&page=1', meta={'containerid': item['containerid'],'bid': item['bid'],'weibo_id':item['weibo_id'],'page':1},  callback=self.parse_huati_comment, cookies=self.cookies, dont_filter=True)
                self.total_request_times += 1
                self.request_time_up()
                # yield Request('http://m.weibo.cn/single/rcList?format=cards&id='+item['weibo_id']+'&type=repost&hot=0&page=1', meta={'containerid': item['containerid'],'bid': item['bid'],'weibo_id':item['weibo_id'],'page':1},  callback=self.parse_huati_repost, cookies=self.cookies, dont_filter=True)
                # yield Request('http://m.weibo.cn/single/likeList?format=cards&id='+item['weibo_id']+'&page=1', meta={'containerid': item['containerid'],'bid': item['bid'],'weibo_id':item['weibo_id'],'page':1},  callback=self.parse_huati_like, cookies=self.cookies, dont_filter=True)
            if page != self.MaxBid :
                yield Request('http://m.weibo.cn/page/pageJson?containerid='+str(containerid)+'&page='+str(page+1), meta={'title': title,'page':page+1,'containerid':containerid},  callback=self.parse_huati_weibo, cookies=self.cookies, dont_filter=True)
                self.total_request_times += 1
                self.request_time_up()
        

    def parse(self, response):
        # print "\nparse\n"
        # ipp = re.findall('<dd class="fz24">(.+?)</dd>',response.body)
        # print '\n'
        # print '\n'
        # print ipp
        # # for i in range(10):
        # if self.is_first_time == True:
        #     yield Request('http://www.baidu.com', cookies=self.cookies, dont_filter=True)
        #     self.is_first_time = False
        title = re.findall('"card_type":8,"card_type_name":"(.+?)","',response.body)
        pic = re.findall('"pic":"(.+?)","',response.body)
        containerid = re.findall('containerid=(.+?)","',response.body)
        text = re.findall('"desc1":"(.+?)","',response.body)
        items = []
        if self.is_first_time :
            page = 1
            maxPage = re.findall('"maxPage":([0-9]+?),',response.body)
            self.is_first_time = False
        else:
            page = response.meta['page']
            maxPage = response.meta['maxPage']

        for i in range(len(title)):
            item=SpiderHuatiItem()
            item['title'] = unicode(str(title[i]),'unicode-escape')
            item['pic'] = pic[i].replace(r'\/', r'/')
            item['containerid'] = containerid[i]
            item['text'] = unicode(text[i],'unicode-escape')
            items.append(item)
            self.Data_huati_all_write(item)

        for item in items:
            yield Request('http://m.weibo.cn/page/pageJson?containerid='+str(item['containerid'])+'&page=1', meta={'title': item['title'],'page':1,'containerid':str(item['containerid'])},  callback=self.parse_huati_weibo, cookies=self.cookies, dont_filter=True)
            self.total_request_times += 1
            self.request_time_up()
        

        # if page < maxPage:
        #     page += 1
        #     yield Request('http://m.weibo.cn/page/pageJson?&containerid=100803_-_page_hot_list&page='+str(page), meta={'title': title,'page':page,'maxPage':maxPage,'containerid':containerid},  callback=self.parse, cookies=self.cookies, dont_filter=True)
