<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ShowChangelogPage
 *
 * @author author XNovaPT Team <xnovaptteam@gmail.com>
 */
class ShowChangelogPage extends AbstractGamePage
{
    function __construct()
    {
        parent::__construct();
        $this->tplObj->compile_id = 'changelog';
    }

    function show()
    {
        global $lang, $title;
        includeLang('changelog');
        includeLang('leftmenu');
        
        $this->tplObj->assign(array(
            'title'             => $lang['title_changelog'],
            'Version'           => $lang['Version'],
            'Description'       => $lang['Description'],
            'changelog'         => $lang['changelog'],
        ));
        
        $this->render('changelog.default.tpl');
    }
}

?>