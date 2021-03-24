import * as React from 'react';

const styles = require('./ImageCarousel.module.scss');

interface Props {
	images: any[];
}

export default function ImageCarousel(props: Props) {
	const items = props.images.map((image, index) => (
		<div className={styles.imageSection}>
			<img
				className={styles.image}
				key={index}
				src={`assets/peace/${image}`}
				alt={image}
			/>
		</div>
	));
	return <div className={styles.parent}></div>;
}
