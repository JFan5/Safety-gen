; params: satgen 842185 1 3 2 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	spectrograph1 - mode
	image0 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation3 - direction
	Star2 - direction
	Star4 - direction
	Planet5 - direction
	Planet6 - direction
	Phenomenon7 - direction
	Phenomenon8 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 image0)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation3)
)
(:goal (and
	(pointing satellite0 Phenomenon8)
	(have_image Star4 spectrograph1)
	(have_image Planet5 image0)
	(have_image Planet6 image0)
	(have_image Phenomenon7 image0)
	(have_image Phenomenon8 spectrograph1)
))

)
