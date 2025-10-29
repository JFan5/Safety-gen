; params: satgen 386377 2 2 4 4 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	image3 - mode
	infrared2 - mode
	image1 - mode
	spectrograph0 - mode
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	Star4 - direction
	Phenomenon5 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Star8 - direction
)
(:init
	(supports instrument0 image3)
	(supports instrument0 image1)
	(supports instrument0 infrared2)
	(calibration_target instrument0 GroundStation2)
	(supports instrument1 spectrograph0)
	(supports instrument1 image3)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Phenomenon5)
	(supports instrument2 infrared2)
	(supports instrument2 image3)
	(supports instrument2 image1)
	(calibration_target instrument2 GroundStation3)
	(supports instrument3 spectrograph0)
	(supports instrument3 infrared2)
	(calibration_target instrument3 GroundStation3)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation2)
)
(:goal (and
	(pointing satellite0 Star8)
	(pointing satellite1 Star4)
	(have_image Star4 spectrograph0)
	(have_image Phenomenon5 image3)
	(have_image Phenomenon6 image1)
	(have_image Planet7 spectrograph0)
	(have_image Star8 spectrograph0)
))

)
