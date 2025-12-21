(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_11 - type_1
obj_12 obj_06 obj_03 obj_09 - type_2
obj_13 obj_02 obj_04 obj_08 - type_3
obj_14 obj_05 obj_10 obj_01 - object)
(:init
(pred_1 obj_07 obj_08)
(pred_3 obj_07 obj_12)
(pred_3 obj_07 obj_06)
(pred_1 obj_11 obj_08)
(pred_3 obj_11 obj_03)
(pred_3 obj_11 obj_09)
(pred_2 obj_14 obj_08)
(pred_2 obj_05 obj_02)
(pred_2 obj_10 obj_08)
(pred_2 obj_01 obj_13)
)
(:goal
(and
(pred_2 obj_14 obj_02)
(pred_2 obj_05 obj_04)
(pred_2 obj_10 obj_04)
(pred_2 obj_01 obj_02)
)
)

(:constraints
  (always (not (pred_1 obj_07 obj_04)))
)
)