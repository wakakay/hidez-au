<?php  
class ControllerModuleNews extends Controller {
	protected function index($setting) {
		$this->language->load('module/news');
		$this->load->model('extension/news');
		
		$data = array(
			'page' => 1,
			'limit' =>2,
			'start' => 0,
			'category' => $setting['category'],
			'items' => $setting['items']
		);
	 
		$this->data['heading_title'] = $this->language->get('heading_title');
	 
		$all_news = $this->model_extension_news->getAllNews2($data);
	 
		$this->data['all_news'] = array();
	 
		foreach ($all_news as $news) {
			$this->data['all_news'][] = array (
				'title' => $news['title'],
				'subtit' => $news['subtit'],
				'newsIntroduction' => $news['newsIntroduction'],
				'images' => $news['images'],
				'category' => $news['category'],
				'description' => (strlen(strip_tags(html_entity_decode($news['description']))) > 50 ? substr(strip_tags(html_entity_decode($news['description'])), 0, 50) . '...' : strip_tags(html_entity_decode($news['description']))),
				'view' => $this->url->link('information/news/news', 'news_id=' . $news['news_id']),
				'date_added' => date('d M Y', strtotime($news['date_added']))
			);
		}
	 
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/news.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/news.tpl';
		} else {
			$this->template = 'default/template/module/news.tpl'; 
		}
		
		$this->render();
	}
}

?>