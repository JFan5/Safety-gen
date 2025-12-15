(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_11 - type_1
obj_03 obj_01 obj_05 obj_06 - type_3
obj_12 obj_02 obj_13 obj_10 - type_2
obj_09 obj_07 obj_08 obj_14 - object)
(:init
(pred_3 obj_04 obj_13)
(pred_2 obj_04 obj_03)
(pred_2 obj_04 obj_01)
(pred_3 obj_11 obj_12)
(pred_2 obj_11 obj_05)
(pred_2 obj_11 obj_06)
(pred_1 obj_09 obj_13)
(pred_1 obj_07 obj_10)
(pred_1 obj_08 obj_02)
(pred_1 obj_14 obj_12)
)
(:goal
(and
(pred_1 obj_09 obj_02)
(pred_1 obj_07 obj_13)
(pred_1 obj_08 obj_13)
(pred_1 obj_14 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_04 obj_10)))
)
)