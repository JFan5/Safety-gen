(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_12 - type_1
obj_03 obj_09 obj_08 obj_06 - type_2
obj_13 obj_10 obj_04 obj_05 - type_3
obj_01 obj_11 obj_14 obj_02 - object)
(:init
(pred_1 obj_07 obj_13)
(pred_3 obj_07 obj_03)
(pred_3 obj_07 obj_09)
(pred_1 obj_12 obj_10)
(pred_3 obj_12 obj_08)
(pred_3 obj_12 obj_06)
(pred_2 obj_01 obj_04)
(pred_2 obj_11 obj_13)
(pred_2 obj_14 obj_04)
(pred_2 obj_02 obj_05)
)
(:goal
(and
(pred_2 obj_01 obj_10)
(pred_2 obj_11 obj_13)
(pred_2 obj_14 obj_04)
(pred_2 obj_02 obj_04)
)
)

(:constraints
  (always (not (pred_1 obj_07 obj_04)))
)
)