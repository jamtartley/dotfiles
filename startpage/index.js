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
        ]
    },
    {
        "header": "programming",
        "links": [
            { "text": "apple dev console", "address": "https://itunesconnect.apple.com" },
            { "text": "google dev console", "address": "https://play.google.com/apps/publish" },
            { "text": "github", "address": "https://github.com/jamtartley" },
            { "text": "aws", "address": "https://aws.amazon.com" }
        ]
    },
    {
        "header": "sport",
        "links": [
            { "text": "football", "address": "https://www.bbc.com/sport/football" },
            { "text": "pj_buckingham", "address": "https://twitter.com/PJBuckingham" }
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

let root = document.getElementById("sections");

sortAlphabeticallyByProperty(data, "header");

for (let section of data) {
    let sectionRoot = document.createElement("div");
    sectionRoot.classList.add("section");

    sectionRoot.appendChild(getTitleElement(section.header));

    let linkContainer = document.createElement("div");
    linkContainer.classList.add("links");

    sortAlphabeticallyByProperty(section.links, "text");

    for (let link of section.links) {
        linkContainer.appendChild(getLinkElement(link));
    }

    sectionRoot.appendChild(linkContainer);
    root.appendChild(sectionRoot);
}

function getTitleElement(title) {
    let elem = document.createElement("span");
    elem.classList.add("header");
    elem.innerText = "[" + title + "]";

    return elem;
}

function getLinkElement(link) {
    var anchor = document.createElement("a");
    anchor.setAttribute("href", link.address);
    anchor.classList.add("link");
    anchor.innerText = link.text.replace(" ", "_");

    return anchor;
}

function sortAlphabeticallyByProperty(list, property) {
    list.sort(function(a, b) {
        return a[property].localeCompare(b[property]);
    });
}
