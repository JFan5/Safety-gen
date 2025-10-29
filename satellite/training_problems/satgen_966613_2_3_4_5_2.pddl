; params: satgen 966613 2 3 4 5 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	instrument4 - instrument
	image0 - mode
	thermograph2 - mode
	infrared3 - mode
	thermograph1 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	Star3 - direction
	GroundStation2 - direction
	Star4 - direction
	Planet5 - direction
	Planet6 - direction
)
(:init
	(supports instrument0 image0)
	(supports instrument0 thermograph2)
	(supports instrument0 infrared3)
	(calibration_target instrument0 Star3)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 GroundStation2)
	(supports instrument2 image0)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet6)
	(supports instrument3 infrared3)
	(calibration_target instrument3 Star4)
	(supports instrument4 thermograph1)
	(supports instrument4 thermograph2)
	(supports instrument4 infrared3)
	(calibration_target instrument4 Star4)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation0)
)
(:goal (and
	(pointing satellite0 GroundStation2)
	(pointing satellite1 Planet5)
	(have_image Planet5 thermograph2)
	(have_image Planet6 thermograph2)
))

)
