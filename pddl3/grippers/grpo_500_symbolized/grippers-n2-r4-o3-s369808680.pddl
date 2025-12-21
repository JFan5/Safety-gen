(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_03 - type_1
obj_13 obj_02 obj_07 obj_04 - type_3
obj_09 obj_08 obj_11 obj_12 - type_2
obj_06 obj_10 obj_01 - object)
(:init
(pred_4 obj_05 obj_11)
(pred_2 obj_05 obj_13)
(pred_2 obj_05 obj_02)
(pred_4 obj_03 obj_11)
(pred_2 obj_03 obj_07)
(pred_2 obj_03 obj_04)
(pred_3 obj_06 obj_09)
(pred_3 obj_10 obj_09)
(pred_3 obj_01 obj_12)
)
(:goal
(and
(pred_3 obj_06 obj_08)
(pred_3 obj_10 obj_11)
(pred_3 obj_01 obj_08)
)
)

(:constraints
  (always (not (pred_4 obj_05 obj_12)))
)
)