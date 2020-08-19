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
	&lt;span class=&quot;subtitle&quot;&gt;UBUCON is the short form of UBUNTU Connection&lt;/span&gt;
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
		&lt;h4&gt;&lt;i class=&quot;fa fa-users&quot;&gt;&lt;/i&gt; Human Connections&lt;/h4&gt;
		&lt;p&gt;
			As stated by Dennis Hack, Human Connections is an open source platform, where everybody thought, 
			he would bring it for free.&lt;/br&gt;
			Unfortunately they are asking for millions to complete their project and it&#x27;s still not out yet.&lt;/br&gt;
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
					THE PRIVATE SOCIAL MEDIA FROM THE PEOPLE
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

        Row {

            Column {
                span: 12

                Text {
                    text: "&lt;p class=&quot;lead&quot;&gt;
	How can we archieve our goals with no or only a little budget?
&lt;/p&gt;

&lt;p&gt;
	Do you know what UBUNTU is all about?&lt;/br&gt;
	UBUNTU means, &lt;strong&gt;I am, because we are&lt;/strong&gt;. We are helping each other, without asking for money or something in exchange.&lt;/br&gt;
	As Meli asked me in August 2020, if I would start this project for the UBUNTU movement, then I immediatly said, YES.&lt;/br&gt;
	I was just happy to get this project. All my life I was steering into this direction. I felt the call years before.
	It is my biggest project so far, even after being a software developer since 30 years now.&lt;/br&gt;
	I am not good in anything in particular, but my skills are cross plattform, user interface design and user centered design
	that is what is needed right now. &lt;/br&gt;&lt;/br&gt;
	Maybe later we need to crowdfund some budget, because we might need hardware or we might have to pay some developer,
	but right now we just need time.
&lt;/p&gt;"
                }
            }
        }
    }

    Section {
        cssclass: "parallax margin-top80"
        style: "background-image: url('assets/images/natur2.jpg');"
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
					DECENTRAL, ANONYMOUS, NO ADS, NO CENSORSHIP 
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

        Row {

            Column {
                span: 12

                Text {
                    text: "&lt;h2 class=&quot;margin-top80&quot;&gt;&lt;strong&gt;Ideas&lt;/strong&gt;&lt;/h2&gt;

&lt;p class=&quot;lead&quot;&gt;
	Here are some ideas what we can implement with UBUCON as plugin.
&lt;/p&gt;
&lt;div class=&quot;row featured-box-minimal&quot;&gt; 
	&lt;div class=&quot;col-md-12&quot;&gt;
		&lt;h4&gt;&lt;i class=&quot;fa fa-users&quot;&gt;&lt;/i&gt; Housing&lt;/h4&gt;
		&lt;p&gt;
			There are many houses abandoned on the whole planet while we have got many homeless people.
			What if we track these house with geo locations, pictures and status, so that everyone can go there
			an occupy it.&lt;/br&gt;
			These houses will get a traffic light system. Red means already occupied. Green means empty. 
			And orange means somebody is living there an wants someone else to join.
		&lt;/p&gt;
	&lt;/div&gt;
&lt;/div&gt;

&lt;div class=&quot;row featured-box-minimal&quot;&gt; 
	&lt;div class=&quot;col-md-12&quot;&gt;
		&lt;h4&gt;&lt;i class=&quot;fa fa-users&quot;&gt;&lt;/i&gt; Travel&lt;/h4&gt;
		&lt;p&gt;
			You want to travel. You have got a spare room. These this plugin can help you to connect each other.
			We don&#x27;t have to pay for expensive hotels.
		&lt;/p&gt;
	&lt;/div&gt;
&lt;/div&gt;

&lt;div class=&quot;row featured-box-minimal&quot;&gt; 
	&lt;div class=&quot;col-md-12&quot;&gt;
		&lt;h4&gt;&lt;i class=&quot;fa fa-users&quot;&gt;&lt;/i&gt; Ride Share&lt;/h4&gt;
		&lt;p&gt;
			You want to travel with your car and have got spare space, then this plugin may connect people.
		&lt;/p&gt;
	&lt;/div&gt;
&lt;/div&gt;

&lt;div class=&quot;row featured-box-minimal&quot;&gt; 
	&lt;div class=&quot;col-md-12&quot;&gt;
		&lt;h4&gt;&lt;i class=&quot;fa fa-users&quot;&gt;&lt;/i&gt; Hands&lt;/h4&gt;
		&lt;p&gt;
			You need help in the garden for harvesting food. This plugin might connect you with helpers.
		&lt;/p&gt;
	&lt;/div&gt;
&lt;/div&gt;"
                    adminlabel: "Ideas"
                }
            }
        }
    }

    Section {
        id:  team

        Row {

            Column {
                span: 12

                Text {
                    text: "&lt;h2 class=&quot;margin-top80&quot;&gt;&lt;strong&gt;Team&lt;/strong&gt;&lt;/h2&gt;"
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
				&lt;img class=&quot;img-responsive&quot; src=&quot;assets/images/bauchi.png&quot; width=&quot;263&quot; height=&quot;263&quot; alt=&quot;&quot;/&gt;
			&lt;/figure&gt;
			&lt;div class=&quot;item-box-desc&quot;&gt;
				&lt;h4&gt;Jesus Bruder Bauchi&lt;/h4&gt;
				&lt;small class=&quot;styleColor&quot;&gt;+34 602 505 181&lt;/small&gt;
				&lt;p&gt;&lt;a href=&quot;mailto:jesusurlauber@yahoo.de&quot;&gt;Bauchi&lt;/a&gt;&lt;/p&gt;
				&lt;div class=&quot;row socials&quot;&gt;
					&lt;a href=&quot;https://www.facebook.com/jesus.urlauber&quot; class=&quot;social fa fa-facebook&quot;&gt;&lt;/a&gt;
					&lt;!-- a href=&quot;#&quot; class=&quot;social fa fa-twitter&quot;&gt;&lt;/a&gt;
					&lt;a href=&quot;#&quot; class=&quot;social fa fa-google-plus&quot;&gt;&lt;/a --&gt;
				&lt;/div&gt;
			&lt;/div&gt;
		&lt;/div&gt;
	&lt;/div&gt;
&lt;/div&gt;"
                    adminlabel: "Bauchi"
                }
            }

            Column {
                span: 9

                Text {
                    text: "&lt;div class=&quot;white-row&quot;&gt;
	&lt;h3&gt;About &lt;strong&gt;Bauchi&lt;/strong&gt; (Initiator)&lt;/h3&gt;
	&lt;p&gt;
		&lt;strong&gt;Bauchi&lt;/strong&gt; is one of the organisators of the UBUNTU festival in 2020.&lt;/br&gt;
		&quot;Bauchi&quot; is the short form of &quot;Bauchmensch&quot;.&lt;/br&gt;
		By definition someone who follows his INTUITION.&lt;/br&gt;
		And that&#x27;s exactly what he is living. Abstruse and stubborn until you drop.&lt;/br&gt;
		Have a look at his &lt;a href=&quot;http://lest2020.de&quot;&gt;website&lt;/a&gt; for more information.
	&lt;/p&gt;
&lt;/div&gt;"
                }
            }
        }

        Row {

            Column {
                span: 9

                Text {
                    text: "&lt;div class=&quot;white-row&quot;&gt;
	&lt;h3&gt;About &lt;strong&gt;Meli&lt;/strong&gt; (Initiator)&lt;/h3&gt;
	&lt;p&gt;
		&lt;strong&gt;Meli&lt;/strong&gt; is one of the organisators of the UBUNTU festival in 2020.&lt;/br&gt;
		She is an author, energetic worker, she creates videos about awareness and meditation.&lt;/br&gt;
		Have a look at her &lt;a href=&quot;https://www.melijurak.com&quot;&gt;website&lt;/a&gt; for more information.
	&lt;/p&gt;
&lt;/div&gt;"
                }
            }

            Column {
                span: 3

                Text {
                    text: "&lt;div class=&quot;row&quot;&gt;
	&lt;div class=&quot;col-sm-12 col-md-12&quot;&gt;
		&lt;div class=&quot;item-box fixed-box&quot;&gt;
			&lt;figure&gt;
				&lt;img class=&quot;img-responsive&quot; src=&quot;assets/images/meli.png&quot; width=&quot;263&quot; height=&quot;263&quot; alt=&quot;&quot;/&gt;
			&lt;/figure&gt;
			&lt;div class=&quot;item-box-desc&quot;&gt;
				&lt;h4&gt;Meli Jurak&lt;/h4&gt;
				&lt;small class=&quot;styleColor&quot;&gt;Graz +43 660/21 65 996&lt;/small&gt;
				&lt;p&gt;&lt;a href=&quot;mailto:office@melaniejurak.com&quot;&gt;Meli&lt;/a&gt; lives and works in Austria.&lt;/p&gt;
				&lt;div class=&quot;row socials&quot;&gt;
					&lt;a href=&quot;https://www.facebook.com/meli.jurak&quot; class=&quot;social fa fa-facebook&quot;&gt;&lt;/a&gt;
					&lt;!-- a href=&quot;#&quot; class=&quot;social fa fa-twitter&quot;&gt;&lt;/a&gt;
					&lt;a href=&quot;#&quot; class=&quot;social fa fa-google-plus&quot;&gt;&lt;/a --&gt;
				&lt;/div&gt;
			&lt;/div&gt;
		&lt;/div&gt;
	&lt;/div&gt;
&lt;/div&gt;"
                    adminlabel: "Meli"
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
				&lt;img class=&quot;img-responsive&quot; src=&quot;assets/images/olaf.png&quot; width=&quot;263&quot; height=&quot;263&quot; alt=&quot;&quot;/&gt;
			&lt;/figure&gt;
			&lt;div class=&quot;item-box-desc&quot;&gt;
				&lt;h4&gt;Olaf Art Ananda&lt;/h4&gt;
				&lt;small class=&quot;styleColor&quot;&gt;Monchique +351 969 31 28 08&lt;/small&gt;
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
	&lt;h3&gt;About &lt;strong&gt;Art&lt;/strong&gt; (Technical Teamleader)&lt;/h3&gt;
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
            }
        }
    }
}
