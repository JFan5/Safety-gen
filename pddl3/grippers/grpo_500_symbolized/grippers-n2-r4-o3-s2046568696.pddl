(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_01 - type_1
obj_05 obj_08 obj_12 obj_10 - type_3
obj_06 obj_02 obj_04 obj_09 - type_2
obj_03 obj_11 obj_07 - object)
(:init
(pred_4 obj_13 obj_02)
(pred_2 obj_13 obj_05)
(pred_2 obj_13 obj_08)
(pred_4 obj_01 obj_06)
(pred_2 obj_01 obj_12)
(pred_2 obj_01 obj_10)
(pred_3 obj_03 obj_04)
(pred_3 obj_11 obj_02)
(pred_3 obj_07 obj_09)
)
(:goal
(and
(pred_3 obj_03 obj_04)
(pred_3 obj_11 obj_04)
(pred_3 obj_07 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_13 obj_04)))
)
)