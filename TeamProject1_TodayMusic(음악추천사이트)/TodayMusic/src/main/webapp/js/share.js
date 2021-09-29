const url = 'https://twelvelovetype.netlify.app/';

function setShare(){
  var resultImg = document.querySelector('#resultImg');
  var resultAlt = resultImg.firstElementChild.alt;
  const shareTitle = '노래 취향 테스트';
  const shareDes = infoList[resultAlt].name;
  const shareImage = url + 'img/image-' + resultAlt + '.jpg';
  const shareURL = url + 'page/result-' + resultAlt + '.html';
  
}