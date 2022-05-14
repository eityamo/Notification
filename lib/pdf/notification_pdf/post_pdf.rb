module NotificationPdf
  class PostPdf < Prawn::Document
    def initialize(record)
      # 新規PDF作成
      super(page_size: "A4")
      # 座標を表示
      # stroke_axis

      create_title
      create_header
      create_contents
      create_form(record)
      create_footer
    end

    def create_title
      font "app/assets/fonts/SourceHanSans-Heavy.ttc"
      text_box "反抗期届", at: [0, 700], align: :center, size: 40
    end

    def create_header
      font "app/assets/fonts/SourceHanSans-Bold.ttc"
      text_box I18n.l(Date.current, format: :long), at: [350, 640], size: 12
      text_box "私は下記の期間、反抗的な態度を取ることを届け出ます", at: [100, 620], size: 12
    end

    def create_contents
      font "app/assets/fonts/SourceHanSans-Bold.ttc"
      text_box "氏名", at: [70, 550], size: 12
      text_box "期間", at: [70, 490], size: 12
      text_box "から", at: [350, 490], size: 12
      text_box "まで", at: [350, 460], size: 12
      text_box "親の呼び名", at: [70, 400], size: 12
      text_box "朝起こす", at: [130, 320], size: 12
      text_box "部屋掃除", at: [130, 270], size: 12
      text_box "備考", at: [70, 150], size: 12
    end

    def create_form(record)
      font "app/assets/fonts/SourceHanSans-Light.ttc"
      text_box "#{record.myname}", at: [0, 550], align: :center, size: 12
      text_box "(#{record.old}歳)", at: [400, 550], size: 12
      text_box "#{I18n.l(record.fromdate, format: :long)}", at: [200, 490], size: 12
      text_box "#{I18n.l(record.todate, format: :long)}", at: [200, 460], size: 12
      text_box "#{record.yourname}", at: [0, 400], align: :center, size: 12
      text_box "#{record.getup}", at: [0, 320], align: :center, size: 12
      text_box "#{record.cleanup}", at: [0, 270], align: :center, size: 12
      bounding_box([115, 148], width: 312, height: 60) do
        text_box "#{record.remark}", size: 12
      end
    end

    def create_footer
      font "app/assets/fonts/SourceHanSans-Bold.ttc"
      text_box "※ 大人の干渉が少なくなるにつれ、これまで以上に自己管理に努めること", at: [100, 70], size: 10
      text_box "※ 期間短縮延長可", at: [100, 60], size: 10
    end
  end
end