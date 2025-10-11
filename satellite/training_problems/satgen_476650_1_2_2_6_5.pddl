; params: satgen 476650 1 2 2 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared1 - mode
	spectrograph0 - mode
	Star1 - direction
	Star3 - direction
	Star4 - direction
	Star5 - direction
	GroundStation0 - direction
	GroundStation2 - direction
	Planet6 - direction
	Star7 - direction
	Star8 - direction
	Phenomenon9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 GroundStation2)
	(calibration_target instrument0 GroundStation0)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
)
(:goal (and
	(pointing satellite0 Star3)
	(have_image Planet6 infrared1)
	(have_image Star7 spectrograph0)
	(have_image Star8 infrared1)
	(have_image Phenomenon9 infrared1)
	(have_image Planet10 spectrograph0)
))

)
