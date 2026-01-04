(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_07 - type_3
obj_04 obj_03 obj_02 obj_12 - type_2
obj_01 obj_11 obj_10 obj_05 - type_1
obj_14 obj_13 obj_06 obj_09 - object)
(:init
(pred_3 obj_08 obj_01)
(pred_2 obj_08 obj_04)
(pred_2 obj_08 obj_03)
(pred_3 obj_07 obj_05)
(pred_2 obj_07 obj_02)
(pred_2 obj_07 obj_12)
(pred_1 obj_14 obj_01)
(pred_1 obj_13 obj_10)
(pred_1 obj_06 obj_11)
(pred_1 obj_09 obj_05)
)
(:goal
(and
(pred_1 obj_14 obj_01)
(pred_1 obj_13 obj_01)
(pred_1 obj_06 obj_01)
(pred_1 obj_09 obj_01)
)
)

(:constraints
  (always (not (pred_3 obj_08 obj_10)))
)
)