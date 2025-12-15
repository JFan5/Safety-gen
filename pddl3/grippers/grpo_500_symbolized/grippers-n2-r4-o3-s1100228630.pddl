(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_11 - type_1
obj_13 obj_08 obj_09 obj_06 - type_3
obj_02 obj_07 obj_04 obj_03 - type_2
obj_10 obj_01 obj_05 - object)
(:init
(pred_3 obj_12 obj_02)
(pred_4 obj_12 obj_13)
(pred_4 obj_12 obj_08)
(pred_3 obj_11 obj_07)
(pred_4 obj_11 obj_09)
(pred_4 obj_11 obj_06)
(pred_2 obj_10 obj_07)
(pred_2 obj_01 obj_04)
(pred_2 obj_05 obj_03)
)
(:goal
(and
(pred_2 obj_10 obj_02)
(pred_2 obj_01 obj_02)
(pred_2 obj_05 obj_04)
)
)

(:constraints
  (always (not (pred_3 obj_12 obj_04)))
)
)