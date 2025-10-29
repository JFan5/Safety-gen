; params: satgen 583292 1 3 4 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	infrared2 - mode
	thermograph0 - mode
	spectrograph1 - mode
	thermograph3 - mode
	GroundStation0 - direction
	Star1 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	Star5 - direction
	Star6 - direction
	Star3 - direction
	Planet7 - direction
	Planet8 - direction
	Star9 - direction
	Phenomenon10 - direction
	Star11 - direction
	Star12 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph3)
	(supports instrument0 thermograph0)
	(supports instrument0 infrared2)
	(calibration_target instrument0 Star3)
	(calibration_target instrument0 Star6)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet7)
)
(:goal (and
	(pointing satellite0 Star12)
	(have_image Planet7 thermograph3)
	(have_image Planet8 infrared2)
	(have_image Star9 thermograph3)
	(have_image Phenomenon10 thermograph0)
	(have_image Star11 thermograph3)
	(have_image Star12 thermograph3)
))

)
