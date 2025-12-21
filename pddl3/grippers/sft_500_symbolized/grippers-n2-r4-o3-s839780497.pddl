(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_03 - type_1
obj_06 obj_09 obj_04 obj_12 - type_2
obj_11 obj_01 obj_13 obj_10 - type_3
obj_02 obj_05 obj_08 - object)
(:init
(pred_1 obj_07 obj_10)
(pred_3 obj_07 obj_06)
(pred_3 obj_07 obj_09)
(pred_1 obj_03 obj_10)
(pred_3 obj_03 obj_04)
(pred_3 obj_03 obj_12)
(pred_2 obj_02 obj_13)
(pred_2 obj_05 obj_11)
(pred_2 obj_08 obj_13)
)
(:goal
(and
(pred_2 obj_02 obj_10)
(pred_2 obj_05 obj_13)
(pred_2 obj_08 obj_11)
)
)

(:constraints
  (always (not (pred_1 obj_07 obj_13)))
)
)