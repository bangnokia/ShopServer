/* global urlForm */

var shopIdproduct;
function addproduct() {

    var url = urlForm + '/product/shop/getlist?1=1&userId=' + $('#dsaccsacsagsagsdwefe').val();
    var datajsonShop = getDataJson(url);

    if (datajsonShop == null) {
        if (confirm("You need to register shop first!")) {
            $('#ShopManagerBtn').click();
        } else {
            $('#ProfileSetting').click();
        }
    } else {
        $('#frm_addproduct_shopId').val(datajsonShop[0].id);
    }
    shopIdproduct = datajsonShop[0].id;
    filepicker.setKey("AM7JvJ8MRpa348OF98wKwz");

//        upload product image
    $('#frm_addproduct_image').click(function () {
        filepicker.pick(
                {
                    mimetype: 'image/*',
                    container: 'window'
                },
                function (res) {
                    $('#frm_addproduct_image').val(res.url);
                    $('.img-preview img').attr('src', res.url);
                }
        );
    });

    //upload for content
    $('#description-img-upload').click(function () {
        filepicker.pick(
                {
                    mimetype: 'image/*',
                    container: 'window'
                },
                function (res) {
                    var img = '<img src="' + res.url + '" />';
                    tinymce.get("textarea-description").execCommand('mceInsertContent', false, img);
                },
                function (FPError) {
                }
        );
    });

    $('#saveForm').bind('click', function () {
        var propObj = {};
        $('.prod-prop').each(function(index, item) {
            propObj[$(this).data('name')] = $(this).val();
        });
        $('#frm_addproduct_property').val(JSON.stringify(propObj));

        do_save_form(urlForm + '/product/create/save', 'frm_addproduct', 'getlistProduct();$("#clearForm").click();');
    });

    $('#clearForm').bind('click', function () {
        clear_form('frm_addproduct', 'shopId');
        tinymce.get("textarea-description").execCommand('mceSetContent', false, '');
    });

    $('#Search').bind('click', function () {
        getlistProduct();
    });

    $('#deleteForm').bind('click', function () {
        if (!confirm('Are you sure?'))
            return;

        if ($('#frm_addproduct_id').val() == '') {
            alert('select product to delete');
            return;
        }
        do_delete_form(urlForm + '/product/create/delete?id=' + $('#frm_addproduct_id').val(), 'getlistProduct();$("#clearForm").click();');
    });

    var url = urlForm + '/admin/brand/getlist?1=1';
    var datajson = getDataJson(url);
    bindingcombo('frm_addproduct_brandId', '', datajson, 'id,name');
    // tree dropdow 
    getTreeCate();
    getlistProduct();
}

function getTreeCate() {
    $("#dropDownButton").jqxDropDownButton({width: 200, height: 25, theme: 'bootstrap'});
    $('#jqxTreeCategory').on('select', function (event) {
        var args = event.args;
        var item = $('#jqxTreeCategory').jqxTree('getItem', args.element);
        var dropDownContent = '<div style="position: relative; margin-left: 3px; margin-top: 5px;">' + item.label + '</div>';
        $("#dropDownButton").jqxDropDownButton('setContent', dropDownContent);
        $('#frm_addproduct_categoryId').val(item.id);
        $.ajax({
            url: urlForm + '/category/getCatProp/' + item.id,
            type: 'GET',
            dataType: 'json',
            success: function(res) {
//                console.log(res);
                $('#prop-list').html(''); //reload;
                var html = '';
                $.each(res, function(index, item) {
                    html += '<label>' + item.name + '</label>';
                    html += '<input data-name="'+item.name+'" type="text" name="prop_'+item.id+'" class="form-control prod-prop"  />';
                });
                $('#prop-list').append(html); //apend new value
            }            
        });

    });

    var url = urlForm + '/admin/category/getlistCAT?1=1';

    var datajson = getDataJson(url);

    if (datajson == null)
        return;

    var arr = new Array();
    if (datajson != null) {
        $.each(datajson, function (index) {
            var item = datajson[index];
            var object = new Object();
            object.id = item.id;
            object.parentId = item.parentId;
            object.text = item.name;
            object.value = item.idCat;
            arr.push(object);
        });
    }
    datajsonTree = JSON.parse(JSON.stringify(arr));

    var source =
            {
                datatype: "json",
                datafields: [
                    {name: 'id'},
                    {name: 'parentId'},
                    {name: 'text'},
                    {name: 'value'}
                ],
                id: 'id',
                localdata: datajsonTree
            };
    var dataAdapter = new $.jqx.dataAdapter(source);
    dataAdapter.dataBind();
    var records = dataAdapter.getRecordsHierarchy('id', 'parentId', 'items', [{name: 'text', map: 'label'}]);

    $('#jqxTreeCategory').jqxTree({source: records, width: 200, theme: 'bootstrap'});
}

function getlistProduct() {
    var url = urlForm + '/product/create/getlist?1=1&Text=' + $('#searchvalue').val() + '&Price=&category=&status=&shopId=' + shopIdproduct;
    var datajson = getDataJson(url);

    if (datajson == null)
        return;

    var source =
            {
                localdata: datajson,
                datatype: "json",
                datafields: [
                    {name: 'id', type: 'string'},
                    {name: 'name', type: 'string'},
                    {name: 'price', type: 'string'},
                    {name: 'createdAt', type: 'string'},
                    {name: 'brandId', type: 'string'},
                    {name: 'status', type: 'string'},
                    {name: 'categoryId', type: 'string'},
                    {name: 'image', type: 'string'},
                    {name: 'shopId', type: 'string'},
                    {name: 'description', type: 'string'}
                ],
                id: 'id'
            };
    var dataAdapter = new $.jqx.dataAdapter(source);
    $("#gridProduct").jqxGrid({
        width: '100%',
        source: dataAdapter,
        pageable: true,
        autoheight: true,
        sortable: true,
        altrows: true,
        enabletooltips: true,
        // editable: true,
        selectionmode: 'singlerow',
        columns: [
            {text: 'shopId', datafield: 'shopId', width: 70, hidden: 'hidden'},
            {text: 'name', datafield: 'name', width: 150},
            {text: 'price', filtertype: 'number', datafield: 'price', width: 100},
            {text: 'createdAt', filtertype: 'date', datafield: 'createdAt', width: 150},
            {text: 'brandId', datafield: 'brandId', width: 70},
            {text: 'status', datafield: 'status', width: 70},
            {text: 'categoryId', datafield: 'categoryId', width: 70},
            {text: 'image', datafield: 'image', width: 200},
            {text: 'id', datafield: 'id', width: 100, hidden: 'hidden'},
            {text: 'description', datafield: 'description', width: 100, hidden: 'hidden'}
        ]
    });

    $('#gridProduct').unbind('rowselect');
    $('#gridProduct').on('rowselect', function (event)
    {
        var args = event.args;
        var rowBoundIndex = args.rowindex;
        var rowData = args.row;

        console.log(rowData);
        bindItemDetailGrid(rowData, 'frm_addproduct');
        $('#frm_addproduct_shopId').val(shopIdproduct);

        tinymce.get("textarea-description").execCommand('mceSetContent', false, rowData.description);

        $('.img-preview img').attr('src', rowData.image);
    });
}