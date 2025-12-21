(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_08 - type_1
obj_05 obj_09 obj_02 obj_03 - type_3
obj_04 obj_10 obj_11 obj_01 - type_2
obj_13 obj_12 obj_07 - object)
(:init
(pred_4 obj_06 obj_11)
(pred_2 obj_06 obj_05)
(pred_2 obj_06 obj_09)
(pred_4 obj_08 obj_04)
(pred_2 obj_08 obj_02)
(pred_2 obj_08 obj_03)
(pred_3 obj_13 obj_11)
(pred_3 obj_12 obj_01)
(pred_3 obj_07 obj_01)
)
(:goal
(and
(pred_3 obj_13 obj_11)
(pred_3 obj_12 obj_11)
(pred_3 obj_07 obj_01)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_01)))
)
)