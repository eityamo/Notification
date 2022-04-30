class PostPdfController < ApplicationController
  def index
    respond_to do |format| #pdf形式の出力処理
      format.pdf do
        post_pdf = NotificationPdf::PostPdf.new().render #インスタンス生成してPDF出力準備
        send_data post_pdf,
          filename: 'post_pdf.pdf',
          type: 'application/pdf',
          disposition: 'inline' #PDFをブラウザ上に出力　外すとダウンロード
      end
    end
  end
end