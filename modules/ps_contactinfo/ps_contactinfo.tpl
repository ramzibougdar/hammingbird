{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}

<div class="footer__block block-contact col-md-6 col-lg-3">

  <p class="footer__block__title hidden-on-mobile">{l s='Store information' d='Shop.Theme.Global'}</p>

  <div class="footer__block__toggle hidden-on-desktop collapsed" data-bs-target="#contact-infos" data-bs-toggle="collapse" aria-expanded="false">
    <span class="footer__block__title">{l s='Store information' d='Shop.Theme.Global'}</span>
    <i class="material-icons">arrow_drop_down</i>
  </div>

  <div id="contact-infos" class="footer__block__content footer__block__content-contact collapse">

    <div class="contact__infos">
      {$contact_infos.address.formatted nofilter}
    </div>

    {if $contact_infos.phone}
      <div class="contact__phone">
        <i class="material-icons">phone</i>
        <a href="tel:{$contact_infos.phone}">{$contact_infos.phone}</a>
      </div>
    {/if}

    {if $contact_infos.fax}
      <div class="contact__fax">
        <i class="material-icons">fax</i>
        <a href="fax:{$contact_infos.fax}">{$contact_infos.fax}</a>
      </div>
    {/if}
  </div>
</div>
