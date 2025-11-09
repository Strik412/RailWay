// Minimal client script: show an alert when the button is clicked
document.addEventListener('DOMContentLoaded', function(){
  const btn = document.getElementById('showBtn');
  if(btn){
    btn.addEventListener('click', function(){
      alert('The site is deployed.');
    });
  }
});
