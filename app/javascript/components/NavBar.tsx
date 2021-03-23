import * as React from 'react';

const styles = require('./NavBar.module.scss');

export default function NavBar() {
	const burgerRef = React.useRef(null);
	const linksRef = React.useRef(null);
	const [open, setOpen] = React.useState(false);
	const addClick = () => {
		setOpen(!open);
		burgerRef.current.classList.toggle(styles.open);
		if (linksRef.current.classList.contains(styles.hidden)) {
			linksRef.current.classList.toggle(styles.hidden);
			setTimeout(() => {
				linksRef.current.classList.toggle(styles.visuallyHidden);
			}, 10);
		} else {
			linksRef.current.classList.toggle(styles.visuallyHidden);
			setTimeout(() => {
				linksRef.current.classList.toggle(styles.hidden);
			}, 600);
		}
	};

	React.useEffect(() => {
		let vh = window.innerHeight * 0.01;
		// Then we set the value in the --vh custom property to the root of the document
		document.documentElement.style.setProperty('--vh', `${vh}px`);
	}, [open, setOpen]);

	return (
		<div className={styles.navbar}>
			<div className={styles.container}>
				<div className={styles.logoSection}>
					<a href='/'>
						<img className={styles.logo} src='/assets/logo.png' alt='nn' />
					</a>
					<div ref={burgerRef} className={styles.burger} onClick={addClick}>
						<span></span>
						<span></span>
						<span></span>
						<span></span>
					</div>
				</div>
				<div
					ref={linksRef}
					className={`${styles.links} ${styles.hidden} ${styles.visuallyHidden}`}
				>
					<div className={styles.sections}>
						<a href='/'>
							<p
								className={`${styles.link} ${
									!['/about', '/contact'].includes(window.location.pathname) &&
									styles.active
								}`}
							>
								Work
							</p>
						</a>
						<a href='/about'>
							<p
								className={`${styles.link} ${
									window.location.pathname === '/about' && styles.active
								}`}
							>
								About
							</p>
						</a>
						<a href='/contact'>
							<p
								className={`${styles.link} ${
									window.location.pathname === '/contact' && styles.active
								}`}
							>
								Contact
							</p>
						</a>
					</div>
					<div className={styles.instagram}>
						<h1>
							<a href='https://www.instagram.com/imkfmnn' target='/blank'>
								<i className='fab fa-instagram'></i>
							</a>
						</h1>
					</div>
				</div>
			</div>
		</div>
	);
}
