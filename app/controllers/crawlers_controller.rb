class CrawlersController < ApplicationController
require 'nokogiri'
require 'open-uri'

  before_action :authenticate_user!

    def create
    end 
    def testing
        sangong = []
        col = ["0231","0140","0217","0217","0217","0217","0217","0217","0217",
        "0217","3928","3928","5338","0143","0143","0143","0143","0143","0143",
        "0143","0143","0143","0143","0143","0143","0143","0143","0143","0143",
        "0143","0143","0143","0143","0143","0143","5256","0137","4669","4669",
        "4669","4669","4669","4669","4669","4669","4669","0234","0234","0234",
        "0234","0234","0234","0234","0234","0234","0234","0234","4652","4652",
        "4652","4652","4652","4652","4652","4652","0226","0226","0209","0209",
        "0209","0209","0209","0209","0197","0197","0197","0197","0197","0197",
        "5720","5720","5720","5436","3930","3930","5961","3641","3643","5963","3645"]
        dept = ["0233","0142","4065","4952","5320","4630","5597","5204","4887",
        "4084","3931","5943","5339","4067","5672","6095","6093","0145","0156",
        "0153","0154","0803","0152","0158","0151","4391","0146","6342","6094",
        "5539","0157","0155","0147","0148","0159","5257","0139","4672","5694",
        "5693","4671","5696","5695","4676","4670","4673","0238","0236","0240",
        "5753","0239","0243","0241","0242","0237","0245","4638","4654","4719",
        "4653","4656","4425","5564","4657","5019","0228","0229","4063","0212",
        "0211","4603","0215","0213","5015","0200","5046","0199","0201","0203",
        "5965","5944","5722","5437","4728","5188","5960","3649","3651","5964","3653"]
    
        for j in (0..89)
            doc = Nokogiri::HTML(open("http://sugang.korea.ac.kr/lecture/LecMajorSub.jsp?lang=KOR&yy=2017&tm=2R&sCampus=1&col=#{col[j]}&dept=#{dept[j]}","r:binary").read.encode("utf-8", "euc-kr"))
        for i in (1..32)
            campus = doc.css(".page//table//tr:nth-child(#{i})//td:nth-child(1)").inner_text.gsub(/[ ]/,"")
            haksu = doc.css(".page//table//tr:nth-child(#{i})//td:nth-child(2)//a").inner_text.gsub(/[ ]/,"")
            boonban = doc.css(".page//table//tr:nth-child(#{i})//td:nth-child(3)").inner_text.gsub(/[ ]/,"")
            isoo = doc.css(".page//table//tr:nth-child(#{i})//td:nth-child(4)").inner_text.gsub(/[ ]/,"")
            gwamok = doc.css(".page//table//tr:nth-child(#{i})//td:nth-child(5)").inner_text.split("\n")[0]
            gyosoo = doc.css(".page//table//tr:nth-child(#{i})//td:nth-child(6)").inner_text.gsub(/[ ]/,"")
            hakjum = doc.css(".page//table//tr:nth-child(#{i})//td:nth-child(7)").inner_text.gsub(/[ ]/,"")
            timeplace1 = doc.css(".page//table//tr:nth-child(#{i})//td:nth-child(8)").inner_text.split("\n")[0]
            timeplace2 = doc.css(".page//table//tr:nth-child(#{i})//td:nth-child(8)").inner_text.split("\n")[1]
            timeplace3 = doc.css(".page//table//tr:nth-child(#{i})//td:nth-child(8)").inner_text.split("\n")[2]
            timeplace4 = doc.css(".page//table//tr:nth-child(#{i})//td:nth-child(8)").inner_text.split("\n")[3]
            gwamokid = doc.css(".page//table//tr:nth-child(#{i})//td:nth-child(2)//a").inner_text.gsub(/[ ]/,"")+doc.css(".page//table//tr:nth-child(#{i})//td:nth-child(3)").inner_text.gsub(/[ ]/,"")
    sangong1 = Hash.new
    sangong1["gwamokid"] = "#{gwamokid}"
    sangong1["campus"] = "#{campus}"
    sangong1["haksu"] = "#{haksu}"
    sangong1["boonban"] = "#{boonban}"
    sangong1["isoo"] = "#{isoo}"
    sangong1["gwamok"] = "#{gwamok}"
    sangong1["gyosoo"] = "#{gyosoo}"
    sangong1["hakjum"] = "#{hakjum}"
    sangong1["timeplace1"] = "#{timeplace1}"
    sangong1["timeplace2"] = "#{timeplace2}"
    sangong1["timeplace3"] = "#{timeplace3}"
    sangong1["timeplace4"] = "#{timeplace4}"
    sangong << sangong1
end
end
    sangong.each do |s|
    Crawl.create!(gwamokid:s["gwamokid"], campus:s["campus"], haksu:s["haksu"], boonban:s["boonban"], 
                    isoo:s["isoo"], gwamok:s["gwamok"], gyosoo:s["gyosoo"], 
                  hakjum:s["hakjum"], timeplace1:s["timeplace1"], timeplace2:s["timeplace2"], 
              timeplace3:s["timeplace3"], timeplace4:s["timeplace4"])
    end
    end
    
   def viewfile
       @Crawls= Crawl.all
   
   end
  
    def searchtest2
    @search = Crawl.search(params[:q])
    @gwamoks = @search.result
    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty? 
    end
  
  
    def intersection
        @currentgwamokid = params[:currentgwamokid]
    end
    
    def create #추가하기 하면 모델에 추가되는 액션
    a = []
    a << params[:timeplace1] << params[:timeplace2] << params[:timeplace3] << params[:timeplace4]
    a
    ahnroon = ""
    a.each do |x|
        next if x == ""
        k = x
        imsiyoil = ""
        givenyoil = k.split('(')[0]
        case givenyoil
            when "월"
            imsiyoil = 0
            when "화"
            imsiyoil = 1
            when "수"
            imsiyoil = 2
            when "목"
            imsiyoil = 3
            else "금"
            imsiyoil = 4
        end
        if k.split("(")[1].split(")")[0].include?('-')
            if k.split("-")[1].split(')')[0].to_i - k.split("-")[0].split('(')[1].to_i == 2
            ahnroon = ahnroon+"/"+"#{imsiyoil}"+"#{k.split("-")[1].split(')')[0].to_i - 1}"+"/"+
            "#{imsiyoil}"+"#{k.split("-")[1].split(')')[0].to_i - 2}"+ "/"+"#{imsiyoil}"+"#{k.split("-")[1].split(')')[0].to_i - 3}"
            else
            ahnroon = ahnroon+"/"+"#{imsiyoil}" + "#{k.split("-")[1].split(')')[0].to_i - 1}" +"/"+"#{imsiyoil}"+
            "#{k.split("-")[1].split(')')[0].to_i - 2}"
            end
        else
            ahnroon = ahnroon+"/"+"#{imsiyoil}" + "#{k.split(")")[0].split("(")[1].to_i - 1}"
        end
    end
    ahnroon = params[:gwamok]+ahnroon
    Usergwamok.create(user_id: current_user.id, gwamokid: params[:gwamokid], 
                     crawl_id: params[:crawl_id], boonban: params[:boonban],
                     gyosoo: params[:gyosoo], gwamok: params[:gwamok], 
                     timeplace1: params[:timeplace1], timeplace2: params[:timeplace2],
                     timeplace3: params[:timeplace3], timeplace4: params[:timeplace4], rhoonjang: ahnroon)
                    
                     
    redirect_to search_path
    end
    
    def individual
       
        
    end
    
    def search
        @gwamoks = Crawl.where(:gyosoo => params[:q])
        @mygwamoks=Usergwamok.where(user_id:current_user.id)
        render :layout => false
    end
    
    def searchresult

         @gwamokfind = Crawl.where("gwamok LIKE '%#{params[:gwamok]}%'")
    end
    
    def searchresult2
        @gyosoofind = Crawl.where("gyosoo LIKE '%#{params[:gyosoo]}%'")
        
    end
    def showsigan
    end
    

    def tt
         @mygwamoks=Usergwamok.all
    end
    
   
end