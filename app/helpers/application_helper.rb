module ApplicationHelper
  def full_title(page_title = '')
    base_title = I18n.t('defaults.title')

    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def default_meta_tags
    {
      site: I18n.t('defaults.site'),
      title: I18n.t('defaults.title'),
      reverse: true,
      separator: '|',
      description: I18n.t('defaults.description'),
      keywords: [
        '反抗期',
        '反抗期届',
        'ソフト',
        'PDF',
        '届け、反抗期',
        'REBELLION NOTICE',
        'LITTLE REBELLION',
        'notification',
        'a rebellion period',
        '叛乱通知'
      ], 
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('children_crossing.png') },
        { href: image_url('children_crossing.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'img/png' },
      ],
      og: {
        site_name: I18n.t('defaults.site'),
        title: I18n.t('defaults.title'),
        description: I18n.t('defaults.description'), 
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@eityamo',
      }
    }
  end
end
