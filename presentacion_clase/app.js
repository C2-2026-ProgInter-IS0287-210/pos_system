const documents = {
    plan: document.getElementById('md-plan').textContent,
    guia: document.getElementById('md-guia').textContent
};

// Configure Marked to use Highlight.js
marked.setOptions({
    highlight: function(code, lang) {
        if (lang && hljs.getLanguage(lang)) {
            return hljs.highlight(code, { language: lang }).value;
        }
        return hljs.highlightAuto(code).value;
    }
});

// Function to process GitHub Alerts in Markdown before parsing
function processGitHubAlerts(markdown) {
    if (!markdown) return '';
    // Regex for > [!WARNING], > [!IMPORTANT], > [!CAUTION], > [!NOTE]
    const alertRegex = /> \[!(\w+)\]\n(> .*\n?)+/g;
    
    return markdown.replace(alertRegex, (match) => {
        const type = match.match(/\[!(\w+)\]/)[1].toLowerCase();
        let content = match.replace(/> \[!\w+\]\n/, '');
        content = content.replace(/^> /gm, ''); // Remove the blockquote arrows
        
        return `<div class="alert-${type}">\n\n${content}\n\n</div>`;
    });
}

const contentContainer = document.getElementById('content-container');
const navButtons = document.querySelectorAll('.nav-btn');

function renderDocument(docId) {
    if (!Object.hasOwn(documents, docId)) {
        console.error('Document ID not found:', docId);
        return;
    }

    // Add fade-out effect briefly for transition
    contentContainer.style.opacity = 0;
    
    setTimeout(() => {
        const rawMarkdown = documents[docId];
        const processedMarkdown = processGitHubAlerts(rawMarkdown);
        const unsafeHtml = marked.parse(processedMarkdown);
        
        // Use DOMPurify to sanitize HTML output to prevent XSS vulnerabilities
        const cleanHtml = DOMPurify.sanitize(unsafeHtml);
        
        contentContainer.innerHTML = cleanHtml;
        
        // Reset scroll and fade-in
        const contentWrapper = document.querySelector('.content-wrapper');
        if (contentWrapper) {
            contentWrapper.scrollTop = 0;
        }
        contentContainer.style.opacity = 1;
    }, 200);
}

// Event Listeners for navigation
navButtons.forEach(btn => {
    btn.addEventListener('click', () => {
        // Remove active class from all
        navButtons.forEach(b => b.classList.remove('active'));
        // Add active class to clicked
        btn.classList.add('active');
        
        const docId = btn.getAttribute('data-doc');
        renderDocument(docId);
    });
});

// Initial render
renderDocument('plan');
