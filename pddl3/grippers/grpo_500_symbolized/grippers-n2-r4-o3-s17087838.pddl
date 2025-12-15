(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_08 - type_1
obj_04 obj_10 obj_03 obj_09 - type_3
obj_05 obj_12 obj_01 obj_13 - type_2
obj_11 obj_06 obj_02 - object)
(:init
(pred_3 obj_07 obj_13)
(pred_4 obj_07 obj_04)
(pred_4 obj_07 obj_10)
(pred_3 obj_08 obj_05)
(pred_4 obj_08 obj_03)
(pred_4 obj_08 obj_09)
(pred_2 obj_11 obj_01)
(pred_2 obj_06 obj_05)
(pred_2 obj_02 obj_12)
)
(:goal
(and
(pred_2 obj_11 obj_05)
(pred_2 obj_06 obj_01)
(pred_2 obj_02 obj_01)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_01)))
)
)