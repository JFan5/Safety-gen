(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_07 - type_1
obj_12 obj_08 obj_11 obj_10 - type_3
obj_06 obj_14 obj_09 obj_04 - type_2
obj_05 obj_02 obj_01 obj_03 - object)
(:init
(pred_4 obj_13 obj_04)
(pred_2 obj_13 obj_12)
(pred_2 obj_13 obj_08)
(pred_4 obj_07 obj_09)
(pred_2 obj_07 obj_11)
(pred_2 obj_07 obj_10)
(pred_3 obj_05 obj_14)
(pred_3 obj_02 obj_04)
(pred_3 obj_01 obj_14)
(pred_3 obj_03 obj_06)
)
(:goal
(and
(pred_3 obj_05 obj_06)
(pred_3 obj_02 obj_14)
(pred_3 obj_01 obj_04)
(pred_3 obj_03 obj_09)
)
)

(:constraints
  (always (not (pred_4 obj_13 obj_09)))
)
)