(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_03 obj_02 obj_01 obj_04 )
(:init
(pred_5)
(pred_1 obj_03 obj_01)
(pred_3 obj_02)
(pred_1 obj_01 obj_02)
(pred_1 obj_04 obj_03)
(pred_2 obj_04)
)
(:goal
(and
(pred_1 obj_02 obj_03)
(pred_1 obj_01 obj_04)
(pred_1 obj_04 obj_02))
)

(:constraints
  (sometime-before (pred_1 obj_01 obj_04) (pred_1 obj_02 obj_03))
)
)