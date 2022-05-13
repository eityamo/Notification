module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'とどけ、反抗期'

    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def default_meta_tags
    {
      site: '反抗期届',
      title: 'とどけ、反抗期',
      reverse: true,
      separator: '|',
      description: '反抗期を宣言する届出(反抗期届)をPDFで作成してくれるアプリ',
      keywords: '反抗期',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('ogp.png') },
        { href: image_url('ogp.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'img/png' },
      ],
      og: {
        site_name: '反抗期届',
        title: 'とどけ、反抗期',
        description: '反抗期を宣言する届出(反抗期届)をPDFで作成してくれるアプリ', 
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
