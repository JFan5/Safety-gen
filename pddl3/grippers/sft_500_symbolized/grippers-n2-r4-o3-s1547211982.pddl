(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_11 - type_2
obj_05 obj_07 obj_10 obj_03 - type_3
obj_04 obj_06 obj_12 obj_08 - type_1
obj_02 obj_13 obj_01 - object)
(:init
(pred_4 obj_09 obj_08)
(pred_2 obj_09 obj_05)
(pred_2 obj_09 obj_07)
(pred_4 obj_11 obj_08)
(pred_2 obj_11 obj_10)
(pred_2 obj_11 obj_03)
(pred_3 obj_02 obj_04)
(pred_3 obj_13 obj_12)
(pred_3 obj_01 obj_12)
)
(:goal
(and
(pred_3 obj_02 obj_12)
(pred_3 obj_13 obj_12)
(pred_3 obj_01 obj_08)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_12)))
)
)