module NotificationPdf
  class PostPdf < Prawn::Document
    def initialize
      # 新規PDF作成
      super(page_size: 'A4')
      # 座標を表示
      stroke_axis
      # font指定
      font 'app/assets/fonts/SourceHanSans-Bold.ttc'

      create_title
      create_header
      create_contents
      create_form
      create_footer
    end

    def create_title
      text_box '反抗期届', at: [0, 700],align: :center, size: 30
    end

    def create_header
      text_box I18n.l(Date.current, format: :long), at: [0, 640], align: :right, size: 12
      text_box '私は下記の期間、反抗的な態度を取ることを届け出ます', at: [100, 620], size: 12
    end

    def create_contents
      text_box '名前', at: [70, 550], size: 12
      text_box '期間', at: [70, 490], size: 12
      text_box '親の呼び名', at: [70, 400], size: 12
      text_box '朝起こす', at: [130, 320], size: 12
      text_box '部屋掃除', at: [130, 270], size: 12
      text_box '注意回数', at: [130, 220], size: 12
      text_box '(この回数超えると反抗することが許容されます)', at: [130, 205], size: 12
      text_box '備考', at: [70, 150], size: 12
    end

    def create_form
      text_box 'サンプルネーム', at: [150, 550], size: 12
      text_box '令和何年何月何日から', at: [150, 490], size: 12
      text_box '令和何年何月何日まで', at: [150, 460], size: 12
      text_box 'サンプルネーム', at: [150, 400], size: 12
      text_box '要　　不要', at: [200, 320], size: 12
      text_box '要　　不要　　適宜相談', at: [200, 270], size: 12
      text_box '何回', at: [200, 220], size: 12
    end

    def create_footer
      text_box '※ 大人の干渉がすくなるにつれ、これまで以上に事故管理に努めること', at: [100, 70], size: 10
      text_box '※ 期間短縮延長可', at: [100, 60], size: 10
    end
  end
end