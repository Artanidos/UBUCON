import FlatSiteBuilder 2.0
import RevolutionSlider 1.0
import TextEditor 1.0

Content {
    title: "UBUCON"
    menu: "default"
    author: "Art"
    layout: "default"
    date: "2017-10-20"
    logo: "logo.png"

    Section {
        fullwidth: true

        RevolutionSlider {
            fullwidth: true

            Slide {
                src: "/media/art/data/SourceCode/UBUCON/web/assets/images/happypeople.png"
            }
        }
    }

    Section {

        Row {

            Column {
                span: 12

                Text {
                    text: "&lt;h1&gt;
	&lt;strong&gt;Welcome&lt;/strong&gt; to UBUCON
	&lt;span class=&quot;subtitle&quot;&gt;WE ARE HAPPY TO SEE YOU HERE&lt;/span&gt;
&lt;/h1&gt;
&lt;p class=&quot;lead&quot;&gt;We have got the following situation with social media today:&lt;/p&gt;
&lt;div class=&quot;row featured-box-minimal&quot;&gt; 
	&lt;div class=&quot;col-md-12&quot;&gt;
		&lt;h4&gt;&lt;i class=&quot;fa fa-users&quot;&gt;&lt;/i&gt; Facebook&lt;/h4&gt;
		&lt;p&gt; 
			Facebook is collecting our private information, censors our posts, floods us with ads and we only see the posts of only 25 of our friends.
		&lt;/p&gt;
	&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row featured-box-minimal&quot;&gt;
	&lt;div class=&quot;col-md-12&quot;&gt;
		&lt;h4&gt;&lt;i class=&quot;fa fa-users&quot;&gt;&lt;/i&gt; Google Plus&lt;/h4&gt;
		&lt;p&gt;
			Google Plus is also collecting our information and feeds other websites with ads.
		&lt;/p&gt;
	&lt;/div&gt;	
&lt;/div&gt;
&lt;div class=&quot;row featured-box-minimal&quot;&gt;
	&lt;div class=&quot;col-md-12&quot;&gt;
		&lt;h4&gt;&lt;i class=&quot;fa fa-users&quot;&gt;&lt;/i&gt; WhatsApp&lt;/h4&gt;
		&lt;p&gt;
			They say that our messages are encrypted. Thats might be true, but they might decrypt them for their usage.
		&lt;/p&gt;
	&lt;/div&gt;	
&lt;/div&gt;
&lt;div class=&quot;row featured-box-minimal&quot;&gt;
	&lt;div class=&quot;col-md-12&quot;&gt;
		&lt;h4&gt;&lt;i class=&quot;fa fa-users&quot;&gt;&lt;/i&gt; Telegram&lt;/h4&gt;
		&lt;p&gt;
			Do you really trust these guys? Are they open source at all? Who controls them?
		&lt;/p&gt;
	&lt;/div&gt;	
&lt;/div&gt;
&lt;div class=&quot;row featured-box-minimal&quot;&gt;
	&lt;div class=&quot;col-md-12&quot;&gt;
		&lt;h4&gt;&lt;i class=&quot;fa fa-users&quot;&gt;&lt;/i&gt; In General&lt;/h4&gt;
		&lt;p&gt;
		All these big players have got one issue. Big brother is looking over their shoulders and can see our messages.
		&lt;/p&gt;
	&lt;/div&gt;	
&lt;/div&gt;

&lt;p class=&quot;lead&quot;&gt;
Would you like to see a solution, then keep reading on.
&lt;/p&gt;"
                    adminlabel: "Welcome"
                }
            }
        }
    }

    Section {
        cssclass: "parallax margin-top80"
        style: "background-image: url('assets/images/natur.jpg');"
        attributes: "data-stellar-background-ratio='0.7'"

        Row {

            Column {
                span: 12

                Text {
                    text: "&lt;div class=&quot;container&quot;&gt;
	&lt;div class=&quot;row animation_fade_in&quot;&gt;
		&lt;div class=&quot;col-md-6&quot;&gt;
			&lt;div class=&quot;white-row&quot;&gt;
				&lt;h3&gt;&lt;strong&gt;UBUCON&lt;/strong&gt;&lt;/h3&gt;
				&lt;p class=&quot;lead&quot;&gt;
					THE PRIVATE SOCIAL MEDIA
				&lt;/p&gt;
			&lt;/div&gt;
		&lt;/div&gt;
	&lt;/div&gt;
&lt;/div&gt;"
                    adminlabel: "Parallax"
                }
            }
        }
    }

    Section {
        id:  features

        Row {

            Column {
                span: 12

                Text {
                    text: "&lt;h2 class=&quot;margin-top80&quot;&gt;&lt;strong&gt;Features&lt;/strong&gt;&lt;/h2&gt;

&lt;!-- FEATURED BOXES 3 --&gt;
			&lt;section class=&quot;container&quot;&gt;
				&lt;div class=&quot;row&quot;&gt;
					&lt;div class=&quot;col-md-3&quot;&gt;
						&lt;div class=&quot;featured-box nobg border-only&quot;&gt;
							&lt;div class=&quot;box-content&quot;&gt;
								&lt;i class=&quot;fa fa-users&quot;&gt;&lt;/i&gt;
								&lt;h4&gt;Open Source&lt;/h4&gt;
								&lt;p&gt;No tricks, no backdoors, no scam, no hidden risks&lt;/p&gt;
							&lt;/div&gt;
						&lt;/div&gt;
					&lt;/div&gt;
					&lt;div class=&quot;col-md-3&quot;&gt;
						&lt;div class=&quot;featured-box nobg border-only left-separator&quot;&gt;
							&lt;i class=&quot;fa fa-users&quot;&gt;&lt;/i&gt;
							&lt;h4&gt;Anonymous&lt;/h4&gt;
							&lt;p&gt;You don&#x27;t have to register. Connect only with real friends, so that only they know who you really are&lt;/p&gt;
						&lt;/div&gt;
					&lt;/div&gt;
					&lt;div class=&quot;col-md-3&quot;&gt;
						&lt;div class=&quot;featured-box nobg border-only left-separator&quot;&gt;
							&lt;i class=&quot;fa fa-users&quot;&gt;&lt;/i&gt;
							&lt;h4&gt;Decentral&lt;/h4&gt;
							&lt;p&gt;No administration. No censorship&lt;/p&gt;
						&lt;/div&gt;
					&lt;/div&gt;
					&lt;div class=&quot;col-md-3&quot;&gt;
						&lt;div class=&quot;featured-box nobg border-only left-separator&quot;&gt;
							&lt;i class=&quot;fa fa-users&quot;&gt;&lt;/i&gt;
							&lt;h4&gt;Ads Free&lt;/h4&gt;
							&lt;p&gt;Only see what you want to see&lt;/p&gt;
						&lt;/div&gt;
					&lt;/div&gt;
				&lt;/div&gt;
			&lt;/section&gt;
			&lt;!-- /FEATURED BOXES 3 --&gt;"
                    adminlabel: "Features"
                }
            }
        }
    }

    Section {
        id:  art

        Row {

            Column {
                span: 12

                Text {
                    text: "&lt;h2&gt;&lt;strong&gt;Team&lt;/strong&gt;&lt;/h2&gt;"
                    adminlabel: "Team"
                }
            }
        }

        Row {

            Column {
                span: 3

                Text {
                    text: "&lt;div class=&quot;row&quot;&gt;
	&lt;div class=&quot;col-sm-12 col-md-12&quot;&gt;
		&lt;div class=&quot;item-box fixed-box&quot;&gt;
			&lt;figure&gt;
				&lt;img class=&quot;img-responsive&quot; src=&quot;assets/images/olaf.jpg&quot; width=&quot;263&quot; height=&quot;263&quot; alt=&quot;&quot;/&gt;
			&lt;/figure&gt;
			&lt;div class=&quot;item-box-desc&quot;&gt;
				&lt;h4&gt;Olaf Art Ananda&lt;/h4&gt;
				&lt;small class=&quot;styleColor&quot;&gt;Monchique (+351) 969 31 28 08&lt;/small&gt;
				&lt;p&gt;&lt;a href=&quot;mailto:artanidos@gmail.com&quot;&gt;Art&lt;/a&gt; currently lives in Potugal.&lt;/p&gt;
				&lt;div class=&quot;row socials&quot;&gt;
					&lt;a href=&quot;https://www.facebook.com/artanidos&quot; class=&quot;social fa fa-facebook&quot;&gt;&lt;/a&gt;
					&lt;!-- a href=&quot;#&quot; class=&quot;social fa fa-twitter&quot;&gt;&lt;/a&gt;
					&lt;a href=&quot;#&quot; class=&quot;social fa fa-google-plus&quot;&gt;&lt;/a --&gt;
				&lt;/div&gt;
			&lt;/div&gt;
		&lt;/div&gt;
	&lt;/div&gt;
&lt;/div&gt;"
                    adminlabel: "Art"
                }
            }

            Column {
                span: 9

                Text {
                    text: "&lt;div class=&quot;white-row&quot;&gt;
	&lt;h3&gt;About &lt;strong&gt;Art&lt;/strong&gt; (Teamleader)&lt;/h3&gt;
	&lt;p&gt;&lt;strong&gt;Art&lt;/strong&gt; was a software developer and designer for a long time until he attended his 
	first tantric massage workshop in 2014.
	Since that day he has completely turned his life upside down. He quit his well-paid job in Switzerland and
	moved to Denmark to finally start life (kitesurfing).

	&lt;/p&gt;
	&lt;p&gt;
	Art now lives in Portugal and builds the &lt;strong&gt;Camp Eden &lt;/strong&gt;, a tantric community based on the rules 
	of the rainbow family and according to the philosophy of the UBUNTU movement in South Africa.
	&lt;/p&gt;
&lt;/div&gt;


 "
                }

                Text {
                    text: "&lt;div class=&quot;white-row&quot;&gt;
&lt;h3&gt;&lt;strong&gt;Education&lt;/strong&gt;&lt;/h3&gt;
&lt;ul&gt;
	&lt;li&gt;Lomi Lomi Nui 2 (Anja and Jana Goralski)&lt;/li&gt;
	&lt;li&gt;Lomi Lomi Nui 1 (Anja and Jana Goralski)&lt;/li&gt;
	&lt;li&gt;Tantramassage Level 2 (Suriya, Eva, Saranam)&lt;/li&gt;
	&lt;li&gt;Yin-Yang-Massage (Frank Lerch)&lt;/li&gt;
	&lt;li&gt;Lingam Intensiv (Suriya, Eva)&lt;/li&gt;
	&lt;li&gt;Tantramassage Level 1 (Suriya, Eva, Saranam)&lt;/li&gt;
	&lt;li&gt;The Art of Touch 2 (Somananda Moses Maimon)&lt;/li&gt;
	&lt;li&gt;Ausbildung zum Sexological Bodyworker (Didi Liebold, Janine Hug)&lt;/li&gt;
	&lt;li&gt;Beckenboden, Anal- und Prostatamassage (Jacqueline Schönbächler, Dr. Eva Thiel)&lt;/li&gt;
	&lt;li&gt;Yonimassage Aufbaukurs (Jacqueline Schönbächler)&lt;/li&gt;
	&lt;li&gt;Basis Ausbildung Tantra Massage (Jacqueline Schönbächler)&lt;/li&gt;
	&lt;li&gt;Studium Human Computer Interaction Design (UNI Rapperswil, Basel)&lt;/li&gt;
	&lt;li&gt;Fernstudium Grafik Design (Studien Gemeinschaft Darmstadt)&lt;/li&gt;
	&lt;li&gt;Autodidact Softwareentwicklung&lt;/li&gt;
	&lt;li&gt;Ausbildung zum Maschinenschlosser (Deutsche Audco)&lt;/li&gt;
	&lt;li&gt;Realschule (Egenbüttel)&lt;/li&gt;	
&lt;/ul&gt;
&lt;/div&gt;"
                    adminlabel: "Education"
                }
            }
        }
    }
}
