; params: satgen 980352 2 2 4 3 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	infrared3 - mode
	spectrograph0 - mode
	thermograph2 - mode
	infrared1 - mode
	GroundStation1 - direction
	GroundStation2 - direction
	Star0 - direction
	Star3 - direction
	Star4 - direction
	Planet5 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star0)
	(supports instrument1 infrared3)
	(supports instrument1 spectrograph0)
	(calibration_target instrument1 Star0)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star4)
	(supports instrument2 infrared3)
	(calibration_target instrument2 GroundStation2)
	(supports instrument3 spectrograph0)
	(calibration_target instrument3 Star0)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation1)
)
(:goal (and
	(pointing satellite0 Star0)
	(have_image Star3 thermograph2)
	(have_image Star4 thermograph2)
	(have_image Planet5 infrared3)
))

)
