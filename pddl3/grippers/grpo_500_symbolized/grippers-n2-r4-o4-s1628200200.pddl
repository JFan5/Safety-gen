(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_03 - type_1
obj_11 obj_07 obj_05 obj_09 - type_3
obj_10 obj_13 obj_01 obj_12 - type_2
obj_06 obj_08 obj_02 obj_04 - object)
(:init
(pred_3 obj_14 obj_01)
(pred_4 obj_14 obj_11)
(pred_4 obj_14 obj_07)
(pred_3 obj_03 obj_01)
(pred_4 obj_03 obj_05)
(pred_4 obj_03 obj_09)
(pred_2 obj_06 obj_13)
(pred_2 obj_08 obj_13)
(pred_2 obj_02 obj_01)
(pred_2 obj_04 obj_12)
)
(:goal
(and
(pred_2 obj_06 obj_01)
(pred_2 obj_08 obj_13)
(pred_2 obj_02 obj_01)
(pred_2 obj_04 obj_13)
)
)

(:constraints
  (always (not (pred_3 obj_14 obj_12)))
)
)