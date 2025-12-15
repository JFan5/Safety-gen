(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_10 - type_2
obj_07 obj_04 obj_03 obj_13 - type_3
obj_02 obj_11 obj_05 obj_08 - type_1
obj_12 obj_09 obj_06 - object)
(:init
(pred_2 obj_01 obj_02)
(pred_3 obj_01 obj_07)
(pred_3 obj_01 obj_04)
(pred_2 obj_10 obj_11)
(pred_3 obj_10 obj_03)
(pred_3 obj_10 obj_13)
(pred_4 obj_12 obj_02)
(pred_4 obj_09 obj_02)
(pred_4 obj_06 obj_08)
)
(:goal
(and
(pred_4 obj_12 obj_08)
(pred_4 obj_09 obj_05)
(pred_4 obj_06 obj_11)
)
)

(:constraints
  (always (not (pred_2 obj_01 obj_05)))
)
)