; params: satgen 792820 2 1 3 4 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	thermograph2 - mode
	infrared0 - mode
	infrared1 - mode
	GroundStation0 - direction
	GroundStation3 - direction
	Star2 - direction
	Star1 - direction
	Planet4 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
)
(:init
	(supports instrument0 thermograph2)
	(supports instrument0 infrared0)
	(supports instrument0 infrared1)
	(calibration_target instrument0 Star2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star1)
	(supports instrument1 infrared0)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star5)
)
(:goal (and
	(pointing satellite1 Star5)
	(have_image Planet4 infrared1)
	(have_image Star5 thermograph2)
	(have_image Planet6 infrared0)
	(have_image Planet7 infrared1)
))

)
