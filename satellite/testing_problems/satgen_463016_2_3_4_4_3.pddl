; params: satgen 463016 2 3 4 4 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	image2 - mode
	infrared1 - mode
	spectrograph3 - mode
	infrared0 - mode
	GroundStation0 - direction
	Star2 - direction
	Star1 - direction
	Star3 - direction
	Planet4 - direction
	Star5 - direction
	Phenomenon6 - direction
)
(:init
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star1)
	(supports instrument1 infrared1)
	(calibration_target instrument1 Star3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star2)
	(supports instrument2 image2)
	(supports instrument2 infrared0)
	(supports instrument2 spectrograph3)
	(calibration_target instrument2 Star3)
	(supports instrument3 infrared1)
	(supports instrument3 image2)
	(supports instrument3 infrared0)
	(calibration_target instrument3 Star3)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(pointing satellite0 Star2)
	(have_image Planet4 infrared1)
	(have_image Star5 infrared0)
	(have_image Phenomenon6 image2)
))

)
