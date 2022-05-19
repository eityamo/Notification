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
      create_stamps(record)
      create_footer
    end

    def create_title
      font "app/assets/fonts/SourceHanSans-Heavy.ttc" do
        text_box "反抗期届", at: [0, 700], align: :center, size: 40
      end
    end

    def create_header
      font "app/assets/fonts/SourceHanSans-Bold.ttc" do
        text_box I18n.l(Date.current, format: :long), at: [350, 640]
        text_box "私は下記の期間、反抗的な態度を取ることを届け出ます", at: [100, 620]
      end
    end

    def create_contents
      font "app/assets/fonts/SourceHanSans-Bold.ttc" do
        text_box "氏名", at: [70, 550]
        text_box "印", at: [350, 550]
        text_box "歳", at: [405, 550]
        text_box "期間", at: [70, 490]
        text_box "から", at: [350, 490]
        text_box "まで", at: [350, 460]
        text_box "親の呼び名", at: [70, 400]
        text_box "朝起こす", at: [70, 320]
        text_box "部屋掃除", at: [70, 270]
        text_box "備考", at: [70, 150]
      end
    end

    def create_form(record)
      font "app/assets/fonts/SourceHanSans-Light.ttc" do
      text_box "#{record.myname}", at: [0, 550], align: :center
        text_box "#{record.old}", at: [390, 550]
        text_box "#{I18n.l(record.fromdate, format: :long)}", at: [200, 490]
        text_box "#{I18n.l(record.todate, format: :long)}", at: [200, 460]
        text_box "#{record.yourname}", at: [0, 400], align: :center
        text_box "要　　不要　　都度相談", at: [0, 320], align: :center
        if record.getup == '要'
          stroke_circle [201, 313], 10
        elsif record.getup == '不要'
          stroke_ellipse [244, 313], 18, 10
        elsif record.getup == '都度相談'
          stroke_ellipse [303, 313], 30, 10
        end
        text_box "要　　不要　　都度相談", at: [0, 270], align: :center
        if record.cleanup == '要'
          stroke_circle [201, 263], 10
        elsif record.cleanup == '不要'
          stroke_ellipse [244, 263], 18, 10
        elsif record.cleanup == '都度相談'
          stroke_ellipse [303, 263], 30, 10
        end
        bounding_box([115, 148], width: 312, height: 60) do
          text_box "#{record.remark}"
        end
      end
    end

    def create_stamps(record)
      create_stamp('approved') do
        font('app/assets/fonts/YujiSyuku-Regular.ttf') do
          if record.stamp.length == 1
            stroke_color 'ce3337'
            fill_color 'ce3337'
            stroke_circle [16, 16], 13
            bounding_box([3, 29], width: 26, height: 26) do
              text_box "#{record.stamp}", at: [4, 23], size: 18
            end
          elsif record.stamp.length == 2
            stroke_color 'ce3337'
            fill_color 'ce3337'
            stroke_circle [16, 16], 16
            bounding_box([8, 32], width: 16, height: 32) do
              text_box "#{record.stamp}", at: [0, 32], size: 16
            end
          elsif record.stamp.length == 3
            stroke_color 'ce3337'
            fill_color 'ce3337'
            stroke_ellipse [12, 14], 12, 20
            bounding_box([6, 31], width: 12, height: 36) do
              text_box "#{record.stamp}", at: [0, 37], size: 12
            end
          elsif record.stamp.length == 4
            image 'app/assets/images/fingerprint.jpg', at: [10, 30], width: 20, height: 30
          end
        end
      end
      stamp_at 'approved', [330, 530]
    end

    def create_footer
      font "app/assets/fonts/SourceHanSans-Bold.ttc" do
      text_box "※ 大人の干渉が少なくなるにつれ、これまで以上に自己管理に努めること", at: [100, 70], size: 10
      text_box "※ 期間短縮延長可", at: [100, 60], size: 10
      end
    end
  end
end