<?php
if (!defined('__TYPECHO_ROOT_DIR__')) exit;
/**
 * 绚丽彩虹播放器(<a target="_blank" href="http://www.badapple.top">badapple.top</a>)
 * 
 * @package BadApplePlayer 
 * @author 绚丽彩虹&Yonaka
 * @version 1.1
 * @link http://xlch.me
 */
class BadApplePlayer_Plugin implements Typecho_Plugin_Interface
{
    /**
     * 激活插件方法,如果激活失败,直接抛出异常
     * 
     * @access public
     * @return void
     * @throws Typecho_Plugin_Exception
     */
    public static function activate()
    {
        Typecho_Plugin::factory('Widget_Archive')->footer = array('BadApplePlayer_Plugin', 'render');
    }
    
    /**
     * 禁用插件方法,如果禁用失败,直接抛出异常
     * 
     * @static
     * @access public
     * @return void
     * @throws Typecho_Plugin_Exception
     */
    public static function deactivate(){}
    
    /**
     * 获取插件配置面板
     * 
     * @access public
     * @param Typecho_Widget_Helper_Form $form 配置面板
     * @return void
     */
    public static function config(Typecho_Widget_Helper_Form $form)
    {
        /** 分类名称 */
        $name = new Typecho_Widget_Helper_Form_Element_Text('XlchKey', NULL, 'Default', _t('绚丽彩虹播放器Key'), _t('申请Key&歌单管理：<a href="http://www.badapple.top">www.badapple.top</a>'));
        $form->addInput($name);
		
		$name = new Typecho_Widget_Helper_Form_Element_Radio(
            'IsJquery',
            array('Yes' => _t('加载'),'No' => _t('不加载')),
            'Yes',
            _t('是否加载JQuery V2.2.4'),
            _t('如果您的模板/插件内已经内置了，请关闭这里的加载，反之请开启，以免出现未知错误。')
        );
		$form->addInput($name);
		
		$name = new Typecho_Widget_Helper_Form_Element_Radio(
            'IsJqueryMousewheel',
            array('Yes' => _t('加载'),'No' => _t('不加载')),
            'Yes',
            _t('是否加载JQuery-mousewheel V3.1.9'),
            _t('如果您的模板/插件内已经内置了，请关闭这里的加载，反之请开启，以免出现未知错误。')
        );
		$form->addInput($name);
		
		$name = new Typecho_Widget_Helper_Form_Element_Radio(
            'IsFontAwesome',
            array('Yes' => _t('加载'),'No' => _t('不加载')),
            'Yes',
            _t('是否加载Font-Awesome V4.7.0'),
            _t('如果您的模板/插件内已经内置了，请关闭这里的加载，反之请开启，以免出现未知错误。')
        );
		$form->addInput($name);
		
		$name = new Typecho_Widget_Helper_Form_Element_Radio(
            'IsHttps',
            array('Yes' => _t('开启'),'No' => _t('关闭')),
            'No',
            _t('是否开启https支持？'),
            _t('如果您的网站使用https加密，请开启此项。')
        );
		$form->addInput($name);
    }
    
    /**
     * 个人用户的配置面板
     * 
     * @access public
     * @param Typecho_Widget_Helper_Form $form
     * @return void
     */
    public static function personalConfig(Typecho_Widget_Helper_Form $form){}
    
    /**
     * 插件实现方法
     * 
     * @access public
     * @return void
     */
    public static function render(){
		?>
		<!-- Your XlchPlayerKey -->
		<script>XlchKey="<?php echo Typecho_Widget::widget('Widget_Options')->plugin('BadApplePlayer')->XlchKey; ?>";</script>
		
		<?php if(Typecho_Widget::widget('Widget_Options')->plugin('BadApplePlayer')->IsFontAwesome == 'Yes'){ ?>
		<!-- font-awesome 4.2.0 -->
		<link href="//lib.baomitu.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<?php } ?>
		
		<?php if(Typecho_Widget::widget('Widget_Options')->plugin('BadApplePlayer')->IsFontAwesome == 'Yes'){ ?>
		<!-- JQuery 2.2.4 -->
		<script src="//lib.baomitu.com/jquery/2.2.4/jquery.min.js"></script>
		<?php } ?>
		
		<?php if(Typecho_Widget::widget('Widget_Options')->plugin('BadApplePlayer')->IsFontAwesome == 'Yes'){ ?>
		<!-- JQuery-mousewheel 3.1.9 -->
		<script src="//lib.baomitu.com/jquery-mousewheel/3.1.9/jquery.mousewheel.min.js"></script>
		<?php } ?>
		
		<?php if(Typecho_Widget::widget('Widget_Options')->plugin('BadApplePlayer')->IsHttps == 'No'){ ?>
		<!-- Scrollbar -->
		<script src="http://static.badapple.top/BadApplePlayer/js/scrollbar.js"></script>
		<!-- BadApplePlayer -->
		<script src="http://static.badapple.top/BadApplePlayer/Player.js"></script>
		<?php }else{ ?>
		<!-- Scrollbar -->
		<script src="https://static.https.badapple.top/BadApplePlayer/js/scrollbar.js"></script>
		<!-- BadApplePlayer -->
		<script src="https://static.https.badapple.top/BadApplePlayer/Player.js"></script>
		<?php }
    }
}
