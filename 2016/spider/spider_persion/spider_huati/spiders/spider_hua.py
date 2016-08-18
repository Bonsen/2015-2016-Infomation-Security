# -*- coding: utf-8 -*-
from scrapy import Request
import re
import json
import os
from scrapy.spiders import CrawlSpider, Rule
from login_api import get_login_cookie
from ..items import SpiderHuatiItem
from scrapy.selector import Selector
import sys
reload(sys)
sys.setdefaultencoding( "utf-8" )


class WeiboSpider(CrawlSpider):
    # MaxBid = 3
    # MaxLike = 0
    # MaxComments = 0
    # MaxReposts = 0
    fellows_page_first = True
    fans_page_first = True
    person_weibo_first = True
    name = 'huati'
    allowed_domains = ['m.weibo.cn']
    user_id = '2413854663'
    start_urls = [
                    'http://m.weibo.cn/u/'+user_id
                    ]
    cookies = None

    # def process_request(self, request):
    #     print "\n!!\nprocess_request\n!!\n"
    #     request = request.replace(**{'cookies': self.cookies})
    #     return request

    def value(self, data):
        return (0 if len(data)==0 else data[0])

    def start_requests(self):
        print "\nstart_requests\n"
        for url in self.start_urls:
            if not self.cookies:
                self.cookies = get_login_cookie(url)
            yield Request(url, dont_filter=True, cookies=self.cookies, meta={'cookiejar': 1})  # 这里填入保存的cookies




    def Data_huati_weibo_write(self,item):
        if not os.path.exists('Data/'+item['user_id']) :
            os.mkdir('Data/' + item['user_id'])
        f = open('Data/' + item['user_id']+'/'+self.user_id+'.json','a+')
        if len(f.read()) == 0:
            f.close()
            line=json.dumps(dict(item),ensure_ascii=False,indent=2).replace('\n','').replace(' ','')
            # f = open('Data/Data_huati_all.json','w+')
            f= open('Data/' + item['user_id']+'/'+self.user_id+'.json','w+')
            f.write('['+line+']')
            f.close()

        else:
            f.close()
            f = open('Data/' + item['user_id']+'/'+self.user_id+'.json','a+')
            text = f.read()
            f.close()
            te = text[:-1]
            line = json.dumps(dict(item),ensure_ascii=False,indent=2).replace('\n','').replace(' ','')
            # f = open('Data/Data_huati_all.json','w+')
            f = open('Data/' + item['user_id']+'/'+self.user_id+'.json','w+')
            f.write(te+','+line+']')
            f.close()

    def Data_weibo_write(self,item,poster_id,weibo_id):
        f = open('Data/'+str(poster_id)+'/'+str(weibo_id)+'.json','a+')
        if len(f.read()) == 0:
            f.close()
            f = open('Data/'+str(poster_id)+'/'+str(weibo_id)+'.json','w+')
            line=json.dumps(dict(item),ensure_ascii=False,indent=2).replace('\n','').replace(' ','')
            # f = open('Data/Data_huati_all.json','w+')
            f.write('['+line+']')
            f.close()
        else:
            f.close()
            f = open('Data/'+str(poster_id)+'/'+str(weibo_id)+'.json','a+')
            text = f.read()
            te = text[:-1]
            f.close()
            f = open('Data/'+str(poster_id)+'/'+str(weibo_id)+'.json','w+')
            line=json.dumps(dict(item),ensure_ascii=False,indent=2).replace('\n','').replace(' ','')
            # f = open('Data/Data_huati_all.json','w+')
            f.write(te+','+line+']')
            f.close()

    def data_weibo_common_write(self, item, user_id, weibo_id):
        if not os.path.exists('Data/'+str(user_id)) :
            os.mkdir('Data/' + str(user_id))
        f = open('Data/' + str(user_id)+'/'+str(weibo_id)+'.json','a+')
        if len(f.read()) == 0:
            f.close()
            f = open('Data/' + str(user_id)+'/'+str(weibo_id)+'.json','w+')
            line=json.dumps(dict(item),ensure_ascii=False,indent=2).replace('\n','').replace(' ','')
            # f = open('Data/Data_huati_all.json','w+')
            f.write('['+line+']')
            f.close()
        else:
            f.close()
            f = open('Data/' + str(user_id)+'/'+str(weibo_id)+'.json','a+')
            text = f.read()
            te = text[:-1]
            f.close()
            line=json.dumps(dict(item),ensure_ascii=False,indent=2).replace('\n','').replace(' ','')
            # f = open('Data/Data_huati_all.json','w+')
            f = open('Data/' + str(user_id)+'/'+str(weibo_id)+'.json','w+')
            f.write(te+','+line+']')
            f.close()

    def parse_weibo_repost(self,response):
        containerid = response.meta['containerid']   
        page = response.meta['page']
        user_id = response.meta['user_id']
        weibo_id = response.meta['weibo_id']
        repost_list = json.loads(response.body.decode('gbk', 'ignore').encode('gb18030'))
        is_empty = repost_list[0]['mod_type']
        if is_empty != "mod/empty":
            html = response.body
            repost_id = re.findall('"id":([0-9]+?),"text"',html)
            repost_from_id = re.findall('"user":{"id":(.+?),',html)
            repost_from_name = re.findall('"screen_name":"(.*?)",',html)
            repost_text = re.findall('"text":"(.+?)","created_at"',html)
            repost_from_profile_image_url = re.findall('"profile_image_url":"(.+?)",',html)
            if len(repost_from_id) != 0:
                for i in range(len(repost_from_id)):
                    item = SpiderHuatiItem()
                    item['repost_id'] = int(repost_id[i])
                    item['repost_from_id'] =int(repost_from_id[i])
                    item['repost_from_name'] =unicode(str(repost_from_name[i]),'unicode-escape') 
                    item['repost_text'] =unicode(str(repost_text[i]),'unicode-escape') 
                    item['repost_from_profile_image_url'] = unicode(str(repost_from_profile_image_url[i]).replace('\\',''),'unicode-escape')
                    self.data_weibo_common_write(item, user_id, weibo_id)
            page += 1
            yield Request('http://m.weibo.cn/'+str(user_id)+'/'+str(weibo_id)+'/rcMod?format=cards&type=repost&page='+str(page),meta={'containerid': containerid,'page':page, 'maxPage':0, 'user_id':user_id,'weibo_id':weibo_id},callback=self.parse_weibo_repost, cookies=self.cookies, dont_filter=True)
        else:
            yield Request('http://m.weibo.cn/single/likeList?format=cards&id='+str(weibo_id)+'&page=1',meta={'containerid': containerid,'page':1, 'maxPage':0, 'user_id':user_id,'weibo_id':weibo_id},callback=self.parse_weibo_like, cookies=self.cookies, dont_filter=True)


    def parse_weibo_like(self,response):
        containerid = response.meta['containerid']   
        page = response.meta['page']
        user_id = response.meta['user_id']
        weibo_id = response.meta['weibo_id']
        like_list = json.loads(response.body.decode('gbk', 'ignore').encode('gb18030'))
        is_empty = like_list[0]['mod_type']
        if is_empty != "mod/empty":
            html = response.body
            like_from_id = re.findall('"id":([0-9]+?),"screen_name"',html)
            like_from_name = re.findall('"screen_name":"(.*?)","profile_image_url',html)
            like_from_profile_image_url = re.findall('"profile_image_url":"(.+?)",',html)
            if len(like_from_id) != 0:
                for i in range(len(like_from_id)):
                    item = SpiderHuatiItem()
                    item['like_from_id'] =int(like_from_id[i])
                    item['like_from_name'] =unicode(str(like_from_name[i]),'unicode-escape') 
                    item['like_for_weibo_id'] = weibo_id
                    item['like_from_profile_image_url'] = unicode(str(like_from_profile_image_url[i]).replace('\\',''),'unicode-escape')
                    self.data_weibo_common_write(item, user_id, weibo_id)
            page += 1
            yield Request('http://m.weibo.cn/single/likeList?format=cards&id='+str(weibo_id)+'&page='+str(page),meta={'containerid': containerid,'page':1, 'maxPage':0, 'user_id':user_id,'weibo_id':weibo_id},callback=self.parse_weibo_like, cookies=self.cookies, dont_filter=True)

    def parse_weibo_comment(self,response):
        containerid = response.meta['containerid']   
        page = response.meta['page']
        user_id = response.meta['user_id']
        weibo_id = response.meta['weibo_id']
        comments_list = json.loads(response.body.decode('gbk', 'ignore').encode('gb18030'))
        is_empty = comments_list[0]['mod_type']
        if is_empty != "mod/empty":
            html = response.body
            comment_id = re.findall('"id":([0-9]+?),"created_at"',html)
            comment_from_id = re.findall('"user":{"id":(.+?),',html)
            comment_from_name = re.findall('"screen_name":"(.*?)",',html)
            comment_text = re.findall('"text":"(.+?)",',html)
            comment_from_profile_image_url = re.findall('"profile_image_url":"(.+?)",',html)
            if len(comment_from_id) != 0:
                for i in range(len(comment_from_id)):
                    item = SpiderHuatiItem()
                    item['comment_id'] = int(comment_id[i])
                    item['comment_from_id'] =int(comment_from_id[i])
                    item['comment_from_name'] =unicode(str(comment_from_name[i]),'unicode-escape') 
                    item['comment_text'] =unicode(str(comment_text[i]),'unicode-escape') 
                    item['comment_from_profile_image_url'] = unicode(str(comment_from_profile_image_url[i]).replace('\\',''),'unicode-escape')
                    self.data_weibo_common_write(item, user_id, weibo_id)
            page += 1
            yield Request('http://m.weibo.cn/'+str(user_id)+'/'+str(weibo_id)+'/rcMod?format=cards&type=comment&page='+str(page),meta={'containerid': containerid,'page':page, 'maxPage':0, 'user_id':user_id,'weibo_id':weibo_id},callback=self.parse_weibo_comment, cookies=self.cookies, dont_filter=True)
        else:
            yield Request('http://m.weibo.cn/'+str(user_id)+'/'+str(weibo_id)+'/rcMod?format=cards&type=repost&page=1',meta={'containerid': containerid,'page':1, 'maxPage':0, 'user_id':user_id,'weibo_id':weibo_id},callback=self.parse_weibo_repost, cookies=self.cookies, dont_filter=True)






    def parse_person_weibo(self, response):
        containerid = response.meta['containerid']   
        page = response.meta['page']
        weibo_list = json.loads(response.body.decode('gbk', 'ignore').encode('gb18030'))
        is_empty = weibo_list['cards'][0]['mod_type']
        if is_empty != "mod/empty":
            page_weibo_count = len(weibo_list['cards'][0]['card_group'])#当前返回的json文件一共包括的微博数目
            for i in range(page_weibo_count):#对第i条微博
                item = SpiderHuatiItem()
                item['weibo_id'] = weibo_list['cards'][0]['card_group'][i]['mblog']['id']
                item['weibo_text'] = weibo_list['cards'][0]['card_group'][i]['mblog']['text']
                item['weibo_post_id'] = weibo_list['cards'][0]['card_group'][i]['mblog']['user']['id']
                item['weibo_post_name'] = weibo_list['cards'][0]['card_group'][i]['mblog']['user']['screen_name']
                item['weibo_repost_count'] = weibo_list['cards'][0]['card_group'][i]['mblog']['reposts_count']
                item['weibo_comments_count'] = weibo_list['cards'][0]['card_group'][i]['mblog']['comments_count']
                item['weibo_attitudes_count'] = weibo_list['cards'][0]['card_group'][i]['mblog']['attitudes_count']
                if weibo_list['cards'][0]['card_group'][i]['mblog'].get('pics',0) != 0:
                    pic_number = len(weibo_list['cards'][0]['card_group'][i]['mblog']['pics'])
                    pics = []
                    for m in range(pic_number):
                        pics.append(weibo_list['cards'][0]['card_group'][i]['mblog']['pics'][m]['url'])
                    item['weibo_pics'] = pics
                else:
                    item['weibo_pics'] = 0
                if weibo_list['cards'][0]['card_group'][i]['mblog'].get('retweeted_status',0) == 0:
                    item["weibo_original_poster_id"] = item['weibo_post_id']
                    item["weibo_original_poster_name"] = item["weibo_post_name"]
                    item['weibo_is_original'] = True
                    item['weibo_original_text'] = item['weibo_text']
                else:
                    item["weibo_original_poster_id"] = weibo_list['cards'][0]['card_group'][i]['mblog']['retweeted_status']['user']['id']
                    item["weibo_original_poster_name"] = weibo_list['cards'][0]['card_group'][i]['mblog']['retweeted_status']['user']['screen_name']
                    item['weibo_is_original'] = False
                    item['weibo_original_text'] = weibo_list['cards'][0]['card_group'][i]['mblog']['retweeted_status']['text']
                self.Data_weibo_write(item,item['weibo_post_id'],item['weibo_id'])
                yield Request('http://m.weibo.cn/'+str(item['weibo_post_id'])+'/'+str(item['weibo_id'])+'/rcMod?format=cards&type=comment&page=1',
                meta={'containerid': containerid,'page':1, 'maxPage':0, 'user_id':item['weibo_post_id'],'weibo_id':item['weibo_id']},
                callback=self.parse_weibo_comment, cookies=self.cookies, dont_filter=True)
            page  += 1
            yield Request('http://m.weibo.cn/page/json?containerid='+containerid+'_-_WEIBO_SECOND_PROFILE_WEIBO&page='+str(page),
                meta={'containerid': containerid,'page':page, 'maxPage':0},
                callback=self.parse_person_weibo, cookies=self.cookies, dont_filter=True)



    def parse_person_fans(self, response):

        containerid = response.meta['containerid']
        user_id = self.user_id
        page = response.meta['page']
        maxPage = response.meta['maxPage']

        fans_id = re.findall('"id":(.+?),',response.body)
        fans_name = re.findall('"screen_name":"(.+?)",',response.body)
        fans_image_url = re.findall('"profile_image_url":"(.+?)",',response.body)

        if self.fans_page_first:
            maxPage =  int (re.findall('"maxPage":(.+?),',response.body)[0])
            page = int (re.findall('"page":(.+?),',response.body)[0])
            self.fans_page_first = False
        
        fans_ids = re.findall('"id":(.+?),',response.body)
        fans_names = re.findall('"screen_name":"(.+?)",',response.body)
        fans_image_urls = re.findall('"profile_image_url":"(.+?)",',response.body)
        for i in range(len(fans_names)):
            item = SpiderHuatiItem()
            item['fans_name']=unicode(str(fans_names[i]),'unicode-escape')
            item['fans_id'] = fans_ids[i]
            item['fans_image_url'] = unicode(str(fans_image_urls[i]).replace('\\',''),'unicode-escape')
            item['user_id'] = user_id
            item['containerid'] = containerid
            self.Data_huati_weibo_write(item)
        if page != maxPage:
            page += 1
            yield Request('http://m.weibo.cn/page/json?containerid='+ containerid +'_-_FANS&page='+str(page),meta={'containerid': containerid,'page':page, 'maxPage':maxPage },callback=self.parse_person_fans, cookies=self.cookies, dont_filter=True)
        else:
            yield Request('http://m.weibo.cn/page/json?containerid='+containerid+'_-_WEIBO_SECOND_PROFILE_WEIBO&page=1',
                meta={'containerid': containerid,'page':1, 'maxPage':0},
                callback=self.parse_person_weibo, cookies=self.cookies, dont_filter=True)

    def parse_person_followers(self, response):
        
        page = response.meta['page']
        maxPage = response.meta['maxPage']
        containerid = response.meta['containerid']
        user_id = self.user_id
        if self.fellows_page_first:
            maxPage =  int (re.findall('"maxPage":(.+?),',response.body)[0])
            page = int (re.findall('"page":(.+?),',response.body)[0])
            self.fellows_page_first = False
        fellows_ids = re.findall('"id":(.+?),',response.body)
        fellows_names = re.findall('"screen_name":"(.+?)",',response.body)
        fellows_image_urls = re.findall('"profile_image_url":"(.+?)",',response.body)
        for i in range(len(fellows_names)):
            item = SpiderHuatiItem()
            item['fellows_name']=unicode(str(fellows_names[i]),'unicode-escape')
            item['fellows_id'] = fellows_ids[i]
            item['fellows_image_url'] = unicode(str(fellows_image_urls[i]).replace('\\',''),'unicode-escape')
            item['user_id'] = user_id
            item['containerid'] = containerid
            self.Data_huati_weibo_write(item)
        if page != maxPage:
            page += 1
            yield Request('http://m.weibo.cn/page/json?containerid='+containerid+'_-_FOLLOWERS&page='+str(page),meta={'containerid':containerid,'page':page,'maxPage':maxPage},callback = self.parse_person_followers, cookies=self.cookies ,dont_filter=True)
        else:
            yield Request('http://m.weibo.cn/page/json?containerid='+ containerid +'_-_FANS&page=1',meta={'containerid': containerid,'page':1, 'maxPage':0 },callback=self.parse_person_fans, cookies=self.cookies, dont_filter=True)

    def parse_person_info(self, response):

        containerid = response.meta['containerid']
        html = unicode(response.body)
        
        name = re.findall(u'<span>昵称</span><p>(.+?)</p>',html)
        sex = re.findall(u'<span>性别</span><p>(.+?)</p>',html)
        position = re.findall(u'<span>所在地</span><p>(.+?)</p>',html)
        introduction = re.findall(u'<span>简介</span><p>(.+?)</p>',html)
        birthday = re.findall(u'<span>生日</span><p>(.+?)</p>',html)
        email = re.findall(u'<span>邮箱</span><p>(.+?)</p>',html)
        qq = re.findall(u'<span>QQ</span><p>(.+?)</p>',html)
        blog = re.findall(u'<span>博客</span><!--2:显示--><p>(.+?)</p>',html)
        msn = re.findall(u'<span>MSN</span><p>(.+?)</p>',html)
        company = re.findall(u'<span>公司</span><p>(.+?)</p>',html)
        university = re.findall(u'<span>大学</span><p>(.+?)</p>',html)
        
        item=SpiderHuatiItem()
        
        item['name'] = self.value(name)
        item['sex'] = self.value(sex)
        item['position'] = self.value(position)
        item['introduction'] = self.value(introduction)
        item['birthday'] = self.value(birthday)
        item['email'] = self.value(email)
        item['qq'] = self.value(qq)
        item['blog'] = self.value(blog)
        item['msn'] = self.value(msn)
        item['company'] = self.value(company)
        item['containerid'] = containerid
        item['user_id'] = self.user_id
        # items.append(item)
        self.Data_huati_weibo_write(item)
        yield Request('http://m.weibo.cn/page/json?containerid='+containerid+'_-_FOLLOWERS&page=1',meta={'containerid':containerid,'page':1,"maxPage":0},callback = self.parse_person_followers, cookies=self.cookies ,dont_filter=True)



    def parse(self, response):
        # 爬取个人资料，获得containerid
        containerid = re.findall('containerid":"(.+?)"',response.body)
        yield Request('http://m.weibo.cn/users/'+self.user_id+'?', meta={'containerid': containerid[0] },  callback=self.parse_person_info, cookies=self.cookies, dont_filter=True)
