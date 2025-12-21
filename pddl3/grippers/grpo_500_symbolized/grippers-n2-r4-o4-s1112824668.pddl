(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_03 - type_1
obj_09 obj_10 obj_11 obj_14 - type_3
obj_05 obj_02 obj_01 obj_12 - type_2
obj_04 obj_06 obj_07 obj_13 - object)
(:init
(pred_4 obj_08 obj_01)
(pred_2 obj_08 obj_09)
(pred_2 obj_08 obj_10)
(pred_4 obj_03 obj_02)
(pred_2 obj_03 obj_11)
(pred_2 obj_03 obj_14)
(pred_3 obj_04 obj_01)
(pred_3 obj_06 obj_12)
(pred_3 obj_07 obj_12)
(pred_3 obj_13 obj_02)
)
(:goal
(and
(pred_3 obj_04 obj_01)
(pred_3 obj_06 obj_01)
(pred_3 obj_07 obj_12)
(pred_3 obj_13 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_08 obj_12)))
)
)