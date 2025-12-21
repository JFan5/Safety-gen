(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_08 - type_1
obj_04 obj_03 obj_12 obj_13 - type_3
obj_09 obj_06 obj_01 obj_05 - type_2
obj_02 obj_11 obj_10 - object)
(:init
(pred_4 obj_07 obj_05)
(pred_2 obj_07 obj_04)
(pred_2 obj_07 obj_03)
(pred_4 obj_08 obj_06)
(pred_2 obj_08 obj_12)
(pred_2 obj_08 obj_13)
(pred_3 obj_02 obj_01)
(pred_3 obj_11 obj_09)
(pred_3 obj_10 obj_01)
)
(:goal
(and
(pred_3 obj_02 obj_06)
(pred_3 obj_11 obj_01)
(pred_3 obj_10 obj_09)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_01)))
)
)