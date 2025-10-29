; params: satgen 41079 2 3 3 7 3
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	satellite1 - satellite
	instrument3 - instrument
	instrument4 - instrument
	instrument5 - instrument
	spectrograph1 - mode
	image2 - mode
	thermograph0 - mode
	GroundStation5 - direction
	Star6 - direction
	Star1 - direction
	Star3 - direction
	GroundStation2 - direction
	GroundStation4 - direction
	Star0 - direction
	Planet7 - direction
	Star8 - direction
	Phenomenon9 - direction
)
(:init
	(supports instrument0 spectrograph1)
	(calibration_target instrument0 GroundStation4)
	(supports instrument1 spectrograph1)
	(calibration_target instrument1 Star0)
	(calibration_target instrument1 GroundStation4)
	(supports instrument2 thermograph0)
	(supports instrument2 spectrograph1)
	(calibration_target instrument2 GroundStation2)
	(calibration_target instrument2 Star1)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Star8)
	(supports instrument3 image2)
	(calibration_target instrument3 GroundStation2)
	(calibration_target instrument3 Star3)
	(supports instrument4 image2)
	(supports instrument4 spectrograph1)
	(supports instrument4 thermograph0)
	(calibration_target instrument4 GroundStation4)
	(supports instrument5 spectrograph1)
	(supports instrument5 thermograph0)
	(calibration_target instrument5 Star0)
	(on_board instrument3 satellite1)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star3)
)
(:goal (and
	(have_image Planet7 spectrograph1)
	(have_image Star8 image2)
	(have_image Phenomenon9 spectrograph1)
))

)
