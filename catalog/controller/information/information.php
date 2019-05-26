<?php 
class ControllerInformationInformation extends Controller {
	public function index() {  
    	$this->language->load('information/information');
		
		$this->load->model('catalog/information');
		
		$this->data['breadcrumbs'] = array();
		
      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	);
		
		if (isset($this->request->get['information_id'])) {
			$information_id = (int)$this->request->get['information_id'];
		} else {
			$information_id = 0;
		}
		
		$information_info = $this->model_catalog_information->getInformation($information_id);
   		
		if ($information_info) {
	  		$this->document->setTitle($information_info['title']); 

      		$this->data['breadcrumbs'][] = array(
        		'text'      => $information_info['title'],
				'href'      => $this->url->link('information/information', 'information_id=' .  $information_id),      		
        		'separator' => $this->language->get('text_separator')
      		);		
						
      		$this->data['heading_title'] = $information_info['title'];
      		
      		$this->data['button_continue'] = $this->language->get('button_continue');
			
			 $video_change = array('&lt;vcastr&gt;&lt;/cke:param&gt;&lt;channel&gt;&lt;item&gt;',
		 					   '&lt;source&gt;','&lt;/source&gt;',
							   '&lt;duration&gt;&lt;/duration&gt;',
							   '&lt;title&gt;&lt;/title&gt;',
							   '&lt;/item&gt;&lt;/channel&gt;',
							   '&lt;config&gt;&lt;/config&gt;',
							   '&lt;plugIns&gt;&lt;logoPlugIn&gt;',
							   '&lt;url&gt;','&lt;/url&gt;',
							   '&lt;logoText&gt;','&lt;/logoText&gt;',
							   '&lt;logoTextAlpha&gt;0.75&lt;/logoTextAlpha&gt;',
							   '&lt;logoTextFontSize&gt;20&lt;/logoTextFontSize&gt;',
							   '&lt;logoTextLink&gt;','&lt;/logoTextLink&gt;',
							   '&lt;controlPanelBgColor&gt;','&lt;/controlPanelBgColor&gt;',
							   '&lt;controlPanelBtnColor&gt;','&lt;/controlPanelBtnColor&gt;',
							   '&lt;contralPanelBtnGlowColro&gt;','&lt;/contralPanelBtnGlowColro&gt;',
							   '&lt;isAutoPlay&gt;','&lt;/isAutoPlay&gt;',
							   '&lt;isLoadBegin&gt;true&lt;/isLoadBegin&gt;',
							   '&lt;scaleMode&gt;showAll&lt;/scaleMode&gt;',
							   '&lt;isRepeat&gt;false&lt;/isRepeat&gt;',
							   '&lt;textMargin&gt;10 10 auto auto&lt;/textMargin&gt;',
							   '&lt;/logoPlugIn&gt;',
							   '&lt;/plugIns&gt;',
							   '&lt;/vcastr&gt;');
			
		 $video_original = array('<vcastr><channel><item>',
		 					     '<source>','</source>',
								 '<duration></duration>',
								 '<title></title>',
								 '</item></channel>',
								 '<config></config>',
								 '<plugIns><logoPlugIn>',
								 '<url>','</url>',
								 '<logoText>','</logoText>',
								 '<logoTextAlpha>0.75</logoTextAlpha>',
								 '<logoTextFontSize>20</logoTextFontSize>',
								 '<logoTextLink>','</logoTextLink>',
								 '<controlPanelBgColor>','</controlPanelBgColor>',
								 '<controlPanelBtnColor>','</controlPanelBtnColor>',
							     '<contralPanelBtnGlowColro>','</contralPanelBtnGlowColro>',
							     '<isAutoPlay>','</isAutoPlay>',
							     '<isLoadBegin>true</isLoadBegin>',
							     '<scaleMode>showAll</scaleMode>',
								 '<isRepeat>false</isRepeat>',
								 '<textMargin>10 10 auto auto</textMargin>',
								 '</logoPlugIn>',
								 '</plugIns>',
								 '</vcastr>');
			
			$this->data['description'] = html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8');
			
			$this->data['description'] = str_replace($video_change,$video_original,$this->data['description']);
      		
			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/information.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/information/information.tpl';
			} else {
				$this->template = 'default/template/information/information.tpl';
			}
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);
						
	  		$this->response->setOutput($this->render());
    	} else {
      		$this->data['breadcrumbs'][] = array(
        		'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('information/information', 'information_id=' . $information_id),
        		'separator' => $this->language->get('text_separator')
      		);
				
	  		$this->document->setTitle($this->language->get('text_error'));
			
      		$this->data['heading_title'] = $this->language->get('text_error');

      		$this->data['text_error'] = $this->language->get('text_error');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      		$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);
					
	  		$this->response->setOutput($this->render());
    	}
  	}
	
	public function info() {
		$this->load->model('catalog/information');
		
		if (isset($this->request->get['information_id'])) {
			$information_id = (int)$this->request->get['information_id'];
		} else {
			$information_id = 0;
		}      
		
		$information_info = $this->model_catalog_information->getInformation($information_id);

		if ($information_info) {
			$output  = '<html dir="ltr" lang="en">' . "\n";
			$output .= '<head>' . "\n";
			$output .= '  <title>' . $information_info['title'] . '</title>' . "\n";
			$output .= '  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' . "\n";
			$output .= '  <meta name="robots" content="noindex">' . "\n";
			$output .= '</head>' . "\n";
			$output .= '<body>' . "\n";
			$output .= '  <h1>' . $information_info['title'] . '</h1>' . "\n";
			$output .= html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8') . "\n";
			$output .= '  </body>' . "\n";
			$output .= '</html>' . "\n";			

			$this->response->setOutput($output);
		}
	}
}
?>