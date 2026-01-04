(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_13 - type_3
obj_05 obj_03 obj_10 obj_11 - type_1
obj_01 obj_08 obj_02 obj_07 - type_2
obj_06 obj_09 obj_12 obj_04 - object)
(:init
(pred_2 obj_14 obj_01)
(pred_4 obj_14 obj_05)
(pred_4 obj_14 obj_03)
(pred_2 obj_13 obj_07)
(pred_4 obj_13 obj_10)
(pred_4 obj_13 obj_11)
(pred_1 obj_06 obj_02)
(pred_1 obj_09 obj_01)
(pred_1 obj_12 obj_01)
(pred_1 obj_04 obj_02)
)
(:goal
(and
(pred_1 obj_06 obj_01)
(pred_1 obj_09 obj_02)
(pred_1 obj_12 obj_07)
(pred_1 obj_04 obj_01)
)
)

(:constraints
  (always (not (pred_2 obj_14 obj_02)))
)
)