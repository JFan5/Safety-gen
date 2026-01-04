(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_05 - type_1
obj_13 obj_11 obj_02 obj_09 - type_3
obj_14 obj_01 obj_07 obj_10 - type_2
obj_08 obj_06 obj_04 obj_03 - object)
(:init
(pred_2 obj_12 obj_07)
(pred_4 obj_12 obj_13)
(pred_4 obj_12 obj_11)
(pred_2 obj_05 obj_01)
(pred_4 obj_05 obj_02)
(pred_4 obj_05 obj_09)
(pred_1 obj_08 obj_01)
(pred_1 obj_06 obj_10)
(pred_1 obj_04 obj_10)
(pred_1 obj_03 obj_14)
)
(:goal
(and
(pred_1 obj_08 obj_07)
(pred_1 obj_06 obj_14)
(pred_1 obj_04 obj_10)
(pred_1 obj_03 obj_10)
)
)

(:constraints
  (always (not (pred_2 obj_12 obj_10)))
)
)