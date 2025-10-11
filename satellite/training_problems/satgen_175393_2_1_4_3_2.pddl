; params: satgen 175393 2 1 4 3 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image0 - mode
	spectrograph1 - mode
	infrared3 - mode
	thermograph2 - mode
	Star2 - direction
	Star1 - direction
	GroundStation0 - direction
	Planet3 - direction
	Star4 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(supports instrument0 thermograph2)
	(supports instrument0 image0)
	(calibration_target instrument0 Star1)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet3)
	(supports instrument1 infrared3)
	(calibration_target instrument1 GroundStation0)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star2)
)
(:goal (and
	(pointing satellite0 Star2)
	(pointing satellite1 GroundStation0)
	(have_image Planet3 infrared3)
	(have_image Star4 image0)
))

)
