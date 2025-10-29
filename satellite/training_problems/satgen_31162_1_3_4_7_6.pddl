; params: satgen 31162 1 3 4 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared3 - mode
	spectrograph1 - mode
	infrared2 - mode
	image0 - mode
	GroundStation0 - direction
	Star1 - direction
	Star2 - direction
	Star4 - direction
	GroundStation5 - direction
	Star6 - direction
	GroundStation3 - direction
	Star7 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Phenomenon10 - direction
	Star11 - direction
	Phenomenon12 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 image0)
	(supports instrument0 spectrograph1)
	(supports instrument0 infrared3)
	(calibration_target instrument0 GroundStation3)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
)
(:goal (and
	(pointing satellite0 Phenomenon9)
	(have_image Star7 infrared3)
	(have_image Planet8 infrared2)
	(have_image Phenomenon9 infrared3)
	(have_image Phenomenon10 image0)
	(have_image Star11 infrared2)
	(have_image Phenomenon12 infrared2)
))

)
