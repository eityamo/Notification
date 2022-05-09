class RecordsController < ApplicationController
  def new
    @record = RecordsForm.new
  end

  def create
    @record = RecordsForm.new(record_params)
    if @record.valid?
    post_pdf = NotificationPdf::PostPdf.new(@record).render
      send_data post_pdf,
        filename: 'post_pdf.pdf',
        type: 'application/pdf',
        disposition: 'inline' #PDFをブラウザ上に出力　外すとダウンロード
    else
      render :new
    end
  end

  private

  def record_params
    params.require(:records_form).permit(:myname, :old, :fromdate, :todate, :yourname, :getup, :cleanup, :remark)
  end
end
