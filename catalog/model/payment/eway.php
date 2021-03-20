<?php
class ModelPaymentEway extends Model {
  	public function getMethod($address) {
		$this->load->language('payment/eway');

		if ($this->config->get('eway_status')) {
			$status = TRUE;
      	} else {
			$status = FALSE;
		}

		$method_data = array();
		if ($status) {
      		$method_data = array(
        		'code'         => 'eway',
        		'title'      => $this->language->get('text_title'),
				'sort_order' => $this->config->get('eway_sort_order')
      		);
    	}

    	return $method_data;
  	}
}
?>