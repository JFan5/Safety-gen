(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_01 - type_1
obj_08 obj_11 obj_09 obj_10 - type_3
obj_13 obj_03 obj_14 obj_02 - type_2
obj_05 obj_07 obj_06 obj_04 - object)
(:init
(pred_1 obj_12 obj_03)
(pred_3 obj_12 obj_08)
(pred_3 obj_12 obj_11)
(pred_1 obj_01 obj_03)
(pred_3 obj_01 obj_09)
(pred_3 obj_01 obj_10)
(pred_4 obj_05 obj_03)
(pred_4 obj_07 obj_02)
(pred_4 obj_06 obj_03)
(pred_4 obj_04 obj_14)
)
(:goal
(and
(pred_4 obj_05 obj_14)
(pred_4 obj_07 obj_14)
(pred_4 obj_06 obj_03)
(pred_4 obj_04 obj_02)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_14)))
)
)