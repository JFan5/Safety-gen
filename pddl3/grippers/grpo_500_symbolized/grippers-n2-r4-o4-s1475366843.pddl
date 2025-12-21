(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_04 - type_1
obj_07 obj_14 obj_12 obj_10 - type_3
obj_09 obj_06 obj_02 obj_03 - type_2
obj_01 obj_05 obj_08 obj_13 - object)
(:init
(pred_4 obj_11 obj_02)
(pred_2 obj_11 obj_07)
(pred_2 obj_11 obj_14)
(pred_4 obj_04 obj_02)
(pred_2 obj_04 obj_12)
(pred_2 obj_04 obj_10)
(pred_3 obj_01 obj_02)
(pred_3 obj_05 obj_02)
(pred_3 obj_08 obj_02)
(pred_3 obj_13 obj_02)
)
(:goal
(and
(pred_3 obj_01 obj_09)
(pred_3 obj_05 obj_03)
(pred_3 obj_08 obj_09)
(pred_3 obj_13 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_03)))
)
)