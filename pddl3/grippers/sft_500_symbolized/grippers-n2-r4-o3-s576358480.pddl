(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_04 - type_2
obj_05 obj_03 obj_10 obj_09 - type_3
obj_02 obj_08 obj_12 obj_07 - type_1
obj_11 obj_13 obj_01 - object)
(:init
(pred_3 obj_06 obj_08)
(pred_2 obj_06 obj_05)
(pred_2 obj_06 obj_03)
(pred_3 obj_04 obj_07)
(pred_2 obj_04 obj_10)
(pred_2 obj_04 obj_09)
(pred_1 obj_11 obj_12)
(pred_1 obj_13 obj_07)
(pred_1 obj_01 obj_12)
)
(:goal
(and
(pred_1 obj_11 obj_08)
(pred_1 obj_13 obj_12)
(pred_1 obj_01 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_06 obj_12)))
)
)