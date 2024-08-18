// ==UserScript==
// @name         Bilibili 3x player (Simplified)
// @namespace    http://tampermonkey.net/
// @version      2024-08-18
// @description  This script is dedicated to making bilibili's player play at 3x the speed
// @author       BLKStone
// @match        https://www.bilibili.com/video/*
// @match        https://www.bilibili.com/list/watchlater*
// @match        https://www.bilibili.com/bangumi/play/*
// @icon         https://www.bilibili.com/favicon.ico
// @run-at       document-end
// @grant        GM_addStyle
// @grant        none
// @license      MIT
// ==/UserScript==


// 等待直到播放器被加载出来
(function (callback) {
    'use strict';

    // 本文件基于 https://greasyfork.org/zh-CN/scripts/462473/ 简化

    const wait = () => setTimeout(() => {
        console.log('[bili player 3x][Timeout] wait');
        if (document.getElementsByClassName('bpx-player-ctrl-playbackrate-menu').length != 0) {
            callback();
            console.log('[bili player 3x][detected] bpx-player-ctrl-playbackrate-menu class');
        } else {
            wait();
        }
    }, 1000);

    wait();
})( () => {

    /**
       * 自定义的速度和快捷键
       */
    const myRateAndShortcuts = [
        // 默认值
        { rate: 0.1, shortcut: '' },
        { rate: 0.2, shortcut: '' },
        { rate: 2.5, shortcut: '' },
        { rate: 3,   shortcut: 'shift+3' },
        { rate: 4,   shortcut: 'shift+4' },
        { rate: 5,   shortcut: 'shift+5' },
        { rate: 10,  shortcut: '' },
    ];
    console.log('[bili player 3x] 倍数及快捷键', myRateAndShortcuts);

    /**
       * dom 上的速度目录元素
       */
    const domRateMenu = document.getElementsByClassName('bpx-player-ctrl-playbackrate-menu')[0];
    /**
     * video 元素
     */
    const domVideoElement = document.querySelector('.bpx-player-video-wrap>video') || document.querySelector('.bpx-player-video-wrap>bwp-video');
    // debug
    console.log('[bili player 3x] Debug: 速度菜单元素 = ', domRateMenu, ', 视频元素 = ', domVideoElement);

    // 要是这俩就是加载不出来就退出程序
    if (!domRateMenu || !domVideoElement) return;


    /**
       * 已存在的速度
       */
    let existRates = [2, 1.5, 1.25, 1, 0.75, 0.5];
    // 添加自定义速度到 dom 上的速度目录
    myRateAndShortcuts.forEach(({ rate }) => {
        // 和 existRates 比较大小, 确定插入的位置
        let existRatesLength = existRates.length;
        // 插入的位置
        let i = 0;
        for (i = 0; i < existRatesLength; i++) {
            // 如果 已添加的速度 比 要添加的速度 小 则就应该在这个下标处增加
            if (existRates[i] < rate) break;
        }
        // 插入
        existRates.splice(i, 0, rate);
        // 创建一个 li
        let newRateNode = document.createElement('li');
        // 添加文字, 整数倍手动添加 ".0"
        newRateNode.innerText = (rate % 1 == 0 ? (rate + '.0') : rate) + 'x';
        // 添加 class
        newRateNode.classList.add('bpx-player-ctrl-playbackrate-menu-item');
        // 按照 b 站格式添加 data-value 属性
        newRateNode.dataset.value = rate;
        // 绑定点击事件
        newRateNode.addEventListener('click', () => {
            // 修改倍数
            domVideoElement.playbackRate = rate;
            // 剩下的添加 "bpx-state-active" class, 改变 "倍数" 处的文本b站好像已经帮我做了, 我就懒得重新写了
        });
        // 添加到 dom 速度列表
        domRateMenu.insertBefore(newRateNode, domRateMenu.children[i]);
    });


    const twoCols = 0;
    // 是否分两栏显示
    if (twoCols) {
        // 根据倍数选项的个数确定分栏高度
        // 倍数选项的个数
        let existRatesLength = existRates.length;
        // 分栏高度
        // 如果倍数选项的个数是奇数则加一把它变成偶数
        // 36 为每个倍数选项的高度 (px)
        let height = ((existRatesLength % 2 == 0) ? existRatesLength : existRatesLength + 1) * 36 / 2;
        // 添加 css
        GM_addStyle(`
            .bpx-player-ctrl-playbackrate.bpx-state-show .bpx-player-ctrl-playbackrate-menu {
                display: flex!important;
            }
            .bpx-player-ctrl-playbackrate-menu {
                display: none;
                flex-direction: column;
                flex-wrap: wrap;
                width: 140px;
                height: ${height}px;
            }
            .bpx-player-ctrl-playbackrate-menu-item {
                width: 70px;
                height: 36px;
            }
        `);
    }


});

