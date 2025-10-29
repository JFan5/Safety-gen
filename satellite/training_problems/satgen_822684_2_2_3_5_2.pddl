; params: satgen 822684 2 2 3 5 2
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	infrared2 - mode
	spectrograph0 - mode
	image1 - mode
	GroundStation0 - direction
	GroundStation2 - direction
	Star1 - direction
	GroundStation4 - direction
	Star3 - direction
	Planet5 - direction
	Planet6 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 infrared2)
	(supports instrument0 image1)
	(calibration_target instrument0 Star1)
	(supports instrument1 spectrograph0)
	(supports instrument1 image1)
	(calibration_target instrument1 GroundStation4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet6)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 Star3)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation2)
)
(:goal (and
	(pointing satellite0 Star3)
	(pointing satellite1 Star3)
	(have_image Planet5 image1)
	(have_image Planet6 image1)
))

)
