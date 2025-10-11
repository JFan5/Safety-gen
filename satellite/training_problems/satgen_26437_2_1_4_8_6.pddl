; params: satgen 26437 2 1 4 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph0 - mode
	spectrograph3 - mode
	thermograph1 - mode
	infrared2 - mode
	GroundStation0 - direction
	Star3 - direction
	Star4 - direction
	Star6 - direction
	Star7 - direction
	Star5 - direction
	Star1 - direction
	GroundStation2 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Star10 - direction
	Phenomenon11 - direction
	Star12 - direction
	Planet13 - direction
)
(:init
	(supports instrument0 infrared2)
	(supports instrument0 thermograph0)
	(calibration_target instrument0 GroundStation2)
	(calibration_target instrument0 Star5)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star6)
	(supports instrument1 thermograph1)
	(supports instrument1 spectrograph3)
	(calibration_target instrument1 GroundStation2)
	(calibration_target instrument1 Star1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star5)
)
(:goal (and
	(pointing satellite0 Star3)
	(pointing satellite1 Star5)
	(have_image Phenomenon8 thermograph0)
	(have_image Planet9 spectrograph3)
	(have_image Star10 spectrograph3)
	(have_image Phenomenon11 thermograph0)
	(have_image Star12 infrared2)
	(have_image Planet13 infrared2)
))

)
