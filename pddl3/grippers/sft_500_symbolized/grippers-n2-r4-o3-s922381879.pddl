(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_09 - type_1
obj_06 obj_07 obj_04 obj_12 - type_2
obj_01 obj_08 obj_13 obj_02 - type_3
obj_03 obj_11 obj_10 - object)
(:init
(pred_1 obj_05 obj_13)
(pred_3 obj_05 obj_06)
(pred_3 obj_05 obj_07)
(pred_1 obj_09 obj_08)
(pred_3 obj_09 obj_04)
(pred_3 obj_09 obj_12)
(pred_2 obj_03 obj_13)
(pred_2 obj_11 obj_13)
(pred_2 obj_10 obj_02)
)
(:goal
(and
(pred_2 obj_03 obj_13)
(pred_2 obj_11 obj_02)
(pred_2 obj_10 obj_02)
)
)

(:constraints
  (always (not (pred_1 obj_05 obj_02)))
)
)