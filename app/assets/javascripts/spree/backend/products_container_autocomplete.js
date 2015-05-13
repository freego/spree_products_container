$(document).ready(function () {
  'use strict';
  var target = $('#products_container_products_select');

  if (target.length > 0) {
    target.select2({
      placeholder: Spree.translations.product_placeholder,
      multiple: true,
      initSelection: function (element, callback) {
        // custom api call to retain relations order
        var object_id = $('#object-id').data('object-id');
        var url = Spree.url('/api/products_containers/' + object_id + '/products?token=' + Spree.api_key);

        return $.getJSON(url, null, function (data) {
          return callback(data['products']);
        });
      },
      ajax: {
        url: Spree.routes.product_search,
        datatype: 'json',
        quietMillis: 300,
        data: function (term, page) {
          return {
            q: {
              product_translation_name_or_variants_including_master_sku_cont: term
            },
            token: Spree.api_key
          };
        },
        results: function (data, page) {
          var products = data.products ? data.products : [];
          return {
            results: products
          };
        }
      },
      formatResult: function (product) {
        return product.name;
      },
      formatSelection: function (product) {
        return product.name;
      }
    });

    target.select2("container")
           .find("ul.select2-choices").sortable({
              containment: 'parent',
              // workaround for disappearing elements
              appendTo: 'body',
              helper: 'clone',
              zIndex: 999,

              start: function() { target.select2("onSortStart"); },
              update: function() { target.select2("onSortEnd"); }
    });
  }
});
