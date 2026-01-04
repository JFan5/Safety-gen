(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_14 - type_1
obj_11 obj_12 obj_10 obj_05 - type_3
obj_02 obj_03 obj_08 obj_01 - type_2
obj_09 obj_06 obj_07 obj_13 - object)
(:init
(pred_1 obj_04 obj_01)
(pred_3 obj_04 obj_11)
(pred_3 obj_04 obj_12)
(pred_1 obj_14 obj_01)
(pred_3 obj_14 obj_10)
(pred_3 obj_14 obj_05)
(pred_4 obj_09 obj_01)
(pred_4 obj_06 obj_03)
(pred_4 obj_07 obj_01)
(pred_4 obj_13 obj_02)
)
(:goal
(and
(pred_4 obj_09 obj_03)
(pred_4 obj_06 obj_08)
(pred_4 obj_07 obj_08)
(pred_4 obj_13 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_04 obj_08)))
)
)