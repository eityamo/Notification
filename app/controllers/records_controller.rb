class RecordsController < ApplicationController
  def new
    @record = RecordsForm.new
  end

  def create
    @record = RecordsForm.new(record_params)
    @record.stamp = @record.stamp.length == 4 ? vertical(@record.stamp) : @record.stamp
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

  def terms; end

  def privacy_policy; end

  private

  def record_params
    params.require(:records_form).permit(:myname, :stamp, :old, :fromdate, :todate, :yourname, :getup, :cleanup, :remark)
  end

  def vertical(stamp)
      part = stamp.split('')
      part[2]+part[0]+part[3]+part[1]
  end
end
