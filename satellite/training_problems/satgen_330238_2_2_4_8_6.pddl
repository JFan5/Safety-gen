; params: satgen 330238 2 2 4 8 6
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	spectrograph0 - mode
	image1 - mode
	image2 - mode
	image3 - mode
	Star0 - direction
	Star1 - direction
	GroundStation2 - direction
	GroundStation3 - direction
	GroundStation7 - direction
	GroundStation4 - direction
	GroundStation6 - direction
	GroundStation5 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Star10 - direction
	Planet11 - direction
	Planet12 - direction
	Phenomenon13 - direction
)
(:init
	(supports instrument0 image2)
	(supports instrument0 spectrograph0)
	(calibration_target instrument0 GroundStation6)
	(calibration_target instrument0 GroundStation4)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star0)
	(supports instrument1 image1)
	(supports instrument1 image2)
	(supports instrument1 image3)
	(calibration_target instrument1 GroundStation6)
	(calibration_target instrument1 GroundStation4)
	(supports instrument2 image2)
	(calibration_target instrument2 GroundStation5)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Planet8)
)
(:goal (and
	(have_image Planet8 spectrograph0)
	(have_image Phenomenon9 image3)
	(have_image Star10 image3)
	(have_image Planet11 image3)
	(have_image Planet12 image2)
	(have_image Phenomenon13 image1)
))

)
