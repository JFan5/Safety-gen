(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_03 obj_04 obj_02 obj_01 )
(:init
(pred_2)
(pred_1 obj_03)
(pred_4 obj_04 obj_03)
(pred_4 obj_02 obj_01)
(pred_1 obj_01)
(pred_5 obj_04)
(pred_5 obj_02)
)
(:goal
(and
(pred_4 obj_03 obj_02)
(pred_1 obj_04)
(pred_1 obj_02)
(pred_4 obj_01 obj_03))
)

(:constraints
  (sometime-before (pred_1 obj_04) (pred_4 obj_03 obj_02))
)
)