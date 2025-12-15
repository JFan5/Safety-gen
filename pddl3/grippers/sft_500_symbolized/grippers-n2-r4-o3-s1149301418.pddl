(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_04 - type_3
obj_13 obj_07 obj_05 obj_08 - type_1
obj_02 obj_01 obj_09 obj_12 - type_2
obj_06 obj_03 obj_11 - object)
(:init
(pred_1 obj_10 obj_09)
(pred_2 obj_10 obj_13)
(pred_2 obj_10 obj_07)
(pred_1 obj_04 obj_01)
(pred_2 obj_04 obj_05)
(pred_2 obj_04 obj_08)
(pred_3 obj_06 obj_01)
(pred_3 obj_03 obj_09)
(pred_3 obj_11 obj_02)
)
(:goal
(and
(pred_3 obj_06 obj_12)
(pred_3 obj_03 obj_12)
(pred_3 obj_11 obj_12)
)
)

(:constraints
  (always (not (pred_1 obj_10 obj_12)))
)
)