{*
* 2007-2019 PrestaShop
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2018 PrestaShop SA
* @license   http://addons.prestashop.com/en/content/12-terms-and-conditions-of-use
* International Registered Trademark & Property of PrestaShop SA
*}
{if $ps_version} {*if ps is 1.7*}
    <a class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="identity-link" href="{$link->getModuleLink('pssocialconnect', 'socialconnect')}">
        <span class="link-item">
            <i class="material-icons">link</i> {l s='Linked Accounts' mod='pssocialconnect'}
        </span>
    </a>
{else} {*if ps is 1.6*}
    <li>
        <a href="{$link->getModuleLink('pssocialconnect', 'socialconnect')}" title="{l s='Linked Accounts' mod='pssocialconnect'}">
            <i class="icon-unlink"></i>
            <span>{l s='Linked Accounts' mod='pssocialconnect'}</span>
        </a>
    </li>
{/if}