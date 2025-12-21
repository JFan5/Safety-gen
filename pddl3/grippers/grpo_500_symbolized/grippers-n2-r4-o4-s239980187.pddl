(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_07 - type_1
obj_11 obj_13 obj_08 obj_05 - type_3
obj_06 obj_10 obj_09 obj_04 - type_2
obj_12 obj_01 obj_14 obj_02 - object)
(:init
(pred_4 obj_03 obj_09)
(pred_2 obj_03 obj_11)
(pred_2 obj_03 obj_13)
(pred_4 obj_07 obj_06)
(pred_2 obj_07 obj_08)
(pred_2 obj_07 obj_05)
(pred_3 obj_12 obj_04)
(pred_3 obj_01 obj_10)
(pred_3 obj_14 obj_09)
(pred_3 obj_02 obj_04)
)
(:goal
(and
(pred_3 obj_12 obj_10)
(pred_3 obj_01 obj_04)
(pred_3 obj_14 obj_09)
(pred_3 obj_02 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_03 obj_04)))
)
)