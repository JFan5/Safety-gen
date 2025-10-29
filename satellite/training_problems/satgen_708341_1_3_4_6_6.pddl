; params: satgen 708341 1 3 4 6 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	spectrograph0 - mode
	image1 - mode
	thermograph2 - mode
	infrared3 - mode
	GroundStation1 - direction
	GroundStation3 - direction
	Star0 - direction
	GroundStation2 - direction
	Star4 - direction
	Star5 - direction
	Planet6 - direction
	Planet7 - direction
	Phenomenon8 - direction
	Planet9 - direction
	Phenomenon10 - direction
	Phenomenon11 - direction
)
(:init
	(supports instrument0 image1)
	(supports instrument0 infrared3)
	(calibration_target instrument0 Star0)
	(supports instrument1 spectrograph0)
	(supports instrument1 thermograph2)
	(supports instrument1 image1)
	(calibration_target instrument1 GroundStation2)
	(calibration_target instrument1 Star0)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 Star5)
	(calibration_target instrument2 Star4)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star5)
)
(:goal (and
	(pointing satellite0 GroundStation2)
	(have_image Planet6 infrared3)
	(have_image Planet7 infrared3)
	(have_image Phenomenon8 image1)
	(have_image Planet9 image1)
	(have_image Phenomenon10 spectrograph0)
	(have_image Phenomenon11 image1)
))

)
