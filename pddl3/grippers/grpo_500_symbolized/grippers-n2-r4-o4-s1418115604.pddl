(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_02 - type_1
obj_10 obj_11 obj_14 obj_03 - type_3
obj_09 obj_06 obj_08 obj_04 - type_2
obj_05 obj_13 obj_07 obj_12 - object)
(:init
(pred_3 obj_01 obj_08)
(pred_4 obj_01 obj_10)
(pred_4 obj_01 obj_11)
(pred_3 obj_02 obj_06)
(pred_4 obj_02 obj_14)
(pred_4 obj_02 obj_03)
(pred_2 obj_05 obj_08)
(pred_2 obj_13 obj_04)
(pred_2 obj_07 obj_04)
(pred_2 obj_12 obj_09)
)
(:goal
(and
(pred_2 obj_05 obj_08)
(pred_2 obj_13 obj_09)
(pred_2 obj_07 obj_09)
(pred_2 obj_12 obj_04)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_04)))
)
)