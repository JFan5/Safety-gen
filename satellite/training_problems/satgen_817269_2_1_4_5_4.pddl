; params: satgen 817269 2 1 4 5 4
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	image1 - mode
	spectrograph2 - mode
	infrared0 - mode
	thermograph3 - mode
	GroundStation0 - direction
	Star1 - direction
	Star3 - direction
	GroundStation4 - direction
	Star2 - direction
	Star5 - direction
	Phenomenon6 - direction
	Star7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 thermograph3)
	(supports instrument0 infrared0)
	(supports instrument0 image1)
	(calibration_target instrument0 GroundStation4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument1 image1)
	(supports instrument1 spectrograph2)
	(calibration_target instrument1 Star2)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star8)
)
(:goal (and
	(pointing satellite1 GroundStation4)
	(have_image Star5 spectrograph2)
	(have_image Phenomenon6 image1)
	(have_image Star7 infrared0)
	(have_image Star8 infrared0)
))

)
