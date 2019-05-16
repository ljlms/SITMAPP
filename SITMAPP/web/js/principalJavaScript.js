/*====================================
*     Vars
======================================*/
// links of pages
// data-link="foo" show data-section="foo"

var links = Array.prototype.slice.call(
   document.querySelectorAll('[data-link]')),
    sections = Array.prototype.slice.call(
  document.querySelectorAll('[data-section]'));
// menu vars
var menu = d('.menu').querySelector('ul'),
    menuBtn = d('.toggle_menu');

/*====================================
*     window load
======================================*/
window.addEventListener('load',init,false);
/*====================================
*     Short Selector
======================================*/
function d(el){
  if(el) return document.querySelector(el);
}
/*====================================
*     Init app
======================================*/
function init(){
  // first time active home
  d('[data-section="home"]').classList.add('show-section');
  d('[data-link="home"]').classList.add('active');

  try{
    loader();
    navigation();
    lightModal();
    toggleSections();
  }catch(e){
    alert(e);
  }
}

/*====================================
*     Toggle sections
======================================*/
function toggleSections(){
  Array.prototype.forEach.call(links,function(o,i){
    o.addEventListener('click',function(e){
      var section = d('[data-section="'+this.getAttribute('data-link')+'"]');
      e.preventDefault();
      removeLinks(function(){
        o.classList.add('active');
        section.classList.add('show-section');
        menu.classList.toggle('show_menu');
        if(menu.classList.contains('show_menu')){
          menuBtn.innerHTML = '<i class="fa fa-close"></i>';
        }else{
          menuBtn.innerHTML = '<i class="fa fa-navicon"></i>';
        }
      });
    });
  });
}


/*===========================================
*     Remove active and show-section classes
=============================================*/
function removeLinks(_success){
  Array.prototype.forEach.call(links,function(o,i){
    o.classList.remove('active');});
  Array.prototype.forEach.call(sections,function(o,i){
   o.classList.remove('show-section');
  });
  if(_success()) return _success();
}


/*====================================
*     Menu
======================================*/
function navigation(){
  menuBtn.addEventListener('click',function(){
    menu.classList.toggle('show_menu');
    if(menu.classList.contains('show_menu')){
      menuBtn.innerHTML = '<i class="fa fa-close"></i>';
    }else{
      menuBtn.innerHTML = '<i class="fa fa-navicon"></i>';
    }
  });
}


/*====================================
*     Custom LightModal
======================================*/
function lightModal(){
  var links = document.querySelectorAll('.lightCustom'),
  arrayOfLinks = Array.prototype.slice.call(links);
  Array.prototype.forEach.call(arrayOfLinks, function (obj, index) {
    obj.addEventListener('click', function (e) {
        e.preventDefault();
        var title = obj.title ? obj.title : '...';
        d('.lightModal').classList.add('show');
        d('.lightModal-title').innerHTML = title;
        d('.lightModal-image').src = obj.href;
        d('.lightModal-image').alt = title;
    });
    d('.lightModal-close').addEventListener('click', function (e) {
        e.preventDefault();
        d('.lightModal').classList.remove('show');
        d('.lightModal-title').innerHTML = '';
        d('.lightModal-image').src = '';
        d('.lightModal-image').alt = '';
    });
  });
}

/*====================================
*     Loader
======================================*/
function loader(_success) {

    var obj = document.createElement('div');
    obj.className = 'preloader';

    var inner = document.createElement('div');
    inner.className = 'preloader_inner';

    d('.wrapper').appendChild(obj);
    obj.appendChild(inner);

    obj.classList.add('show');
    var w = 0,
        t = setInterval(function() {
            w = w + 1;
            inner.textContent = w+'%';
            if (w === 100){
                obj.classList.remove('show');
                clearInterval(t);
                w = 0;
                obj.remove();
                if (_success){
                    return _success();
                }
            }
        }, 20);
}
