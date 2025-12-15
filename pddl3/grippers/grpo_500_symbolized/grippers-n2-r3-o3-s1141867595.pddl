(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_03 obj_11 - type_1
obj_02 obj_12 obj_09 obj_05 - type_3
obj_04 obj_10 obj_01 - type_2
obj_06 obj_08 obj_07 - object)
(:init
(pred_3 obj_03 obj_04)
(pred_4 obj_03 obj_02)
(pred_4 obj_03 obj_12)
(pred_3 obj_11 obj_10)
(pred_4 obj_11 obj_09)
(pred_4 obj_11 obj_05)
(pred_2 obj_06 obj_04)
(pred_2 obj_08 obj_10)
(pred_2 obj_07 obj_04)
)
(:goal
(and
(pred_2 obj_06 obj_01)
(pred_2 obj_08 obj_01)
(pred_2 obj_07 obj_04)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_01)))
)
)