; params: satgen 607510 1 3 4 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph0 - mode
	infrared1 - mode
	image3 - mode
	infrared2 - mode
	Star1 - direction
	Star2 - direction
	Star4 - direction
	Star5 - direction
	Star6 - direction
	Star0 - direction
	Star3 - direction
	Star7 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
	Phenomenon11 - direction
	Phenomenon12 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 infrared2)
	(supports instrument0 image3)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star3)
	(calibration_target instrument0 Star0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon8)
)
(:goal (and
	(have_image Star7 infrared2)
	(have_image Phenomenon8 spectrograph0)
	(have_image Phenomenon9 infrared2)
	(have_image Phenomenon10 spectrograph0)
	(have_image Phenomenon11 infrared2)
	(have_image Phenomenon12 image3)
))

)
