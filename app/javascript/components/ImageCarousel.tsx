import * as React from 'react';
import 'react-responsive-carousel/lib/styles/carousel.min.css'; // requires a loader
import { Carousel } from 'react-responsive-carousel';

const styles = require('./ImageCarousel.module.scss');

interface Props {
	images: any[];
	folder: string;
}

export default function ImageCarousel(props: Props) {
	const items = props.images.map((image, index) => (
		<div className={styles.imageSection}>
			<img
				loading='lazy'
				className={styles.image}
				key={index}
				src={`assets/${props.folder}/${image}`}
				alt={image}
			/>
		</div>
	));
	return (
		<div className={styles.parent}>
			<Carousel
				centerMode
				infiniteLoop
				showThumbs={false}
				showIndicators={false}
				useKeyboardArrows
			>
				{items}
			</Carousel>
		</div>
	);
}
