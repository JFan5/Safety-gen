(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_07 - type_2
obj_03 obj_12 obj_08 obj_13 - type_3
obj_05 obj_11 obj_14 obj_02 - type_1
obj_06 obj_10 obj_04 obj_01 - object)
(:init
(pred_1 obj_09 obj_02)
(pred_4 obj_09 obj_03)
(pred_4 obj_09 obj_12)
(pred_1 obj_07 obj_02)
(pred_4 obj_07 obj_08)
(pred_4 obj_07 obj_13)
(pred_3 obj_06 obj_11)
(pred_3 obj_10 obj_02)
(pred_3 obj_04 obj_02)
(pred_3 obj_01 obj_14)
)
(:goal
(and
(pred_3 obj_06 obj_11)
(pred_3 obj_10 obj_14)
(pred_3 obj_04 obj_05)
(pred_3 obj_01 obj_11)
)
)

(:constraints
  (always (not (pred_1 obj_09 obj_14)))
)
)