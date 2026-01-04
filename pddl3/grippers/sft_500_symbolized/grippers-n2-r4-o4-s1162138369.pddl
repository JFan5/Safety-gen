(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_04 - type_2
obj_02 obj_09 obj_10 obj_11 - type_3
obj_14 obj_07 obj_01 obj_12 - type_1
obj_05 obj_08 obj_06 obj_13 - object)
(:init
(pred_4 obj_03 obj_12)
(pred_1 obj_03 obj_02)
(pred_1 obj_03 obj_09)
(pred_4 obj_04 obj_01)
(pred_1 obj_04 obj_10)
(pred_1 obj_04 obj_11)
(pred_3 obj_05 obj_01)
(pred_3 obj_08 obj_14)
(pred_3 obj_06 obj_07)
(pred_3 obj_13 obj_01)
)
(:goal
(and
(pred_3 obj_05 obj_12)
(pred_3 obj_08 obj_01)
(pred_3 obj_06 obj_01)
(pred_3 obj_13 obj_14)
)
)

(:constraints
  (always (not (pred_4 obj_03 obj_01)))
)
)