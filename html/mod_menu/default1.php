<?php
/**
 * @version		$Id: default.php 882 2013-01-07 11:53:44Z dhorsfall $
 * @package		Joomla.Site
 * @subpackage	mod_menu
 * @copyright	Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access.
defined('_JEXEC') or die;
$app = JFactory::getApplication();


$ob->parameters->active_id=$active->id;
$ob->rows=$list;

$XML = new DOMDocument();
$XML->loadXml( generate_valid_xml_from_array($ob));	

/*$parameters     = $XML->createElement("parameters");
$active = $XML->createElement("active_id");
$value = $XML->createTextNode($active_id);
$active->appendChild($value);
$parameters->appendChild($active);
$XML->firstChild->appendChild($parameters);
*/

//echo $XML->saveXML();
//die;
$xslt = new XSLTProcessor(); 
$XSL = new DOMDocument(); 


$dir =  substr(__FILE__,0,-strlen(substr(strrchr(__FILE__, "/"), 1)));
$XSL->load($dir.'/menu.xsl', LIBXML_NOCDATA); 
$xslt->importStylesheet( $XSL ); 
#PRINT 
print $xslt->transformToXML( $XML ); 



function generate_xml_from_array($array, $node_name) {
	$xml = '';

	if (is_array($array) || is_object($array)) {
		foreach ($array as $key=>$value) {
			if (is_numeric($key)) {
				$key = $node_name;
			}

			$xml .= '<' . $key . '>' . generate_xml_from_array($value, $node_name) . '</' . $key . '>';
		}
	} else {
		$xml = htmlspecialchars($array, ENT_QUOTES) ;
	}

	return $xml;
}

function generate_valid_xml_from_array($array, $node_block='root', $node_name='row') {
	$xml = '<?xml version="1.0" encoding="UTF-8" ?>' . "\n";

$xml .= '<' . $node_block . '>' . "\n";
$xml .= generate_xml_from_array($array, $node_name);
$xml .= '</' . $node_block . '>' . "\n";

return $xml;
}
?>