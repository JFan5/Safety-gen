; params: satgen 292772 2 3 4 8 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	satellite1 - satellite
	instrument1 - instrument
	instrument2 - instrument
	image2 - mode
	spectrograph3 - mode
	infrared0 - mode
	thermograph1 - mode
	GroundStation1 - direction
	GroundStation5 - direction
	Star6 - direction
	GroundStation7 - direction
	Star0 - direction
	Star3 - direction
	GroundStation2 - direction
	Star4 - direction
	Phenomenon8 - direction
	Phenomenon9 - direction
	Planet10 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(supports instrument0 infrared0)
	(calibration_target instrument0 Star0)
	(calibration_target instrument0 GroundStation2)
	(on_board instrument0 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet10)
	(supports instrument1 thermograph1)
	(supports instrument1 image2)
	(supports instrument1 spectrograph3)
	(calibration_target instrument1 Star3)
	(supports instrument2 thermograph1)
	(calibration_target instrument2 Star4)
	(calibration_target instrument2 GroundStation2)
	(on_board instrument1 satellite1)
	(on_board instrument2 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star0)
)
(:goal (and
	(pointing satellite0 GroundStation7)
	(pointing satellite1 Star3)
	(have_image Phenomenon8 thermograph1)
	(have_image Phenomenon9 infrared0)
	(have_image Planet10 infrared0)
))

)
