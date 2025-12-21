(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_01 - type_1
obj_13 obj_02 obj_07 obj_10 - type_3
obj_12 obj_04 obj_08 obj_11 - type_2
obj_06 obj_05 obj_09 - object)
(:init
(pred_4 obj_03 obj_11)
(pred_2 obj_03 obj_13)
(pred_2 obj_03 obj_02)
(pred_4 obj_01 obj_11)
(pred_2 obj_01 obj_07)
(pred_2 obj_01 obj_10)
(pred_3 obj_06 obj_04)
(pred_3 obj_05 obj_11)
(pred_3 obj_09 obj_08)
)
(:goal
(and
(pred_3 obj_06 obj_11)
(pred_3 obj_05 obj_11)
(pred_3 obj_09 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_03 obj_08)))
)
)