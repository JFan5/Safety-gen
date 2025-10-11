; params: satgen 285838 2 2 4 7 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	infrared3 - mode
	spectrograph0 - mode
	image2 - mode
	infrared1 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation6 - direction
	Star4 - direction
	GroundStation5 - direction
	GroundStation1 - direction
	Phenomenon7 - direction
	Star8 - direction
	Planet9 - direction
	Star10 - direction
	Star11 - direction
	Planet12 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation5)
	(calibration_target instrument0 Star4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation5)
	(supports instrument1 image2)
	(supports instrument1 infrared1)
	(supports instrument1 infrared3)
	(calibration_target instrument1 GroundStation1)
	(on_board instrument1 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation5)
)
(:goal (and
	(pointing satellite1 Phenomenon7)
	(have_image Phenomenon7 spectrograph0)
	(have_image Star8 infrared1)
	(have_image Planet9 infrared3)
	(have_image Star10 image2)
	(have_image Star11 infrared1)
	(have_image Planet12 image2)
))

)
