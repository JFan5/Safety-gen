(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_05 - type_1
obj_07 obj_03 obj_11 obj_09 - type_3
obj_08 obj_10 obj_12 obj_02 - type_2
obj_06 obj_04 obj_01 - object)
(:init
(pred_1 obj_13 obj_08)
(pred_2 obj_13 obj_07)
(pred_2 obj_13 obj_03)
(pred_1 obj_05 obj_02)
(pred_2 obj_05 obj_11)
(pred_2 obj_05 obj_09)
(pred_4 obj_06 obj_02)
(pred_4 obj_04 obj_10)
(pred_4 obj_01 obj_08)
)
(:goal
(and
(pred_4 obj_06 obj_02)
(pred_4 obj_04 obj_12)
(pred_4 obj_01 obj_10)
)
)

(:constraints
  (always (not (pred_1 obj_13 obj_12)))
)
)