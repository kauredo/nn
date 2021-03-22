import * as React from 'react';

const styles = require('./NavBar.module.scss');

export default function NavBar() {
	return (
		<div className={styles.navbar}>
			<div className={styles.container}>
				<div className={styles.logoSection}>
					<img className={styles.logo} src='images/logo.png' alt='nn' />
				</div>
				<div className={styles.sections}>
					<a href='/'>
						<p
							className={`${styles.link} ${
								window.location.pathname === '/' && styles.active
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
			</div>
		</div>
	);
}
