const data = [
    {
        "header": "misc",
        "links": [
            { "text": "arch wiki", "address": "https://archlinux.org" },
            { "text": "amazon", "address": "https://amazon.co.uk" },
        ]
    },
    {
        "header": "video",
        "links": [
            { "text": "j blow", "address": "https://www.twitch.tv/naysayer88/videos?filter=archives&sort=time" },
            { "text": "luke smith", "address": "https://www.youtube.com/channel/UC2eYFnH61tmytImy1mTYvhA/videos" },
            { "text": "distro tube", "address": "https://www.youtube.com/channel/UCVls1GmFKf6WlTraIb_IaJg/videos" },
            { "text": "thomas brush", "address": "https://www.youtube.com/user/thomasmbrush/videos" },
        ]
    },
    {
        "header": "reddit",
        "links": [
            { "text": "unixporn", "address": "https://reddit.com/r/unixporn" },
            { "text": "csgo", "address": "https://reddit.com/r/globaloffensive" },
            { "text": "soccer", "address": "https://reddit.com/r/soccer" },
            { "text": "linux", "address": "https://reddit.com/r/linux" },
            { "text": "programming", "address": "https://reddit.com/r/programming" },
            { "text": "gamedev", "address": "https://reddit.com/r/gamedev" },
            { "text": "fedora", "address": "https://reddit.com/r/fedora" },
            { "text": "unity2d", "address": "https://reddit.com/r/unity2d" },
            { "text": "unity3d", "address": "https://reddit.com/r/unity3d" },
            { "text": "mk", "address": "https://reddit.com/r/mechanicalkeyboards" },
        ]
    },
    {
        "header": "dev",
        "links": [
            { "text": "apple", "address": "https://itunesconnect.apple.com" },
            { "text": "google", "address": "https://play.google.com/apps/publish" },
            { "text": "github", "address": "https://github.com/jamtartley" },
            { "text": "gitlab", "address": "https://gitlab.com/jamtartley" },
            { "text": "aws", "address": "https://aws.amazon.com" }
        ]
    },
    {
        "header": "sport",
        "links": [
            { "text": "bbc football", "address": "https://www.bbc.com/sport/football" },
            { "text": "pj buckingham", "address": "https://twitter.com/PJBuckingham" },
            { "text": "bbc snooker", "address": "https://www.bbc.com/sport/snooker" },
            { "text": "world snooker", "address": "http://www.worldsnooker.com" },
            { "text": "live snooker scores", "address": "http://livescores.worldsnookerdata.com" }
        ]
    },
    {
        "header": "news",
        "links": [
            { "text": "guardian", "address": "https://www.theguardian.com/uk" },
            { "text": "bbc news", "address": "https://www.bbc.co.uk/news" }
        ]
    }
];

const colours = [
    "#FF6E67",
    "#5AF78E",
    "#F4F99D",
    "#CAA9FA",
    "#FF92D0",
    "#9AEDFE"
].sort((a, b) => { return Math.random() > 0.5 ? 1 : -1; });

let root = document.getElementById("sections");

sortAlphabeticallyByProperty(data, "header");

data.forEach((section, idx) => {
    let sectionRoot = document.createElement("div");
    sectionRoot.classList.add("section");
    sectionRoot.classList.add("animate-slide-in");
    sectionRoot.style.borderLeft = "8px solid " + getColourForIndex(idx);
    sectionRoot.style.setProperty("--animation-time", 0.1 + (0.05 * idx) + "s");

    sectionRoot.appendChild(getTitleElement(section.header, idx));

    let linkContainer = document.createElement("div");
    linkContainer.classList.add("links");

    sortAlphabeticallyByProperty(section.links, "text");

    for (let link of section.links) {
        linkContainer.appendChild(getLinkElement(link));
    }

    sectionRoot.appendChild(linkContainer);
    root.appendChild(sectionRoot);
});

function getTitleElement(title, i) {
    let elem = document.createElement("span");
    elem.classList.add("header");
    elem.innerText = "[" + title + "]";
    elem.style.color = getColourForIndex(i);

    return elem;
}

function getLinkElement(link) {
    var anchor = document.createElement("a");
    anchor.setAttribute("href", link.address);
    anchor.classList.add("link");
    anchor.innerText = link.text.replace(/ /g, "_");

    return anchor;
}

function sortAlphabeticallyByProperty(list, property) {
    list.sort((a, b) => {
        return a[property].localeCompare(b[property]);
    });
}

function getColourForIndex(i) {
    return colours[i % colours.length];
}
