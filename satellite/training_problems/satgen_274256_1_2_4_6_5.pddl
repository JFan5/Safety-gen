; params: satgen 274256 1 2 4 6 5
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	thermograph0 - mode
	spectrograph3 - mode
	image1 - mode
	thermograph2 - mode
	Star0 - direction
	Star1 - direction
	GroundStation3 - direction
	Star5 - direction
	GroundStation4 - direction
	GroundStation2 - direction
	Phenomenon6 - direction
	Planet7 - direction
	Planet8 - direction
	Phenomenon9 - direction
	Star10 - direction
)
(:init
	(supports instrument0 thermograph2)
	(calibration_target instrument0 GroundStation4)
	(supports instrument1 thermograph0)
	(supports instrument1 thermograph2)
	(supports instrument1 image1)
	(supports instrument1 spectrograph3)
	(calibration_target instrument1 GroundStation2)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star10)
)
(:goal (and
	(have_image Phenomenon6 image1)
	(have_image Planet7 image1)
	(have_image Planet8 thermograph0)
	(have_image Phenomenon9 image1)
	(have_image Star10 image1)
))

)
