 const tg = window.Telegram.WebApp;
 const initData = tg.initData;
 const user = tg.initDataUnsafe.user;

 console.log(tg);
 console.log(initData);
 console.log(user);

window.state = {
    userData: JSON.stringify(user)
}