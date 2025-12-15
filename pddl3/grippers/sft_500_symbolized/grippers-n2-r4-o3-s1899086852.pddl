(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_07 - type_1
obj_05 obj_11 obj_06 obj_08 - type_2
obj_03 obj_04 obj_02 obj_12 - type_3
obj_09 obj_10 obj_01 - object)
(:init
(pred_3 obj_13 obj_02)
(pred_1 obj_13 obj_05)
(pred_1 obj_13 obj_11)
(pred_3 obj_07 obj_04)
(pred_1 obj_07 obj_06)
(pred_1 obj_07 obj_08)
(pred_4 obj_09 obj_03)
(pred_4 obj_10 obj_04)
(pred_4 obj_01 obj_04)
)
(:goal
(and
(pred_4 obj_09 obj_12)
(pred_4 obj_10 obj_02)
(pred_4 obj_01 obj_12)
)
)

(:constraints
  (always (not (pred_3 obj_13 obj_12)))
)
)