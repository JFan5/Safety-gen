(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_06 - type_3
obj_09 obj_13 obj_04 obj_03 - type_2
obj_11 obj_02 obj_05 obj_10 - type_1
obj_01 obj_12 obj_07 - object)
(:init
(pred_3 obj_08 obj_05)
(pred_1 obj_08 obj_09)
(pred_1 obj_08 obj_13)
(pred_3 obj_06 obj_10)
(pred_1 obj_06 obj_04)
(pred_1 obj_06 obj_03)
(pred_4 obj_01 obj_11)
(pred_4 obj_12 obj_10)
(pred_4 obj_07 obj_02)
)
(:goal
(and
(pred_4 obj_01 obj_10)
(pred_4 obj_12 obj_10)
(pred_4 obj_07 obj_10)
)
)

(:constraints
  (always (not (pred_3 obj_08 obj_10)))
)
)