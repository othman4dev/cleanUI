<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>

    {include file="$template/includes/head.tpl"}

    {$headoutput}

</head>
<body data-phone-cc-input="{$phoneNumberInputStyle}" {if $loginpage or $templatefile eq "clientregister"}class="fullpage"{/if}>
{if !$loginpage and $templatefile ne "clientregister"}
{$headeroutput}
<div id="header-holder" class="{if $templatefile != 'homepage'}no-bg-img{/if}">
{if $templatefile == 'homepage'}<div class="globe-bg"></div>{/if}
<section id="header">
    <div class="container header-container">
        {if $assetLogoPath}
            <a href="{$WEB_ROOT}/index.php" class="logo navbar-brand"><h3 class="logo-font">HOLLANDNODE</h3></a>
        {else}
            <a href="{$WEB_ROOT}/index.php" class="navbar-brand"><h3 class="logo-font">HOLLANDNODE</h3></a>
        {/if}
        <div class="navigation-bar">
            <a href="{$WEB_ROOT}/index.php" class="navigation-link navigation-active" id="nav-home">Home</a>
            <a href="{$WEB_ROOT}/index.php?rp=/store" class="navigation-link" id="nav-products">Products</a>
            <a href="{$WEB_ROOT}/clientarea.php?action=services" id="nav-services" class="navigation-link">Services</a>
            <a href="{$WEB_ROOT}/clientarea.php" class="navigation-link" id="nav-client">Client area</a>
            <a href="{$WEB_ROOT}/knowledgebase" class="navigation-link" id="nav-knowledge">knowledgebase</a>
            <a href="{$WEB_ROOT}/about" class="navigation-link" id="nav-about">About Us</a>
        </div>
        {if $loggedin}
            <div class="user-actions">
                <div class="notification-dropdown">
                    <a href="#" data-toggle="popover" id="accountNotifications" data-placement="bottom">
                        <i class="bi bi-bell"></i>
                        {$LANG.notifications}
                        {if count($clientAlerts) > 0}
                            <span class="label label-info">{lang key='notificationsnew'}</span>
                        {/if}
                        <b class="caret"></b>
                    </a>
                    <div id="accountNotificationsContent" class="hidden">
                        <ul class="client-alerts">
                        {foreach $clientAlerts as $alert}
                            <li>
                                <a href="{$alert->getLink()}">
                                    <i class="bi bi-{if $alert->getSeverity() == 'danger'}exclamation-circle{elseif $alert->getSeverity() == 'warning'}exclamation-triangle{elseif $alert->getSeverity() == 'info'}info-circle{else}check-circle{/if}"></i>
                                    <div class="message">{$alert->getMessage()}</div>
                                </a>
                            </li>
                        {foreachelse}
                            <li class="none">
                                {$LANG.notificationsnone}
                            </li>
                        {/foreach}
                        </ul>
                    </div>
                </div>
                <div class="logout-action">
                    <a href="{$WEB_ROOT}/logout.php" class="btn logout-btn">
                        <i class="bi bi-box-arrow-right"></i>
                        {$LANG.clientareanavlogout}
                    </a>
                </div>
            </div>
            <div class="user-actions-mobile">
                <div class="notification-dropdown">
                    <a href="#" data-toggle="popover" id="accountNotifications" data-placement="bottom">
                        <i class="bi bi-bell"></i>
                        {if count($clientAlerts) > 0}
                            <span class="label label-info">{lang key='notificationsnew'}</span>
                        {/if}
                    </a>
                    <div id="accountNotificationsContent" class="hidden">
                        <ul class="client-alerts">
                        {foreach $clientAlerts as $alert}
                            <li>
                                <a href="{$alert->getLink()}">
                                    <i class="bi bi-{if $alert->getSeverity() == 'danger'}exclamation-circle{elseif $alert->getSeverity() == 'warning'}exclamation-triangle{elseif $alert->getSeverity() == 'info'}info-circle{else}check-circle{/if}"></i>
                                    <div class="message">{$alert->getMessage()}</div>
                                </a>
                            </li>
                        {foreachelse}
                            <li class="none">
                                {$LANG.notificationsnone}
                            </li>
                        {/foreach}
                        </ul>
                    </div>
                </div>
                <div class="logout-action">
                    <a href="{$WEB_ROOT}/logout.php" class="btn logout-btn">
                        <i class="bi bi-box-arrow-right"></i>
                    </a>
                </div>
            </div>
        {else}
            <div class="sign-ins">
                <button class="sign-button"><i class="bi bi-person-up"></i>Sign In</button>
                <button class="sign-button"><i class="bi bi-person-add"></i>Sign Up</button>
            </div>
        {/if}
        
    </div>
</section>

{if $templatefile == 'homepage'}
<div id="top-content" class="container-fluid slide-holder">
        <div class="container container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="slide-new">
                        <div class="badge slide-badge">
                            HollandNode
                        </div>
                        <h1 class="slide-big">
                            Dedicated Servers & High-Performance VPS
                        </h1>
                        <p class="slide-small">Start your journey on web hosting with <br>the best in the town.</p>
                        <div class="slide-actions">
                            <button class="slide-primary">Get Started</button>
                            <button class="slide-secondary">Learn More</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="info-banner">
            <div class="info-inner">
                <div class="infos">
                    <p class="info-text">
                        Hurry get your server here at Hollandnode !
                    </p>
                    <p class="info-text">
                        Special discount available now - Limited time offer !
                    </p>
                    <p class="info-text">
                        24/7 Support available for all customers !
                    </p>
                    <p class="info-text">
                        Premium VPS starting from €8.49/month !
                    </p>
                    <p class="info-text">
                        DDoS Protection included with all plans !
                    </p>
                    <p class="info-text">
                        Instant setup - Get started in minutes !
                    </p>
                    <p class="info-text">
                        Cryptocurrency payments accepted !
                    </p>
                    <!-- Duplicate content for seamless loop -->
                    <p class="info-text">
                        Hurry get your server here at Hollandnode !
                    </p>
                    <p class="info-text">
                        Special discount available now - Limited time offer !
                    </p>
                    <p class="info-text">
                        24/7 Support available for all customers !
                    </p>
                    <p class="info-text">
                        Premium VPS starting from €8.49/month !
                    </p>
                    <p class="info-text">
                        DDoS Protection included with all plans !
                    </p>
                    <p class="info-text">
                        Instant setup - Get started in minutes !
                    </p>
                    <p class="info-text">
                        Cryptocurrency payments accepted !
                    </p>
                </div>
            </div>
        </div>
        <img src="{$WEB_ROOT}/templates/{$template}/images/post-it.svg" alt="" class="post-it">
    </div>
{/if}
</div>
{if $templatefile == 'homepage'}
<div class="features container-fluid">
    <div class="section1">
        <img src="{$WEB_ROOT}/templates/{$template}/images/illustration1.svg" alt="" class="section1-img">
        <div class="section1-texts">
            <div class="part1">
                <h2 class="section1-title">Host your site easily on our VPS & RDP</h2>
                <p class="section1-description">Our servers are built to fit your needs — perfect for hosting websites reliably, securely, and with full control.</p>
            </div>
            <div class="part2">
                <div class="feature">
                    <img src="{$WEB_ROOT}/templates/{$template}/images/apps.svg" alt="">
                    <p>Host websites and apps</p>
                </div>
                <div class="feature">
                    <img src="{$WEB_ROOT}/templates/{$template}/images/robot.svg" alt="">
                    <p>Run automation or scripts 24/7</p>
                </div>
                <div class="feature">
                    <img src="{$WEB_ROOT}/templates/{$template}/images/tools.svg" alt="">
                    <p>Manage private servers or tools</p>
                </div>
            </div>
        </div>
    </div>
    <div class="divider-150"></div>
    <div class="section2">
        <div class="section2-texts">
            <h1 class="section2-title">
                Experience the Power of HollandNode
            </h1>
            <p class="section2-description">At HollandNode.com, discover premium hosting services — with more coming soon!</p>
        </div>
        <div class="section2-features">
            <div class="section2-feature">
                <img src="{$WEB_ROOT}/templates/{$template}/images/support.svg" alt="">
                <h4>24/7 Support</h4>
                <p>Get expert help anytime, day or night, whenever you need it.</p>
            </div>
            <div class="section2-feature">
                <img src="{$WEB_ROOT}/templates/{$template}/images/encryption.svg" alt="">
                <h4>Encryption</h4>
                <p>Your data stays protected with advanced, end-to-end encryption.</p>
            </div>
            <div class="section2-feature">
                <img src="{$WEB_ROOT}/templates/{$template}/images/anonymous.svg" alt="">
                <h4>Anonymous</h4>
                <p>Stay private with no personal info and crypto payment options.</p>
            </div>
            <div class="section2-feature">
                <img src="{$WEB_ROOT}/templates/{$template}/images/performance.svg" alt="">
                <h4>Performance</h4>
                <p>High-speed servers built for reliability, speed, and smooth operation.</p>
            </div>
        </div>
    </div>
    <div class="divider-150"></div>
    <div class="section3">
        <div class="left">
            <h2 class="question">
                Why Choose HollandNode?
            </h2>
            <div class="left-flex">
                <div class="answer">
                    <h1 class="answer-text">
                        1,200+
                    </h1>
                    <p class="answer-desc">Weekly New Users</p>
                </div>
                <div class="answer">
                    <h1 class="answer-text purple">
                        100%
                    </h1>
                    <p class="answer-desc">Satisfaction Rate</p>
                </div>
            </div>
            <img src="{$WEB_ROOT}/templates/{$template}/images/growing.svg" alt="">
        </div>
        <div class="right">
            <div class="right-feature">
                <img src="{$WEB_ROOT}/templates/{$template}/images/speed.svg" alt="">
                <div class="right-feature-text">
                    <h4>High speed and performance</h4>
                    <p>Experience blazing-fast VPS and RDP servers optimized for peak performance.</p>
                </div>
            </div>
            <div class="right-feature">
                <img src="{$WEB_ROOT}/templates/{$template}/images/secure.svg" alt="">
                <div class="right-feature-text">
                    <h4>Security at hand with data encryption</h4>
                    <p>Your data is protected with advanced encryption and strict privacy standards.</p>
                </div>
            </div>
            <div class="right-feature">
                <img src="{$WEB_ROOT}/templates/{$template}/images/incognito.svg" alt="">
                <div class="right-feature-text">
                    <h4>Stay anonymous by paying with crypto</h4>
                    <p>Pay with cryptocurrency for full privacy and complete peace of mind.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="divider-150"></div>
    <div class="section4" id="products">
        <h3 class="pricing">Pricing</h3>
        <h1 class="pricing-sub">Simple Transparent Pricing</h1>
        <p class="pricing-desc">Choose the plan that best suits your business needs.</p>
        <div class="plans">
            <div class="plan">
                <img src="{$WEB_ROOT}/templates/{$template}/images/basic.svg" alt="">
                <h4 class="plan-title">
                    Starter Plan
                </h4>
                <h3 class="plan-price">€8.49</h3>
                <p class="plan-small">per month</p>
                <div class="plan-features">
                    <ul>
                        <li>Virtualization: KVM</li>
                        <li>CPU: 4 x Intel® Xeon® Gold 6142</li>
                        <li>RAM: 12 GB DDR4 ECC</li>
                        <li>Storage: 100 GB NVMe SSD</li>
                        <li>Bandwidth: 1 Gbps unmetered</li>
                        <li>DDoS Protection: Layer 3-4</li>
                        <li>Setup: Instant</li>
                    </ul>
                </div>
                <button class="plan-btn">Get Started</button>
                <p class="plan-final">Perfect for personal use or testing</p>
            </div>
            <div class="plan">
                <img src="{$WEB_ROOT}/templates/{$template}/images/pro.svg" alt="">
                <h4 class="plan-title">
                    Standard Plan
                </h4>
                <h3 class="plan-price">€17.99</h3>
                <p class="plan-small">per month</p>
                <div class="plan-features">
                    <ul>
                        <li>Virtualization: KVM</li>
                        <li>CPU: 6 x Intel® Xeon® Gold 6142</li>
                        <li>RAM: 25 GB DDR4 ECC</li>
                        <li>Storage: 200 GB NVMe SSD</li>
                        <li>Bandwidth: 1 Gbps unmetered</li>
                        <li>DDoS Protection: Layer 3-4</li>
                        <li>Setup: Instant</li>
                    </ul>
                </div>
                <button class="plan-btn">Get Started</button>
                <p class="plan-final">Ideal for small businesses</p>
            </div>
            <div class="plan">
                <img src="{$WEB_ROOT}/templates/{$template}/images/super.svg" alt="">
                <h4 class="plan-title">
                    Premium Plan
                </h4>
                <h3 class="plan-price">€39.99</h3>
                <p class="plan-small">per month</p>
                <div class="plan-features">
                    <ul>
                        <li>Virtualization: KVM</li>
                        <li>CPU: 10 x Intel® Xeon® Gold 6142</li>
                        <li>RAM: 70 GB DDR4 ECC</li>
                        <li>Storage: 300 GB NVMe SSD</li>
                        <li>Bandwidth: 1 Gbps unmetered</li>
                        <li>DDoS Protection: Layer 3-4</li>
                        <li>Setup: Instant</li>
                    </ul>
                </div>
                <button class="plan-btn">Get Started</button>
                <p class="plan-final">Best for growing teams and companies</p>
            </div>
            <div class="plan">
                <img src="{$WEB_ROOT}/templates/{$template}/images/pro.svg" alt="">
                <h4 class="plan-title">
                    Ultimate Plan
                </h4>
                <h3 class="plan-price">€49.99</h3>
                <p class="plan-small">per month</p>
                <div class="plan-features">
                    <ul>
                        <li>Virtualization: KVM</li>
                        <li>CPU: 14 x Intel® Xeon® Gold 6142</li>
                        <li>RAM: 90 GB DDR4 ECC</li>
                        <li>Storage: 400 GB NVMe SSD</li>
                        <li>Bandwidth: 1 Gbps unmetered</li>
                        <li>DDoS Protection: Layer 3-4</li>
                        <li>Setup: Instant</li>
                    </ul>
                </div>
                <button class="plan-btn">Get Started</button>
                <p class="plan-final">Elevate to a higher level of power</p>
            </div>
        </div>
    </div>
    <div class="divider-150"></div>
    <div class="section5">
        <div class="section2-texts">
            <h1 class="section2-title">
                Testimonials
            </h1>
            <p class="section2-description">Read what our customers say about our services !</p>
        </div>
        <div class="carousell">
            <div class="review">
                <div class="stars">
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-half"></i>
                </div>
                <p class="review-text">"HollandNode has been a game-changer for my business. Their VPS is fast, reliable, and the support team is always there to help. Highly recommend!"</p>
                <div class="reviewer">
                    <img src="{$WEB_ROOT}/templates/{$template}/images/avatar.svg" alt="" class="reviewer-img">
                    <div class="reviewer-name">
                        <p class="reviewer-name">
                            John Doe
                        </p>
                        <p class="reviewer-tier">
                            <span class="reviewer-badge silver">Gold Member</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="review review-active">
                <div class="stars">
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                </div>
                <p class="review-text">"HollandNode has been a game-changer for my business. Their VPS is fast, reliable, and the support team is always there to help. I highly recommend subscribing to their offers if you want the best services for a good price!"</p>
                <div class="reviewer">
                    <img src="{$WEB_ROOT}/templates/{$template}/images/avatar.svg" alt="" class="reviewer-img">
                    <div class="reviewer-name">
                        <p class="reviewer-name">
                            John Doe
                        </p>
                        <p class="reviewer-tier">
                            <span class="reviewer-badge gold">Gold Member</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="review">
                <div class="stars">
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-half"></i>
                </div>
                <p class="review-text">"HollandNode has been a game-changer for my business. Their VPS is fast, reliable, and the support team is always there to help. Highly recommend!"</p>
                <div class="reviewer">
                    <img src="{$WEB_ROOT}/templates/{$template}/images/avatar.svg" alt="" class="reviewer-img">
                    <div class="reviewer-name">
                        <p class="reviewer-name">
                            John Doe
                        </p>
                        <p class="reviewer-tier">
                            <span class="reviewer-badge bronze">Gold Member</span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="carousell-controls">
                <button class="carousell-prev"><i class="bi bi-chevron-left"></i></button>
                <button class="carousell-next"><i class="bi bi-chevron-right"></i></button>
            </div>
        </div>
    </div>
    <div class="divider-150"></div>
    <div class="section6">
        <div class="faq">
            <h1 class="faq-big">
                Frequently Asked Questions
            </h1>
        </div>
        <div class="question-list">
            <div class="question">
                <div class="question-visible">
                    <h3 class="question-text">
                        What makes HollandNode different from other hosting providers?
                    </h3>
                    <div class="question-btn">
                        <button class="question-btn-toggle">
                            <i class="bi bi-plus-circle-fill"></i>
                        </button>
                    </div>
                </div>
                <div class="question-invisible">
                    <p class="question-answer">
                        HollandNode stands out with blazing-fast VPS performance, instant deployment, flexible billing (crypto included), and a support team available 24/7 to assist you.
                    </p>
                </div>
            </div>
            <div class="question">
                <div class="question-visible">
                    <h3 class="question-text">
                        Is HollandNode suitable for developers and power users?
                    </h3>
                    <div class="question-btn">
                        <button class="question-btn-toggle">
                            <i class="bi bi-plus-circle-fill"></i>
                        </button>
                    </div>
                </div>
                <div class="question-invisible">
                    <p class="question-answer">
                        Absolutely. HollandNode gives you full root access, scalable server resources, and compatibility with popular dev tools—ideal for developers, sysadmins, and advanced users.
                    </p>
                </div>
            </div>
            <div class="question question-active">
                <div class="question-visible">
                    <h3 class="question-text">
                        How secure are the servers at HollandNode?
                    </h3>
                    <div class="question-btn">
                        <button class="question-btn-toggle">
                            <i class="bi bi-plus-circle-fill"></i>
                        </button>
                    </div>
                </div>
                <div class="question-invisible">
                    <p class="question-answer">
                        All servers are protected with DDoS mitigation, regular patching, private networking options, and advanced firewalls to ensure your data and services remain safe and online.
                    </p>
                </div>
            </div>
            <div class="question">
                <div class="question-visible">
                    <h3 class="question-text">
                        Can I upgrade my server later if I need more resources?
                    </h3>
                    <div class="question-btn">
                        <button class="question-btn-toggle">
                            <i class="bi bi-plus-circle-fill"></i>
                        </button>
                    </div>
                </div>
                <div class="question-invisible">
                    <p class="question-answer">
                        Yes! HollandNode allows you to upgrade your VPS at any time without losing data or facing downtime—perfect for growing businesses or projects.
                    </p>
                </div>
            </div>
            <div class="question">
                <div class="question-visible">
                    <h3 class="question-text">
                        Do you support anonymous payments or cryptocurrency?
                    </h3>
                    <div class="question-btn">
                        <button class="question-btn-toggle">
                            <i class="bi bi-plus-circle-fill"></i>
                        </button>
                    </div>
                </div>
                <div class="question-invisible">
                    <p class="question-answer">
                        Yes, HollandNode supports various payment methods including Bitcoin and other major cryptocurrencies—giving you privacy and flexibility with every transaction.
                    </p>
                </div>
            </div>
        </div>

    </div>
    <div class="divider-150"></div>
    <div class="section7">
        <div class="subscribe no-right-border">
            <div class="subscribe-text">
                <h1>Hear our latest</h1>
                <p>Subscribe for news to hear about lorem ipsum dolor alet</p>
            </div>
            <input type="text" class="subscribe-inp" name="email" placeholder="Enter your email address">
            <button class="subscribe-btn">
                Subscribe
            </button>
        </div>
        <div class="subscribe no-left-border">
            <div class="subscribe-text">
                <h1>Expert Advice</h1>
                <p>Subscribe to stay updated at every moment</p>
            </div>
            <button class="subscribe-btn">
                Contact Us
            </button>
        </div>
    </div>
</div>

{/if}

{include file="$template/includes/verifyemail.tpl"}


{/if}

<script>
    // Testimonial Slider Functionality
    document.addEventListener('DOMContentLoaded', function() {
        const reviewContainer = document.querySelector('.carousell');
        const reviews = Array.from(document.querySelectorAll('.review'));
        const prevBtn = document.querySelector('.carousell-prev');
        const nextBtn = document.querySelector('.carousell-next');
        const carousellControls = document.querySelector('.carousell-controls');
        
        let currentIndex = 1; // Start with middle review active (index 1)
        let isAnimating = false;
        
        function updateSlider() {
            if (isAnimating) return;
            isAnimating = true;
            
            // Simple fade out
            reviewContainer.style.opacity = '0.3';
            
            setTimeout(() => {
                // Clear active classes
                reviews.forEach(review => review.classList.remove('review-active'));
                
                // Calculate positions
                const leftIndex = (currentIndex - 1 + reviews.length) % reviews.length;
                const rightIndex = (currentIndex + 1) % reviews.length;
                
                // Clear container but keep controls
                reviewContainer.innerHTML = '';
                
                // Append reviews in correct order: left, center (active), right
                reviewContainer.appendChild(reviews[leftIndex]);
                reviewContainer.appendChild(reviews[currentIndex]);
                reviewContainer.appendChild(reviews[rightIndex]);
                
                // Add active class to center review
                reviews[currentIndex].classList.add('review-active');
                
                // Re-append controls
                reviewContainer.appendChild(carousellControls);
                
                // Simple fade in
                reviewContainer.style.opacity = '1';
                isAnimating = false;
            }, 200);
        }
        
        function nextSlide() {
            if (isAnimating) return;
            currentIndex = (currentIndex + 1) % reviews.length;
            updateSlider();
        }
        
        function prevSlide() {
            if (isAnimating) return;
            currentIndex = (currentIndex - 1 + reviews.length) % reviews.length;
            updateSlider();
        }
        
        // Event listeners for buttons
        if (nextBtn) {
            nextBtn.addEventListener('click', nextSlide);
        }
        
        if (prevBtn) {
            prevBtn.addEventListener('click', prevSlide);
        }
        
        // Initialize the slider
        updateSlider();
        
        // Add smooth transition for container
        if (reviewContainer) {
            reviewContainer.style.transition = 'opacity 0.2s ease';
        }
        
        // FAQ Accordion Functionality
        const faqQuestions = document.querySelectorAll('.question');
        
        faqQuestions.forEach(question => {
            const toggleBtn = question.querySelector('.question-btn-toggle');
            const answer = question.querySelector('.question-invisible');
            
            if (toggleBtn && answer) {
                toggleBtn.addEventListener('click', function() {
                    const isActive = question.classList.contains('question-active');
                    
                    // Close all other questions
                    faqQuestions.forEach(otherQuestion => {
                        if (otherQuestion !== question) {
                            otherQuestion.classList.remove('question-active');
                            const otherAnswer = otherQuestion.querySelector('.question-invisible');
                            const otherIcon = otherQuestion.querySelector('.question-btn-toggle i');
                            
                            if (otherAnswer) {
                                otherAnswer.style.maxHeight = '0px';
                                otherAnswer.style.opacity = '0';
                            }
                            if (otherIcon) {
                                otherIcon.style.transform = 'rotate(0deg)';
                                otherIcon.style.color = '#333';
                            }
                        }
                    });
                    
                    // Toggle current question
                    if (!isActive) {
                        question.classList.add('question-active');
                        answer.style.maxHeight = answer.scrollHeight + 'px';
                        answer.style.opacity = '1';
                        
                        const icon = toggleBtn.querySelector('i');
                        if (icon) {
                            icon.style.transform = 'rotate(45deg)';
                            icon.style.color = '#9747FF';
                        }
                    } else {
                        question.classList.remove('question-active');
                        answer.style.maxHeight = '0px';
                        answer.style.opacity = '0';
                        
                        const icon = toggleBtn.querySelector('i');
                        if (icon) {
                            icon.style.transform = 'rotate(0deg)';
                            icon.style.color = '#333';
                        }
                    }
                });
            }
        });
        
        // Initialize FAQ - Set up initial styles
        faqQuestions.forEach(question => {
            const answer = question.querySelector('.question-invisible');
            const icon = question.querySelector('.question-btn-toggle i');
            
            if (answer) {
                answer.style.transition = 'max-height 0.3s ease, opacity 0.3s ease';
                answer.style.overflow = 'hidden';
                
                if (question.classList.contains('question-active')) {
                    answer.style.maxHeight = answer.scrollHeight + 'px';
                    answer.style.opacity = '1';
                    if (icon) {
                        icon.style.transform = 'rotate(45deg)';
                        icon.style.color = '#9747FF';
                    }
                } else {
                    answer.style.maxHeight = '0px';
                    answer.style.opacity = '0';
                }
            }
            
            if (icon) {
                icon.style.transition = 'transform 0.3s ease, color 0.3s ease';
            }
        });
        
        // Info banner functionality
        const infoBanner = document.querySelector('.info-banner');
        const infoInner = document.querySelector('.info-inner');

        if (infoBanner && infoInner) {
            // Adjust animation speed based on content width
            function adjustScrollSpeed() {
                const containerWidth = infoBanner.offsetWidth;
                const contentWidth = infoInner.scrollWidth;
                const duration = (contentWidth / 100) + 's'; // Adjust speed formula as needed

                infoInner.style.animationDuration = duration;
            }

            // Initial setup
            adjustScrollSpeed();

            // Readjust on window resize
            window.addEventListener('resize', adjustScrollSpeed);

            // Optional: Add click to pause/resume
            infoBanner.addEventListener('click', function() {
                const currentState = window.getComputedStyle(infoInner).animationPlayState;
                infoInner.style.animationPlayState = currentState === 'paused' ? 'running' : 'paused';
            });
        }
    });

    let url = window.location.href;
    console.log(url);
    console.log(url.includes('services'));
    document.querySelectorAll('.navigation-active').forEach(item => {
        item.classList.remove('navigation-active'); 
    });
    if (url.includes('services')) {
        document.querySelector('#nav-services').classList.add('navigation-active');
    } else if (url.includes('clientarea')) {
        document.querySelector('#nav-client').classList.add('navigation-active');
    } else if (url.includes('knowledgebase')) {
        document.querySelector('#nav-knowledge').classList.add('navigation-active');
    } else if (url.includes('products')) {
        document.querySelector('#nav-blog').classList.add('navigation-active');
    } else if (url.includes('cart')) {
        document.querySelector('#nav-cart').classList.add('navigation-active');
    } else if (url.includes('clientarea')) {
        document.querySelector('#nav-clientarea').classList.add('navigation-active');
    } else {
        document.querySelector('#nav-home').classList.add('navigation-active');
    }
</script>