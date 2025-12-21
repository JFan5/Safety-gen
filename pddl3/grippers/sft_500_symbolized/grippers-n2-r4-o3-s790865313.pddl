(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_08 - type_1
obj_06 obj_02 obj_12 obj_03 - type_2
obj_11 obj_13 obj_05 obj_10 - type_3
obj_09 obj_04 obj_01 - object)
(:init
(pred_1 obj_07 obj_05)
(pred_3 obj_07 obj_06)
(pred_3 obj_07 obj_02)
(pred_1 obj_08 obj_13)
(pred_3 obj_08 obj_12)
(pred_3 obj_08 obj_03)
(pred_2 obj_09 obj_05)
(pred_2 obj_04 obj_13)
(pred_2 obj_01 obj_11)
)
(:goal
(and
(pred_2 obj_09 obj_10)
(pred_2 obj_04 obj_13)
(pred_2 obj_01 obj_10)
)
)

(:constraints
  (always (not (pred_1 obj_07 obj_10)))
)
)