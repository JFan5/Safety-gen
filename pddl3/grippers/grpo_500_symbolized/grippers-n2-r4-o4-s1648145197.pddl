(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_08 - type_1
obj_03 obj_09 obj_14 obj_10 - type_3
obj_12 obj_13 obj_01 obj_04 - type_2
obj_06 obj_05 obj_07 obj_11 - object)
(:init
(pred_3 obj_02 obj_04)
(pred_4 obj_02 obj_03)
(pred_4 obj_02 obj_09)
(pred_3 obj_08 obj_12)
(pred_4 obj_08 obj_14)
(pred_4 obj_08 obj_10)
(pred_2 obj_06 obj_04)
(pred_2 obj_05 obj_01)
(pred_2 obj_07 obj_04)
(pred_2 obj_11 obj_12)
)
(:goal
(and
(pred_2 obj_06 obj_01)
(pred_2 obj_05 obj_04)
(pred_2 obj_07 obj_12)
(pred_2 obj_11 obj_13)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_01)))
)
)