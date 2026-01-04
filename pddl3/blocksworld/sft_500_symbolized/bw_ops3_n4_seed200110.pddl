(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_02 obj_04 obj_01 obj_03 )
(:init
(pred_4)
(pred_2 obj_02)
(pred_5 obj_04 obj_03)
(pred_2 obj_01)
(pred_2 obj_03)
(pred_1 obj_02)
(pred_1 obj_04)
(pred_1 obj_01)
)
(:goal
(and
(pred_5 obj_02 obj_03)
(pred_2 obj_04)
(pred_2 obj_01)
(pred_2 obj_03))
)

(:constraints
  (sometime-before (pred_2 obj_04) (pred_5 obj_02 obj_03))
)
)